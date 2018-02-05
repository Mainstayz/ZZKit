//
//  ZZTraceTree.h
//  ZZKit
//
//  Created by mac on 2018/2/5.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZTraceItem.h"


@interface ZZTraceTree : NSLock
@property(strong, nonatomic) NSNumber *parentVCS;
@property(readonly, nonatomic, assign) BOOL isAbsTime;
@property(strong, nonatomic) ZZTraceItem *root;
@property(copy, nonatomic) NSString *threadId;
+ (ZZTraceTree *)traceTreeCopyFrom:(ZZTraceTree *)tree;
+ (ZZTraceTree *)traceTreeWithRoot:(ZZTraceItem *)root;
+ (ZZTraceTree *)traceTreeWithThreadId:(NSString *)threadId;

- (BOOL)isClosed;
- (id)tailoerFrom:(int64_t)tm1 to:(int64_t)tm2;
- (void)mergeOtherTree:(ZZTraceTree *)tree;
- (int64_t)finishTime;
- (int64_t)startTime;
- (id)renderWithStartTime:(int64_t)arg1;
- (id)peer;
- (id)pop;
- (void)push:(id)arg1;
@end
