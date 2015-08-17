//
//  DownloadManager.h
//  SinaSport
//
//  Created by qianfeng on 15/8/13.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadManager : NSObject

@property (nonatomic,strong) id receiveData;

+(instancetype)sharedManager;
 
- (void)getDataWithUrlString:(NSString *)urlString success:(void (^) (id obj))successBlock failure:(void (^)(NSError *error))failureBlock;

- (void)postDataWithUrlString:(NSString *)urlString parameter:(id)parameter success:(void (^) (id obj))successBlock failure:(void (^)(NSError *error))failureBlock;

@end
