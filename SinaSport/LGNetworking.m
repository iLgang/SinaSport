//
//  LGNetworking.m
//  SinaSport
//
//  Created by qianfeng on 15/8/13.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "LGNetworking.h"

typedef void (^completionHandler)(NSURLResponse *,NSData *,NSError *);

@interface HttpDownload : NSObject <NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@property (nonatomic,copy) NSString *urlString;

@property (nonatomic,assign) NSURLRequestCachePolicy cachePolicy;

@property (nonatomic,assign) NSTimeInterval timeoutInterval;

@property (nonatomic,copy) completionHandler handler;

@property (nonatomic,retain) NSError *error;

@property (nonatomic,retain) NSURLResponse *response;

@property (nonatomic,retain) NSMutableData *receiveData;

- (void)start;

@end


@implementation HttpDownload

- (NSMutableData *)receiveData
{
    if (_receiveData == nil) {
        _receiveData = [NSMutableData data];
    }
    return _receiveData;
}

- (void)start{
    NSURLRequest *requestM = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString] cachePolicy:self.cachePolicy timeoutInterval:self.timeoutInterval];
    [NSURLConnection connectionWithRequest:requestM delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.response = response;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.error = error;
    self.handler(self.response,self.receiveData,self.error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.handler(self.response,self.receiveData,self.error);
}

@end

@implementation LGNetworking:NSObject

+ (void)sendAsynchronousWithUrlString:(NSString *)urlString cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))hanler
{
    HttpDownload *downloader = [[HttpDownload alloc] init];
    downloader.urlString = urlString;
    downloader.cachePolicy = cachePolicy;
    downloader.timeoutInterval = timeoutInterval;
    downloader.handler = hanler;
    
    [downloader start];
}

+ (void)sendAsynchronousWithUrlString:(NSString *)urlString completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))handler
{
    [LGNetworking sendAsynchronousWithUrlString:urlString cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10 completionHandler:handler];
}

@end
