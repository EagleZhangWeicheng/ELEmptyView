//
//  UIView+ELEmptyView.h
//  EagleEmptyView
//
//  Created by Eagle on 2018/7/26.
//  Copyright © 2018年 Eagle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ELEmptyView;
@interface UIView (ELEmptyView)
@property(nonatomic,strong)ELEmptyView *emptyView;

-(void)hideEmptyView;
-(void)showEmptyView;

@end
