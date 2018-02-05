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
@property(readonly, nonatomic, assign) BOOL flag;
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
@end
