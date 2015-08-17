//
//  MatchCategoryModel.m
//  SinaSport
//
//  Created by qianfeng on 15/8/13.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "MatchCategoryModel.h"

@implementation MatchCategoryModel

- (void)configModelWithDictionary:(NSDictionary *)dictionary
{
    self.communityUrl = dictionary[@"communityUrl"];
    self.customLogo = dictionary[@"customLogo"];
    self.customName = dictionary[@"customName"];
    self.DataFrom = dictionary[@"DataFrom"];
    self.ID = dictionary[@"ID"];
    self.logo = dictionary[@"logo"];
    self.NewFeedId = dictionary[@"newFeedId"];
    self.tabs = dictionary[@"tabs"];
    self.type = dictionary[@"type"];
    self.videoFeedId = dictionary[@"videoFeedId"];
    self.title = dictionary[@"title"];
}

@end
