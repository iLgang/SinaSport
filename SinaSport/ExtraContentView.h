//
//  ExtraContentView.h
//  SinaSport
//
//  Created by qianfeng on 15/8/15.
//  Copyright (c) 2015年 ligang. All rights reserved.
//

#import <UIKit/UIKit.h>


//触发点击事件,交给上一个视图处理
//@protocol ExtraContentViewDelegate <NSObject>
//
//- (void)pushViewControllerWithUrlString:(NSString *)urlString type:(NSString *)type;
//
//@end

@interface ExtraContentView : UIView



//@property (nonatomic,weak) id<ExtraContentViewDelegate> delegate;

- (void)configWithDictionary:(NSDictionary *)dict;

@end
