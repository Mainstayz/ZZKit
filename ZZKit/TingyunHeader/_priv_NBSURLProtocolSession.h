//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <Foundation/NSURLProtocol.h>

#import "NSURLSessionDataDelegate-Protocol.h"
#import "NSURLSessionDelegate-Protocol.h"

@class NSArray, NSString, NSURLResponse, NSURLSessionDataTask;

@interface _priv_NBSURLProtocolSession : NSURLProtocol <NSURLSessionDelegate, NSURLSessionDataDelegate>
{
    NSURLResponse *curr_response;
    _Bool isStartLoading;
    NSURLSessionDataTask *_dataTask;
    NSArray *_modes;
}

+ (id)share_nbs_Sesssion;
+ (_Bool)requestIsCacheEquivalent:(id)arg1 toRequest:(id)arg2;
+ (id)canonicalRequestForRequest:(id)arg1;
+ (_Bool)canInitWithRequest:(id)arg1;
+ (void)setCallBackOfShippingAuthentication:(CDUnknownFunctionPointerType)arg1 andCallBackOfPreparingRequest:(CDUnknownFunctionPointerType)arg2;
@property(copy) NSArray *modes; // @synthesize modes=_modes;
@property(retain, nonatomic) NSURLSessionDataTask *dataTask; // @synthesize dataTask=_dataTask;
- (void).cxx_destruct;
- (void)URLSession:(id)arg1 task:(id)arg2 didFinishCollectingMetrics:(id)arg3;
- (void)URLSession:(id)arg1 task:(id)arg2 didReceiveChallenge:(id)arg3 completionHandler:(CDUnknownBlockType)arg4;
- (void)URLSession:(id)arg1 dataTask:(id)arg2 willCacheResponse:(id)arg3 completionHandler:(CDUnknownBlockType)arg4;
- (void)URLSession:(id)arg1 task:(id)arg2 didCompleteWithError:(id)arg3;
- (void)URLSession:(id)arg1 dataTask:(id)arg2 didReceiveResponse:(id)arg3 completionHandler:(CDUnknownBlockType)arg4;
- (void)URLSession:(id)arg1 dataTask:(id)arg2 didReceiveData:(id)arg3;
- (void)URLSession:(id)arg1 task:(id)arg2 willPerformHTTPRedirection:(id)arg3 newRequest:(id)arg4 completionHandler:(CDUnknownBlockType)arg5;
- (void)stopLoading;
- (void)startLoading;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

