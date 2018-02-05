//
//  ZZTraceItem.m
//  ZZKit
//
//  Created by ZongzhuHe on 2018/2/4.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import "ZZTraceItem.h"
@interface ZZTraceItem()
@property (nonatomic , copy) NSArray *threadInfo;
@property (nonatomic , strong) NSRecursiveLock *recursiveLock;
@property (readwrite, strong, nonatomic) NSMutableArray *subList;
@property (readwrite, strong, nonatomic) NSMutableDictionary *otherData;
@end

@implementation ZZTraceItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        _time_start = 0;
        _time_finish = 0;
        _time_exclusive = 0;
        _otherData = [NSMutableDictionary dictionary];
        _subList = [NSMutableArray arrayWithCapacity:10];
        _ignore = NO;
        _isClosed = NO;
        _recursiveLock = [[NSRecursiveLock alloc] init];
    }
    return self;
}
- (void)calculate_time_excWithSub{
    [self lock];
    int64_t time;
    if (self.subList.count) {
        int64_t count = 0;
        for (ZZTraceItem *item in self.subList) {
            count = item.time_finish + count - item.time_finish;
        }
        time = self.time_finish - count;
    }else{
        time = self.time_finish;
    }
    self.time_exclusive = time - self.time_start;
    
    [self unlock];
}
- (NSArray *)renderByAbsoluteTime:(int64_t)time{
    int64_t absoluteTime = time;
    if (self.isClosed) {
        NSMutableArray *subItems = [NSMutableArray array];
        [_recursiveLock lock];
        if (self.subList.count != 0) {
            for (ZZTraceItem *item in self.subList) {
                if (!item.ignore && item.isClosed) {
                    [item renderByAbsoluteTime:absoluteTime];
                    [subItems addObject:item];
                }
            }
        }
        [_recursiveLock unlock];
        if (!self.threadInfo) {
            NSString *threadName = self.otherData[@"threadName"];
            NSNumber *threadId = @([self.otherData[@"threadId"] intValue]);
            self.threadInfo = @[threadId,threadName];
            [self.otherData removeObjectForKey:@"threadId"];
            [self.otherData removeObjectForKey:@"threadName"];
        }
        
        NSString *url = self.otherData[@"url"];
        if (url && url.length >= 0x401) {
            url = [url substringToIndex:0x400];
            self.otherData[@"url"] = url;
        }
        
        
        return @[@(self.time_start - absoluteTime),
                 @(self.time_finish - absoluteTime),
                 self.key,
                 self.threadInfo,
                 self.otherData,
                 subItems];

    }else{
        return @[];
    }
}

- (void)copyFrom:(ZZTraceItem *)item{
    if (item) {
        self.time_start = item.time_start;
        self.time_finish = item.time_finish;
        self.key = item.key;
        self.time_exclusive = item.time_exclusive;
        self.mem_1 = item.mem_1;
        self.mem_2 = item.mem_2;
        self.cpu_1 = item.cpu_1;
        self.cpu_2 = item.cpu_2;
        self.ignore = item.ignore;
        [self.recursiveLock lock];
        [self.subList removeAllObjects];
        if (item.subList.count) {
            for (ZZTraceItem *obj in item.subList) {
                ZZTraceItem*newItem = [ZZTraceItem new];
                [newItem copyFrom:obj];
                [self.subList addObject:newItem];
            }
        }
        [self.recursiveLock unlock];
        self.otherData = [NSMutableDictionary dictionaryWithDictionary:item.otherData];
    }
}
- (ZZTraceItem *)taillorWithTM1:(int64_t)tm1 andWithTM2:(int64_t)tm2{
    if (self.ignore || (self.time_finish == self.time_start)) {
        return nil;
    }
    
    if (self.time_finish <= tm2 && self.time_start >= tm1) {
        return self;
    }
    
    if (self.time_finish > tm1 && self.time_start < tm2) {
        if (!self.subList.count) {
            return self;
        }
        ZZTraceItem *item = [ZZTraceItem new];
        item.key = self.key;
        item.category = self.category;
        item.classNm = self.classNm;
        item.methodNm = self.methodNm;
        [item.otherData setValuesForKeysWithDictionary:self.otherData];
        [self.recursiveLock lock];
        if (self.subList.count) {
            for (ZZTraceItem *obj in self.subList) {
                ZZTraceItem*newItem = [obj taillorWithTM1:tm1 andWithTM2:tm2];
                if (newItem) {
                    [item.subList addObject:newItem];
                }
            }
        }
        [self.recursiveLock unlock];
        
        if (item.subList.count) {
            ZZTraceItem *subItem = [item.subList firstObject];
            item.time_start = subItem.time_start;
            item.cpu_1 = subItem.cpu_1;
            item.mem_1 = subItem.mem_1;
            subItem = [item.subList lastObject];
            item.time_finish = subItem.time_finish;
            item.cpu_2 = subItem.cpu_2;
            item.mem_2 = subItem.mem_2;
            [item calculate_time_excWithSub];
        }
        
        return item;
    }else{
        return nil;
    }
}
- (int)threadId{
    NSNumber * threadId = self.otherData[@"threadId"];
    if (threadId) {
        return [threadId intValue];
    }else{
        return 1;
    }
}
@end

