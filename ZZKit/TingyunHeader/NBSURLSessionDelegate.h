//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

@interface NBSURLSessionDelegate : NSObject
{
}

- (void)nbs_URLSession:(id)arg1 downloadTask:(id)arg2 didFinishDownloadingToURL:(id)arg3;
- (id)forwardingTargetForSelector:(SEL)arg1;
- (void)nbs_URLSession:(id)arg1 task:(id)arg2 didFinishCollectingMetrics:(id)arg3;
- (void)nbs_URLSession:(id)arg1 downloadTask:(id)arg2 didResumeAtOffset:(long long)arg3 expectedTotalBytes:(long long)arg4;
- (void)nbs_URLSession:(id)arg1 downloadTask:(id)arg2 didWriteData:(long long)arg3 totalBytesWritten:(long long)arg4 totalBytesExpectedToWrite:(long long)arg5;
- (void)nbs_URLSession:(id)arg1 dataTask:(id)arg2 willCacheResponse:(id)arg3 completionHandler:(CDUnknownBlockType)arg4;
- (void)nbs_URLSession:(id)arg1 dataTask:(id)arg2 didReceiveData:(id)arg3;
- (void)nbs_URLSession:(id)arg1 dataTask:(id)arg2 didBecomeDownloadTask:(id)arg3;
- (void)nbs_URLSession:(id)arg1 dataTask:(id)arg2 didReceiveResponse:(id)arg3 completionHandler:(CDUnknownBlockType)arg4;
- (void)nbs_URLSession:(id)arg1 task:(id)arg2 didCompleteWithError:(id)arg3;
- (void)nbs_URLSession:(id)arg1 task:(id)arg2 didSendBodyData:(long long)arg3 totalBytesSent:(long long)arg4 totalBytesExpectedToSend:(long long)arg5;
- (void)nbs_URLSession:(id)arg1 task:(id)arg2 needNewBodyStream:(CDUnknownBlockType)arg3;
- (void)nbs_URLSession:(id)arg1 task:(id)arg2 didReceiveChallenge:(id)arg3 completionHandler:(CDUnknownBlockType)arg4;
- (void)nbs_URLSession:(id)arg1 task:(id)arg2 willPerformHTTPRedirection:(id)arg3 newRequest:(id)arg4 completionHandler:(CDUnknownBlockType)arg5;
- (void)nbs_URLSessionDidFinishEventsForBackgroundURLSession:(id)arg1;
- (void)nbs_URLSession:(id)arg1 didReceiveChallenge:(id)arg2 completionHandler:(CDUnknownBlockType)arg3;
- (void)nbs_URLSession:(id)arg1 streamTask:(id)arg2 didBecomeInputStream:(id)arg3 outputStream:(id)arg4;
- (void)nbs_URLSession:(id)arg1 writeClosedForStreamTask:(id)arg2;
- (void)nbs_URLSession:(id)arg1 readClosedForStreamTask:(id)arg2;
- (void)nbs_URLSession:(id)arg1 dataTask:(id)arg2 didBecomeStreamTask:(id)arg3;
- (void)nbs_URLSession:(id)arg1 didBecomeInvalidWithError:(id)arg2;

@end

