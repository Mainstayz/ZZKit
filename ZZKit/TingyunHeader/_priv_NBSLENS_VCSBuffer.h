//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <Foundation/NSLock.h>

@class NSMutableArray, NSObject;
@protocol OS_dispatch_queue;

@interface _priv_NBSLENS_VCSBuffer : NSLock
{
    NSMutableArray *buff;
    NSObject<OS_dispatch_queue> *queue;
}

+ (id)sharedObj;
- (void).cxx_destruct;
- (void)moveOtherToMain:(long long)arg1;
- (void)addObj:(id)arg1;
- (void)commitToLogCenter;
- (int)countItemOf:(id)arg1 before:(long long)arg2 fromIndex:(int)arg3;
- (id)getVCsFromBuff:(id)arg1 withAddr:(long long)arg2;
- (id)allVCAddressOf:(id)arg1;
- (id)getSortedOfArray:(id)arg1;
- (id)init;

@end

