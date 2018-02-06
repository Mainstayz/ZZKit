//
//  ZZUIDataListOfScope.h
//  ZZKit
//
//  Created by ZongzhuHe on 2018/2/6.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZStructures.h"

@interface ZZUIDataListOfScope : NSLock
@property (nonatomic, strong) NSMutableArray *UIDataList;
@property (nonatomic, strong) NSMutableDictionary *componentDataList;
@property (nonatomic, assign) int64_t time_start;
@property (nonatomic, assign) int64_t time_finish;
@property (nonatomic, assign) int64_t lastModiTime;
+ (id)DataListWithScope:(id)arg1;
- (void)close;
- (void)add:(id)arg1;
- (void)clear;
- (void)logData:(ZZStructTime *)arg1 className:(id)arg2 methodName:(id)arg3 categoryKey:(int)arg4 isBackGround:(BOOL)arg5;
@end
