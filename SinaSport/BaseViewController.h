//
//  BaseViewController.h
//  SinaSport
//
//  Created by qianfeng on 15/8/11.
//  Copyright (c) 2015年 ligang. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@interface BaseViewController : UIViewController
{
    //数据数组
    NSMutableArray *_dataArray;
    
    //
    UITableView *_tbView;
    
    //上拉加载更多
    MJRefreshFooterView *_footerView;
    
    //下拉刷新
    MJRefreshHeaderView *_headerView;
    
    //当前的页面
    NSInteger _curPage;
    
    //是否正在刷新/加载
    BOOL _isLoading;
}
@end
