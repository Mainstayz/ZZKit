//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

@protocol OS_dispatch_queue;

@interface _priv_NBSLensSessionReporter : NSObject
{
    NSObject<OS_dispatch_queue> *queue;
}

+ (id)sharedInstance;
- (void).cxx_destruct;
- (void)dealloc;
- (void)postSessionDataToServer:(id)arg1;
- (id)init;

@end
