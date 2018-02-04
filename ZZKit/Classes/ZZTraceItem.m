//
//  ZZTraceItem.m
//  ZZKit
//
//  Created by ZongzhuHe on 2018/2/4.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import "ZZTraceItem.h"
@interface ZZTraceItem(){
    NSRecursiveLock *_recursiveLock;
}
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
@end
