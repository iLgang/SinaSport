//
//  CategoryCell.m
//  SinaSport
//
//  Created by qianfeng on 15/8/13.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "CategoryCell.h"
#import "UIImageView+WebCache.h"

@implementation CategoryCell


- (void)initWithModel:(MatchCategoryModel *)model
{
    if (model.customLogo) {
        [self.customLogoImageView sd_setImageWithURL:[NSURL URLWithString:model.customLogo]];
    }
    else
    {
        self.customLogoImageView.hidden = YES;
    }
    if (model.logo) {
        [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    }
    else
    {
        self.logoImageView.hidden = YES;
    }
    self.titleLabel.text = model.title;
}


- (void)awakeFromNib {
    
}





@end
