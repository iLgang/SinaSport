//
//  LGNetworking.h
//  SinaSport
//
//  Created by qianfeng on 15/8/13.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGNetworking : NSObject



+ (void)sendAsynchronousWithUrlString:(NSString *)urlString cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval completionHandler:(void (^)(NSURLResponse *response,NSData *data,NSError *connetionError))hanler;

+ (void)sendAsynchronousWithUrlString:(NSString *)urlString completionHandler:(void (^)(NSURLResponse *response,NSData *data,NSError *connectionError))handler;


@end
