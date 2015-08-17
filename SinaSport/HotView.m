//
//  HotView.m
//  SinaSport
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "HotView.h"
#import "CategoryDetailModel.h"
#import "DownloadManager.h"
#import "MJRefresh.h"
#import "HotCell.h"

#define kStartHotUrl (@"http://client.mix.sina.com.cn/api/match_extra/get?_sport_t_=livecast&_sport_a_=hotMatches&show_extra=1&__os__=iphone&app_key=2923419926&__version__=3.1.0.9")
#define kRefreshHotUrl (@"http://client.mix.sina.com.cn/api/match_extra/get?_sport_a_=hotMatches&direct=tofull&begin=2015-07-31&__os__=iphone&app_key=2923419926&show_extra=1&__version__=3.1.0.9&_sport_t_=livecast");

@interface HotView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tbView;

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation HotView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self downloadData];
        [self createTableView];
    }
    return self;
}

- (void)downloadData{
    //开始多线程开始下载
}


- (void)createTableView{
    _tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667-64-49)];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    [self addSubview:_tbView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
