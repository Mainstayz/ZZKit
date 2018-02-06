//
//  ZZUIDataListOfScope.m
//  ZZKit
//
//  Created by ZongzhuHe on 2018/2/6.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import "ZZUIDataListOfScope.h"

@interface ZZUIDataListOfScope()
@property (nonatomic, assign) BOOL isClosed;

@end

@implementation ZZUIDataListOfScope
- (instancetype)init
{
    self = [super init];
    if (self) {
        _UIDataList = [NSMutableArray array];
        _componentDataList = [NSMutableDictionary dictionary];
        _time_start = [[NSDate date] timeIntervalSince1970];
        _isClosed = NO;
    }
    return self;
}
+ (id)DataListWithScope:(id)arg1{
    ZZUIDataListOfScope *scope = [ZZUIDataListOfScope new];
        // TODO: OBJC_CLASS____priv_NBSUIDataItem
    return nil;
}
@end
