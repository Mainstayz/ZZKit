//
//  ZZTraceTree.m
//  ZZKit
//
//  Created by mac on 2018/2/5.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import "ZZTraceTree.h"
#import "ZZStack.h"

@interface ZZTraceTree ()
@property(readwrite, nonatomic, assign) BOOL flag;
@property (nonatomic, strong) ZZStack *stack;
@end

@implementation ZZTraceTree
- (instancetype)init
{
    self = [super init];
    if (self) {
        _stack = [ZZStack defaultStack];
        _root = [ZZTraceItem new];
        _flag = NO;
        _isAbsTime = YES;
    }
    return self;
}
+ (ZZTraceTree *)traceTreeWithThreadId:(NSString *)threadId{
    ZZTraceTree *tree = [ZZTraceTree new];
    tree.threadId = threadId;
    tree.root.key = threadId;
    tree.root.otherData[@"threadId"] = threadId;
    tree.root.otherData[@"threadName"] = threadId;
    return tree;
}
+ (ZZTraceTree *)traceTreeWithRoot:(ZZTraceItem *)root{
    ZZTraceTree *tree = nil;
    if (root) {
        tree = [ZZTraceTree new];
        tree.root = root;
    }
    return tree;
}
+ (ZZTraceTree *)traceTreeCopyFrom:(ZZTraceTree *)tree{
    ZZTraceTree *aTree = nil;
    if (tree) {
        aTree = [ZZTraceTree new];
        aTree.threadId = tree.threadId;
        [aTree.root copyFrom:tree.root];
    }
    return aTree;
}
- (void)push:(ZZTraceItem *)item{
    if (self.isAbsTime) {
        item.time_exclusive = 0;
        int64_t start = [item time_start];
        item.time_finish = start;
        item.ignore = YES;
        ZZTraceItem *lastItem = nil;
        if ([self.stack isEmpty]) {
            lastItem = self.root;
            lastItem.time_finish = item.time_finish;
            if (!self.flag) {
                self.root.time_start = item.time_start;
                self.flag = YES;
            }
        }else{
             lastItem =[self.stack peer];
        }
        [lastItem.subList addObject:item];
        [self.stack push:item];
    }
}
- (ZZTraceItem *)pop{
    ZZTraceItem *item = nil;
    if (self.isAbsTime) {
        item = [self.stack pop];
        if (item) {
            item.ignore = NO;
            if ([self.stack isEmpty]) {
                self.root.time_finish = item.time_finish;
            }
        }
    }
    return item;
}
- (ZZTraceItem *)peer{
    return  [self.stack peer];
}
- (NSArray *)renderWithStartTime:(int64_t)time{
    [self lock];
    NSMutableArray *items = [NSMutableArray array];
    for (ZZTraceItem *item in self.root.subList) {
        NSArray *array = [item renderByAbsoluteTime:time];
        if (array) {
            [items addObject:array];
        }
    }
    [self unlock];
    return items;
}
- (int64_t)startTime{
    return [self.root time_start];
}
- (int64_t)finishTime{
    return [self.root time_finish];
}
- (void)mergeOtherTree:(ZZTraceTree *)tree{
    [self lock];
    if ([self.threadId isEqualToString:tree.threadId]) {
        self.root.time_finish = tree.root.time_start;
        [self.root.subList addObject:tree.root.subList];
    }
    [self unlock];
    
}
- (ZZTraceTree *)tailoerFrom:(int64_t)tm1 to:(int64_t)tm2{
    ZZTraceTree *tree = nil;
    if (self.root.subList.count) {
        if((self.root.time_start >= tm1) && (self.root.time_finish <= tm2)){
            tree = self;
        }else{
            if (self.root.time_start < tm2 && self.root.time_finish > tm1)  {
                ZZTraceItem *taillor = [self.root taillorWithTM1:tm1 andWithTM2:tm2];
                tree = [ZZTraceTree traceTreeWithRoot:taillor];
                tree.threadId = self.threadId;
                tree.parentVCS = self.parentVCS;
            }
        }
    }
    return tree;
}
- (BOOL)isClosed{
    return [self.stack isEmpty];
}
@end
