//
//  CategoryView.h
//  SinaSport
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CollectionViewDelegate <NSObject>

- (void)didSelectedItem:(NSString *)type;

@end



@interface CategoryView : UIView

@property (nonatomic,weak) id<CollectionViewDelegate> delegate;

@end
