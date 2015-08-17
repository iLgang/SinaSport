//
//  ExtraContentView.m
//  SinaSport
//
//  Created by qianfeng on 15/8/15.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "ExtraContentView.h"


@interface ExtraContentView ()

@property (nonatomic,strong) UIButton *contentBtn;
@property (nonatomic,strong) UIImageView *flagView;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *urlString;

@end




@implementation ExtraContentView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self customingView];
    }
    return self;
}

- (void)customingView{
    self.flagView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
    [self addSubview:self.flagView];
    
    self.contentBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, 0, 250, 20)];
    [self.contentBtn addTarget:self action:@selector(gotoNews:) forControlEvents:UIControlEventTouchUpInside];
    self.contentBtn.titleLabel.font = [UIFont systemFontOfSize:8];
    [self addSubview:self.contentBtn];
}

- (void)configWithDictionary:(NSDictionary *)dict
{
    self.type = dict[@"content-type"];
    self.urlString = dict[@"url"];
    
    self.contentBtn.titleLabel.text = dict[@"title"];
    if ([dict[@"content-type"] isEqualToString:@"text"]) {
        self.flagView.image = [[UIImage imageNamed:@"icon_content"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else{
        self.flagView.image = [[UIImage imageNamed:@"icon_video"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}


- (void)gotoNews:(UIButton *)btn{
    
    //把extra的点击事件交给主视图控制器控制,发一个通知来通知视图控制器
    NSDictionary *dict = @{self.type:@"content-type",self.urlString:@"url"};
    NSNotification *not = [NSNotification notificationWithName:@"PushExtraView" object:nil userInfo:dict];
    [[NSNotificationCenter defaultCenter] postNotification:not];
}


@end
