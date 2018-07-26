//
//  ELEmptyView.h
//  ELEmptyView
//
//  没有数据 没有网络 加载失败
//
//  Created by Eagle on 2018/7/16.
//  Copyright © 2018年 Eagle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+ELEmptyView.h"

@class ELEmptyView;
typedef void (^ButtonPressBlock)(ELEmptyView *emptyView);


@interface ELEmptyView : UIView
@property(nonatomic,strong)UIImageView* imageView;;
@property(nonatomic,strong)UILabel* titleLabel;
@property(nonatomic,strong)UILabel* detailLabel;
@property(nonatomic,strong)UIButton* button;
@property(nonatomic,copy)ButtonPressBlock buttonPressBolck;

+(instancetype)emptyViewWithImageNameStr:(NSString*)imageNameStr
                                titleStr:(NSString*)titleStr
                               detailStr:(NSString*)detailStr
                          buttonTitleStr:(NSString*)buttonTitleStr
                        buttonPressBlock:(ButtonPressBlock)buttonPressBlock;

+(instancetype)emptyViewWithImageNameStr:(NSString*)imageNameStr
                                titleStr:(NSString*)titleStr
                               detailStr:(NSString*)detailStr;


+(instancetype)emptyNoDataButtonPressBlock:(ButtonPressBlock)buttonPressBlock; //没有数据
+(instancetype)emptyNoNetworkButtonPressBlock:(ButtonPressBlock)buttonPressBlock;//没有网络
+(instancetype)emptyLoadFailButtonPressBlock:(ButtonPressBlock)buttonPressBlock; //加载失败

@end
