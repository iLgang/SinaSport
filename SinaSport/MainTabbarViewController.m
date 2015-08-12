//
//  MainTabbarViewController.m
//  SinaSport
//
//  Created by qianfeng on 15/8/12.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "MatchViewController.h"
#import "NewsViewController.h"
#import "ColumnViewController.h"
#import "TeamViewController.h"

@interface MainTabbarViewController ()

@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabbar];
}

- (void)createTabbar{
    NSMutableArray *navArray = [NSMutableArray array];
    //tabbar_bg@2x
    NSArray *nameArray = @[@"比赛",@"新闻",@"专栏",@"球队"];
    NSArray *imageArray = @[@"match",@"news",@"specialCol",@"team"];
    NSArray *selectedImageArray = @[@"match_high",@"news_high",@"specialCol_high",@"team_high"];
    NSArray *vcClassNameArray = @[@"MatchViewController",@"NewsViewController",@"ColumnViewController",@"TeamViewController"];
    for (int i = 0; i < 4; i ++) {
        Class class = NSClassFromString(vcClassNameArray[i]);
        BaseViewController *vc = [[class alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.tabBarItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.title = nameArray[i];
//        UINavigationController *navCtrl=[[UINavigationController alloc]initWithRootViewController:vc];
//        [navArray addObject:navCtrl];
        [navArray addObject:vc];
    }
    UIImage *image = [[UIImage imageNamed:@"tabbar_bg_6"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tabBar setBackgroundImage:image];
//    self.tabBar.alpha = 0.9;
    self.tabBar.translucent = NO;
//    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.viewControllers = navArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
