//
//  UIView+ELEmptyView.m
//  EagleEmptyView
//
//  Created by Eagle on 2018/7/26.
//  Copyright © 2018年 Eagle. All rights reserved.
//

#import "UIView+ELEmptyView.h"
#import "ELEmptyView.h"
#import <objc/runtime.h>

@implementation UIView (ELEmptyView)
-(void)setEmptyView:(ELEmptyView *)emptyView{
    if (![self.emptyView isEqual:emptyView]) {
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:[ELEmptyView class]]) {
                [subView removeFromSuperview];
            }
        }
        
        emptyView.frame = self.bounds;
        [self addSubview:emptyView];
        objc_setAssociatedObject(self, @"ELEmptyView", emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

-(ELEmptyView*)emptyView{
    return  objc_getAssociatedObject(self, @"ELEmptyView");
}

-(void)hideEmptyView;{
    self.emptyView.hidden = true;
}

-(void)showEmptyView;{
    self.emptyView.hidden = false;
}


@end
