//
//  ZZTraceItem.h
//  ZZKit
//
//  Created by ZongzhuHe on 2018/2/4.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZTraceItem : NSLock
@property (readonly, strong, nonatomic) NSMutableArray *subList;
@property (retain, nonatomic) NSString *methodNm;
@property (retain, nonatomic) NSString *classNm;
@property (assign, nonatomic,) NSInteger category;
@property (assign, nonatomic,) BOOL isClosed;
@property (assign, nonatomic,) BOOL ignore;
@property (readonly, strong, nonatomic) NSMutableDictionary *otherData;
@property (retain, nonatomic) NSString *key;
@property (assign, nonatomic,) NSInteger cpu_2;
@property (assign, nonatomic,) NSInteger cpu_1;
@property (assign, nonatomic,) int64_t mem_2;
@property (assign, nonatomic,) int64_t mem_1;
@property (assign, nonatomic,) int64_t time_start;
@property (assign, nonatomic,) int64_t time_finish;
@property (assign, nonatomic,) int64_t time_exclusive;
- (int)threadId;
- (ZZTraceItem *)taillorWithTM1:(int64_t)tm1 andWithTM2:(int64_t)tm2;
- (void)copyFrom:(ZZTraceItem *)item;
- (NSArray *)renderByAbsoluteTime:(int64_t)time;
- (void)calculate_time_excWithSub;
@end
