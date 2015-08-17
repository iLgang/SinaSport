//
//  MyUnit.m
//  SinaSport
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "MyUnit.h"
#import "UIImageView+WebCache.h"


@implementation MyUnit

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundImageName:(NSString *)imageName
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    UIImage *bgImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    return btn;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title titleTextColor:(UIColor *)color textFont:(UIFont *)font
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.titleLabel.font = font;
    return btn;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)color textFont:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = color;
    label.font = font;
    return label;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageUrl:(NSString *)imageUrl
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    return imageView;
}


//+ (UIImageView *)

@end
