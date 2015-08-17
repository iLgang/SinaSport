//
//  MyUnit.h
//  SinaSport
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyUnit : NSObject
+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundImageName:(NSString *)imageName;

+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title titleTextColor:(UIColor *)color textFont:(UIFont *)font;
+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)color textFont:(UIFont *)font;
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageUrl:(NSString *)imageUrl;

@end
