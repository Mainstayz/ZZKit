//
//  ZZStack.m
//  ZZKit
//
//  Created by mac on 2018/2/5.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import "ZZStack.h"

@interface ZZStack ()
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ZZStack
+ (instancetype)defaultStack{
    return [[self alloc] init];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _items = [NSMutableArray array];
    }
    return self;
}
- (id)bottomOfStack{
    id obj;
    [self lock];
    obj = [self.items firstObject];
    [self unlock];
    return obj;
}
- (id)peer{
    id obj;
    [self lock];
    obj = [self.items lastObject];
    [self unlock];
    return obj;
}
- (NSUInteger)count{
    return [self.items count];
}
- (BOOL)isEmpty{
    return self.items.count == 0;
}
- (void)clearStack{
    [self lock];
    [self.items removeAllObjects];
    [self unlock];
}

-(NSUInteger)push:(id)obj{
    [self lock];
    [self.items addObject:obj];
    [self unlock];
    return self.items.count - 1;
}
- (id)pop{
    id obj = nil;
    if (self.items.count != 0) {
        [self lock];
        obj = [self.items lastObject];
        [self.items removeObject:obj];
        [self unlock];
    }
    return obj;
    
}
@end
