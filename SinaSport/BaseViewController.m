//
//  BaseViewController.m
//  SinaSport
//
//  Created by qianfeng on 15/8/11.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () <UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray array];
    _curPage = 1;
    _isLoading = NO;
    
}

- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375, 667-64-49) style:UITableViewStylePlain];
    _tbView.dataSource = self;
    _tbView.delegate = self;
    _tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tbView];
    
    
    _headerView = [MJRefreshHeaderView header];
    _headerView.scrollView = _tbView;
    _headerView.delegate = self;
    
    
    _footerView = [MJRefreshFooterView footer];
    _footerView.scrollView = _tbView;
    _footerView.delegate = self;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%s",__FUNCTION__);
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"%s",__FUNCTION__);
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__FUNCTION__);
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__FUNCTION__);
    return 0;
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
