//
//  CategoryCell.h
//  SinaSport
//
//  Created by qianfeng on 15/8/13.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchCategoryModel.h"

@interface CategoryCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *customLogoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)initWithModel:(MatchCategoryModel *)model;

@end
