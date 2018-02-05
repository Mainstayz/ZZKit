//
//  ZZStack.h
//  ZZKit
//
//  Created by mac on 2018/2/5.
//  Copyright © 2018年 ZongzhuHe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZStack : NSLock
@property(nonatomic) NSUInteger count;
+ (instancetype)defaultStack;
- (id)pop;
- (NSUInteger)push:(id)obj;
- (void)clearStack;
- (BOOL)isEmpty;
- (id)init;
- (id)peer;
- (id)bottomOfStack;
@end
