    //
    //  ZZUIDataItem.m
    //  ZZKit
    //
    //  Created by ZongzhuHe on 2018/2/6.
    //  Copyright © 2018年 ZongzhuHe. All rights reserved.
    //

#import "ZZUIDataItem.h"

@implementation ZZUIDataItem
+ (instancetype)UIDataWithKey:(NSString *)key{
    ZZUIDataItem *item = [ZZUIDataItem new];
    item.key_name = key;
    return item;
}
- (NSArray *)renderWithScope:(id)arg1{
    NSDictionary *infoDic = nil;
    if (arg1) {
        infoDic = @{@"parent":arg1,@"name":self.key_name};
    }else{
        infoDic = @{@"name":self.key_name};
    }
    
    NSArray *times =  @[@(self.count),
                        @(self.sum_time),
                        @(self.sum_time_exc),
                        @(self.time_exc_max),
                        @(self.time_exc_min),
                        @(self.sum_time_exc_square)];
    
    return @[infoDic,times];
}
- (void)clear{
    self.count = 0;
    self.sum_time = 0;
    self.sum_time_exc = 0;
    self.sum_time_exc_square = 0;
    self.time_exc_min = 0;
    self.time_exc_max = 0;
}
- (void)addWithData:(ZZStructTime *)arg1{
    if ( !self.count )
        self.time_exc_min = arg1->tm2;
    self.count ++;
    self.sum_time += arg1->tm1;
    self.sum_time_exc += arg1->tm2;
    if ( arg1->tm2 <= self.time_exc_min)
        self.time_exc_min = arg1->tm2;
    if ( arg1->tm2 >= self.time_exc_max )
        self.time_exc_max = arg1->tm2;
    self.sum_time_exc_square += arg1->tm2 * arg1->tm2;
}
- (void)mergeWithData:(ZZStructTime *)arg1{
    if ( !self.count )
        self.count = 1LL;
    self.sum_time += arg1->tm1;
    int64_t count  = arg1->tm2 + self.sum_time_exc;
    self.sum_time_exc = count;
    self.time_exc_min = count;
    self.time_exc_max = count;
    self.sum_time_exc_square = count * count;
}
- (void)add:(ZZUIDataItem *)item{
    if ( item )
    {
        if ( [self.key_name isEqualToString:item.key_name] )
        {
            if ( !self.count )
                self.time_exc_min = item.time_exc_min;
            self.count += item.count;
            self.sum_time += item.sum_time;
            self.sum_time_exc += item.sum_time_exc;
            self.sum_time_exc_square += item.sum_time_exc_square;
            if ( self.time_exc_min > item.time_exc_min && item.count > 0 )
                self.time_exc_min = item.time_exc_min;
            if ( self.time_exc_max < item.time_exc_max )
                self.time_exc_max = item.time_exc_max;
        }
    }
}
@end
