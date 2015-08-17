//
//  HotCell.h
//  SinaSport
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryDetailModel.h"

@interface HotCell : UITableViewCell

- (NSInteger)heightOfContentArray:(NSArray *)contentArray;

- (void)configWithModel:(CategoryDetailModel *)model;

@end
