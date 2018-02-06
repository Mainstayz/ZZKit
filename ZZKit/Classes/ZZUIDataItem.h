//
//  ZZUIDataItem.h
//  ZZKit
//
//  Created by ZongzhuHe on 2018/2/6.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZStructures.h"
@interface ZZUIDataItem : NSObject
@property (nonatomic, assign) int64_t time_start;
@property (nonatomic, assign) int64_t time_finish;
@property(copy, nonatomic) NSString *key_name;
@property (nonatomic, assign) int64_t count;
@property (nonatomic, assign) int64_t sum_time_exc_square;
@property (nonatomic, assign) int64_t sum_time_exc;
@property (nonatomic, assign) int64_t sum_time;
@property (nonatomic, assign) int64_t time_exc_max;
@property (nonatomic, assign) int64_t time_exc_min;
+ (instancetype)UIDataWithKey:(NSString *)key;
- (void)add:(ZZUIDataItem *)item;
- (void)mergeWithData:(ZZStructTime *)arg1;
- (void)addWithData:(ZZStructTime *)arg1;
- (void)clear;
- (NSArray *)renderWithScope:(id)arg1;
@end
