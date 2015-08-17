//
//  MatchViewController.m
//  SinaSport
//
//  Created by qianfeng on 15/8/12.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "MatchViewController.h"
#import "CategoryViewController.h"
#import "MyUnit.h"
#import "CategoryView.h"

@interface MatchViewController () <CollectionViewDelegate>

@property (nonatomic,strong) UIButton *personBtn;
@property (nonatomic,strong) UIButton *matchBtn;
@property (nonatomic,strong) UIButton *hotBtn;
@property (nonatomic,strong) UIButton *myBtn;
@property (nonatomic,strong) UIView *indicatorView;
@property (nonatomic,strong) UIButton *refreshBtn;
//上一次选中的按钮
@property (nonatomic,strong) UIButton *lastSleectedBtn;

@property (nonatomic,strong) NSString *matchType;

@end

@implementation MatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMatchNav];
    [self createView];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)createView{
    CategoryView *matchView = [[CategoryView alloc] initWithFrame:CGRectMake(0, 65, 375, 667-64)];
    matchView.delegate = self;
    [self.view addSubview:matchView];
}


- (void)createMatchNav{
    
    UIView *navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 64)];
    [self.view addSubview:navigationView];
    
    //背景视图
    UIImage *bgImage = [[UIImage imageNamed:@"navBg_low"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    bgImageView.frame = CGRectMake(0, 0, 375, 64);
    [navigationView addSubview:bgImageView];
    
    //个人登录模块按钮
    _personBtn = [MyUnit createButtonWithFrame:CGRectMake(0, 25, 39, 39) backgroundImageName:@"personal_icon"];
    [_personBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_personBtn];
    
    
    //刷新按钮
    _refreshBtn = [MyUnit createButtonWithFrame:CGRectMake(375-39, 25, 39, 39) backgroundImageName:@"btn_refresh"];
    [_refreshBtn addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_refreshBtn];
    
    
    //选择指示视图
    _indicatorView = [[UIView alloc] initWithFrame:CGRectMake(170, 64, 40, 1)];
    _indicatorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_indicatorView];
    
    
    //赛事按钮
    _matchBtn = [MyUnit createButtonWithFrame:CGRectMake(80, 24, 60, 40) title:@"赛事" titleTextColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:14]];
    [_matchBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [_matchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_matchBtn];
    
    //热门按钮
    _hotBtn = [MyUnit createButtonWithFrame:CGRectMake(160, 24, 60, 40) title:@"热门" titleTextColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:14]];
    [_hotBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_hotBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_hotBtn];
    
    //我的按钮
    _myBtn = [MyUnit createButtonWithFrame:CGRectMake(240, 24, 60, 40) title:@"我的" titleTextColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:14]];
    [_myBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_myBtn];
    
    _lastSleectedBtn = _hotBtn;
}

- (void)clickBtn:(UIButton *)btn{
    NSLog(@"%@按钮被点击",btn.titleLabel.text);
    if ([btn.titleLabel.text isEqualToString:@"赛事"]) {
        [UIView animateWithDuration:0.1 animations:^{
            _indicatorView.frame = CGRectMake(90, 64, 40, 1);
            [_matchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [_lastSleectedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }];
        _lastSleectedBtn = _matchBtn;
    }
    else if ([btn.titleLabel.text isEqualToString:@"热门"]){
        [UIView animateWithDuration:0.1 animations:^{
            _indicatorView.frame = CGRectMake(170, 64, 40, 1);
            [_hotBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [_lastSleectedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }];
        _lastSleectedBtn = _hotBtn;
    }
    else{
        [UIView animateWithDuration:0.1 animations:^{
            _indicatorView.frame = CGRectMake(250, 64, 40, 1);
            [_myBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [_lastSleectedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }];
        _lastSleectedBtn = _myBtn;
    }
}

- (void)login:(id)sender{
    NSLog(@"登录按钮被点击");
}

- (void)refresh:(id)sender{
    NSLog(@"刷新按钮被点击");
    
}



#pragma mark -CollctionView delegate代理方法
- (void)didSelectedItem:(NSString *)type
{
    NSLog(@"++++++++%@",type);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}





@end
