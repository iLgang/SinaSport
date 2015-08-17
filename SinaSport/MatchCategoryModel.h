//
//  MatchCategoryModel.h
//  SinaSport
//
//  Created by qianfeng on 15/8/13.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MatchCategoryModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *customLogo;
@property (nonatomic,strong) NSString *communityUrl;
@property (nonatomic,strong) NSString *customName;
@property (nonatomic,strong) NSString *DataFrom;
@property (nonatomic,strong) NSString *ID;
@property (nonatomic,strong) NSString *logo;

//注意此处命名规范
@property (nonatomic,strong) NSString *NewFeedId;

@property (nonatomic,strong) NSArray *tabs;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *videoFeedId;

- (void)configModelWithDictionary:(NSDictionary *)dictionary;

@end
