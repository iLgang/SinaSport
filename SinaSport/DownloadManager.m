//
//  DownloadManager.m
//  SinaSport
//
//  Created by qianfeng on 15/8/13.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "DownloadManager.h"
#import "AFNetworking.h"

@implementation DownloadManager

+(instancetype)sharedManager
{
    static DownloadManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DownloadManager alloc] init];
    });

    return instance;
}




- (void)getDataWithUrlString:(NSString *)urlString success:(void (^) (id obj))successBlock failure:(void (^)(NSError *error))failureBlock
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)postDataWithUrlString:(NSString *)urlString parameter:(id)parameter success:(void (^)(id))successBlock failure:(void (^)(NSError *))failureBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:urlString parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}


@end
