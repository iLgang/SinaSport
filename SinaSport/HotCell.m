//
//  HotCell.m
//  SinaSport
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "HotCell.h"
#import "MyUnit.h"
#import "UIImageView+WebCache.h"
#import "ExtraContentView.h"

@interface HotCell ()

//标签label
@property (nonatomic,strong) UILabel *titleLabel;
//team1标志
@property (nonatomic,strong) UIImageView *team1Image;

@property (nonatomic,strong) UILabel *team1Name;

@property (nonatomic,strong) UILabel *team1Score;

//第二队标志
@property (nonatomic,strong) UIImageView *team2Image;

//第二队队名
@property (nonatomic,strong) UILabel *team2Name;

//第二队得分
@property (nonatomic,strong) UILabel *team2Score;

//直播标志
@property (nonatomic,strong) UIImageView *timeImage;

//直播时间
@property (nonatomic,strong) UILabel *timeLabel;

//是否需要付费
@property (nonatomic,strong) UIImageView *isPayImage;

//视频直播或者文字直播
@property (nonatomic,strong) UILabel *type;

//额外标题标签标题和url等信息
@property (nonatomic,strong) NSMutableArray *extraArray;

//解说

@property (nonatomic,strong) UILabel *narratorLabel;
/*
 缺少一个结束或者喜欢状态
 */

@end






@implementation HotCell

- (void)awakeFromNib {
    
}


- (instancetype)init
{
    if (self = [super init]) {
        [self createCellView];
    }
    return self;
}

//自定义cell上的子视图
- (void)createCellView{
    
    self.titleLabel = [MyUnit createLabelWithFrame:CGRectMake(0, 5, 100, 25) text:nil textColor:[UIColor lightGrayColor] textFont:[UIFont systemFontOfSize:10]];
    
    self.narratorLabel = [MyUnit createLabelWithFrame:CGRectMake(200, 5, 140, 25) text:nil textColor:[UIColor lightGrayColor] textFont:[UIFont systemFontOfSize:8]];
    
    self.team1Image = [MyUnit createImageViewWithFrame:CGRectMake(5, 35, 30, 30) imageUrl:nil];
    self.team1Name = [MyUnit createLabelWithFrame: CGRectMake(35, 35, 80, 30) text:nil textColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:18]];
    self.team1Score = [MyUnit createLabelWithFrame:CGRectMake(185, 35, 20, 30) text:nil textColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:18]];
    
    self.team2Image = [MyUnit createImageViewWithFrame:CGRectMake(5, 70, 30, 30) imageUrl:nil];
    self.team2Name = [MyUnit createLabelWithFrame: CGRectMake(35, 70, 80, 30) text:nil textColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:18]];
    self.team2Score = [MyUnit createLabelWithFrame:CGRectMake(185, 70, 20, 30) text:nil textColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:18]];
    
    self.timeImage = [[UIImageView alloc] initWithFrame:CGRectMake(225, 100, 5, 5)];
    self.timeImage.image = [[UIImage imageNamed:@"matchTime"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.timeLabel = [MyUnit createLabelWithFrame:CGRectMake(230, 100, 20, 10) text:nil textColor:[UIColor lightGrayColor] textFont:[UIFont systemFontOfSize:8]];
    self.isPayImage = [[UIImageView alloc] initWithFrame:CGRectMake(335, 0, 40, 40)];
    self.isPayImage.image = [[UIImage imageNamed:@"payIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.type = [MyUnit createLabelWithFrame:CGRectMake(230, 110, 60, 10) text:nil textColor:[UIColor lightGrayColor] textFont:[UIFont systemFontOfSize:8]];
    [self addSubview:self.titleLabel];
    [self addSubview:self.narratorLabel];
    [self addSubview:self.team1Image];
    [self addSubview:self.team1Name];
    [self addSubview:self.team1Score];
    [self addSubview:self.team2Image];
    [self addSubview:self.team2Name];
    [self addSubview:self.team2Score];
    [self addSubview:self.timeLabel];
    [self addSubview:self.timeImage];
    [self addSubview:self.isPayImage];
    [self addSubview:self.type];
    
    
}

//返回cell的高度
- (NSInteger)heightOfContentArray:(NSArray *)contentArray
{
    return contentArray.count;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (void)configWithModel:(CategoryDetailModel *)model
{
    //加载cell的标题
    if (model.Round.intValue != 0) {
        self.titleLabel.text = [NSString stringWithFormat:@"%@ %@",model.ShortTitle,model.Round_cn];
    }
    else{
        self.titleLabel.text = model.ShortTitle;
    }
    
    [self.team1Image sd_setImageWithURL:[NSURL URLWithString:model.Flag1_small]];
    self.team1Name.text = model.Team1;
    
    //是否已经完赛,如果完赛加载得分
    if (model.Score1) {
        self.team1Score.text = model.Score1;
    }
    else{
        self.team1Score.hidden = YES;
    }
    
    
    [self.team2Image sd_setImageWithURL:[NSURL URLWithString:model.Flag2_small]];
    self.team2Name.text = model.Team2;
    if (model.Score2) {
        self.team2Score.text = model.Score2;
    }
    else{
        self.team2Score.hidden = YES;
    }
    
    //如果有解说加载解说嘉宾
    if (model.narrator) {
        self.narratorLabel.text = model.narrator;
    }
    else{
        self.narratorLabel.hidden = YES;
    }
    
    //如果无需付费隐藏付费标志
    if ([model.sSports[@"pay"] intValue] == 0) {
        self.isPayImage.hidden = YES;
    }
    
    //如果比赛未开始加载比赛时间
    if ([model.status_cn isEqualToString:@"未赛"]) {
        self.timeLabel.text = model.time;
    }
    else{
        self.timeImage.hidden = YES;
        self.timeLabel.hidden = YES;
    }
    
    if (model.video_live_status.intValue == 1) {
        self.type.text = @"视频直播";
    }else{
        self.type.hidden = YES;
    }
    
    if (model.extra.count != 0) {
        self.extraArray = [NSMutableArray arrayWithArray:model.extra];
        for (int i = 0; i < model.extra.count; i++) {
            ExtraContentView *view = [[ExtraContentView alloc] initWithFrame:CGRectMake(0, 125+i*22, 300, 20)];
            [view configWithDictionary:model.extra[i]];
            [self addSubview:view];
        }
    }
    
    
}



@end
