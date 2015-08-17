//
//  MtachCategoryViewController.m
//  SinaSport
//
//  Created by qianfeng on 15/8/13.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import "CategoryViewController.h"
#import "MatchCategoryModel.h"
#import "CategoryCell.h"
#import "DownloadManager.h"
#define kMatchUrl (@"http://interface.sina.cn/sports/sports_navs/client_sports_ctrl/client_sports_ctrl.d.json")

@interface CategoryViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCollectionView];
    [self downloadData];

    self.dataArray = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



- (void)createCollectionView{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) collectionViewLayout:layout];
    layout.itemSize = CGSizeMake(121, 121);
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CategoryCell" bundle:nil] forCellWithReuseIdentifier:@"collectID"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
}

#pragma mark -UICollectionView协议方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
//    return 33;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryCell *cell = [[CategoryCell alloc] init];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectID" forIndexPath:indexPath];
    MatchCategoryModel *model = [[MatchCategoryModel alloc] init];
    model = _dataArray[indexPath.item];
    [cell initWithModel:model];
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}



-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(3 , 3, 55, 3);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}

#pragma mark- loadData
- (void)downloadData{
    [[DownloadManager sharedManager] postDataWithUrlString:kMatchUrl parameter:nil success:^(id obj) {
        NSLog(@"+++++%@",obj);
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = obj[@"result"];
            NSDictionary *dataDict = dict[@"data"];
            for (NSDictionary *dic in dataDict[@"list"]) {
                MatchCategoryModel *model = [[MatchCategoryModel alloc] init];
                [model configModelWithDictionary:dic];
                [self.dataArray addObject:model];
            }
            NSLog(@"=========%@",self.dataArray);
            [self.collectionView reloadData];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}



@end
