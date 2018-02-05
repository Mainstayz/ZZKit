//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

@class NSDictionary;

@interface NBSEventTreeMetric : NSObject
{
    _Bool flag;
    _Bool _isSlowStart;
    int _appStartType;
    double _appStartDuration;
    double _contexCreateTime;
    double _appInitTime;
    double _mainActivityCreateTime;
    double _mainActivityResumeTime;
    NSDictionary *_additionalInfo;
}

@property(retain, nonatomic) NSDictionary *additionalInfo; // @synthesize additionalInfo=_additionalInfo;
@property(nonatomic) _Bool isSlowStart; // @synthesize isSlowStart=_isSlowStart;
@property(nonatomic) double mainActivityResumeTime; // @synthesize mainActivityResumeTime=_mainActivityResumeTime;
@property(nonatomic) double mainActivityCreateTime; // @synthesize mainActivityCreateTime=_mainActivityCreateTime;
@property(nonatomic) double appInitTime; // @synthesize appInitTime=_appInitTime;
@property(nonatomic) double contexCreateTime; // @synthesize contexCreateTime=_contexCreateTime;
@property(nonatomic) double appStartDuration; // @synthesize appStartDuration=_appStartDuration;
@property(nonatomic) int appStartType; // @synthesize appStartType=_appStartType;
- (void).cxx_destruct;
- (double)caculateDuration;
- (void)setupAdditionInfo;
- (id)initWithLaunchType:(int)arg1;

@end

