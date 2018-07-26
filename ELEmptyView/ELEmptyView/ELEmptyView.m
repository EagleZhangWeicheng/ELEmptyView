//
//  EagleEmptyView.m
//  EagleEmptyView
//  
//  Created by Eagle on 2018/7/16.
//  Copyright © 2018年 Eagle. All rights reserved.
//

#define Padding 15
#define LineSpace 10

#import "ELEmptyView.h"
#import "UIView+ELEmptyViewFrame.h"

@interface ELEmptyView();
@property(nonatomic)BOOL isLoadBundle; //是否重bundle中加载资源
@end

@implementation ELEmptyView
+(instancetype)emptyViewWithImageNameStr:(NSString*)imageNameStr
                                titleStr:(NSString*)titleStr
                               detailStr:(NSString*)detailStr
                          buttonTitleStr:(NSString*)buttonTitleStr
                        buttonPressBlock:(ButtonPressBlock)buttonPressBlock;{
    ELEmptyView *emptyView = [[ELEmptyView alloc] initEmptyViewWithImageNameStr:imageNameStr
                                                                       titleStr:titleStr
                                                                      detailStr:detailStr
                                                                 buttonTitleStr:buttonTitleStr
                                                                   isLoadBundle:false
                                                               buttonPressBlock:buttonPressBlock];
    return emptyView;
}

+(instancetype)emptyViewWithImageNameStr:(NSString*)imageNameStr
                                titleStr:(NSString*)titleStr
                               detailStr:(NSString*)detailStr;{
   return [ELEmptyView emptyViewWithImageNameStr:imageNameStr
                                  titleStr:titleStr
                                 detailStr:detailStr
                            buttonTitleStr:nil
                                buttonPressBlock:nil];
}

+(instancetype)emptyNoDataButtonPressBlock:(ButtonPressBlock)buttonPressBlock;{ //没有数据
    ELEmptyView *emptyView = [[ELEmptyView alloc] initEmptyViewWithImageNameStr:@"nodata"
                                                                       titleStr:@"暂时还没有数据哦"
                                                                      detailStr:nil
                                                                 buttonTitleStr:@"重新加载"
                                                                   isLoadBundle:true
                                                               buttonPressBlock:buttonPressBlock];
    return emptyView;
}

+(instancetype)emptyNoNetworkButtonPressBlock:(ButtonPressBlock)buttonPressBlock;{//没有网络
    ELEmptyView *emptyView = [[ELEmptyView alloc] initEmptyViewWithImageNameStr:@"noNetwork"
                                                                       titleStr:@"没有网络"
                                                                      detailStr:@"请检测您的网络"
                                                                 buttonTitleStr:@"重新加载"
                                                                   isLoadBundle:true
                                                               buttonPressBlock:buttonPressBlock];
    emptyView.titleLabel.textColor = [UIColor colorWithRed:240.0/155 green:80.0/255 blue:80.0/255 alpha:1];
    return emptyView;
}

+(instancetype)emptyLoadFailButtonPressBlock:(ButtonPressBlock)buttonPressBlock;{ //加载失败
    ELEmptyView *emptyView = [[ELEmptyView alloc] initEmptyViewWithImageNameStr:@"noNetwork"
                                                                       titleStr:@"加载失败"
                                                                      detailStr:@"请检测您的网络"
                                                                 buttonTitleStr:@"重新加载"
                                                                   isLoadBundle:true
                                                               buttonPressBlock:buttonPressBlock];
    emptyView.titleLabel.textColor = [UIColor colorWithRed:240.0/155 green:80.0/255 blue:80.0/255 alpha:1];
    return emptyView;
}

-(instancetype)initEmptyViewWithImageNameStr:(NSString*)imageNameStr
                                    titleStr:(NSString*)titleStr
                                    detailStr:(NSString*)detailStr
                              buttonTitleStr:(NSString*)buttonTitleStr
                                isLoadBundle:(BOOL)isLoadBundle
                            buttonPressBlock:(ButtonPressBlock)buttonPressBlock;{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1];
        self.buttonPressBolck = buttonPressBlock;
        
        if (imageNameStr && imageNameStr.length>0) {
            UIImage *image;
            if (isLoadBundle) {
                NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ELEmptySource.bundle"];
                image = [UIImage imageNamed:imageNameStr inBundle:[NSBundle bundleWithPath:path] compatibleWithTraitCollection:nil];
            }
            else{
                 image = [UIImage imageNamed:imageNameStr];
            }
            self.imageView  = [[UIImageView alloc] initWithImage:image];
            self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            [self addSubview:self.imageView];
        }
        
        if (titleStr  && titleStr.length>0) {
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.titleLabel.numberOfLines = 0;
            self.titleLabel.text = titleStr;
            self.titleLabel.font = [UIFont systemFontOfSize:17];
            self.titleLabel.textColor = [UIColor colorWithRed:51.0/255 green:51.0/255 blue:51.0/255 alpha:1];
            [self addSubview:self.titleLabel];
        }
        
        if (detailStr && detailStr.length >0) {
            self.detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.detailLabel.text = detailStr;
            self.detailLabel.numberOfLines = 0;
            self.detailLabel.font = [UIFont systemFontOfSize:13];
            self.detailLabel.textColor = [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1];
            [self addSubview:self.detailLabel];
        }

        if (buttonTitleStr && buttonTitleStr.length>0) {
            self.button = [UIButton buttonWithType:UIButtonTypeCustom];
            self.button.frame = CGRectZero;
            [self.button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
            [self.button setTitleColor: [UIColor colorWithRed:51.0/255 green:51.0/255 blue:51.0/255 alpha:1] forState:UIControlStateNormal];
            self.button.layer.borderWidth = 0.5;
            self.button.layer.borderColor = [UIColor colorWithRed:150.0/255 green:150.0/255 blue:150.0/255 alpha:1].CGColor;
            self.button.layer.cornerRadius = 5;
            self.button.titleLabel.font = [UIFont systemFontOfSize:15];
            [self.button setTitle:buttonTitleStr forState:UIControlStateNormal];
            [self addSubview:self.button];
        }

    }
    return self;
}

-(void)buttonPress:(UIButton*)button{
    if (self.buttonPressBolck) {
        self.buttonPressBolck(self);
    }
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self emptyLayoutSubViews];
}


-(void)emptyLayoutSubViews{
    CGFloat contentW = self.bounds.size.width - 2*Padding;
    CGFloat centerX = self.bounds.size.width / 2;
    CGFloat startCenterY = self.bounds.size.height *0.3;
    
    if (self.imageView && self.imageView.image) {
        self.imageView.ly_centerX = centerX;
        self.imageView.ly_centerY = startCenterY;
        startCenterY = startCenterY + self.imageView.ly_height / 2 + LineSpace;
    }
    
    if (self.titleLabel) {
        CGSize size = [self returnText:self.titleLabel.text size:CGSizeMake(contentW, MAXFLOAT) font:self.titleLabel.font];
        self.titleLabel.ly_size = size;
        self.titleLabel.ly_centerX = centerX;
        startCenterY += size.height /2;
        self.titleLabel.ly_centerY = startCenterY;
        startCenterY = startCenterY + size.height/2 + LineSpace;
    }
    
    if (self.detailLabel) {
        CGSize size = [self returnText:self.detailLabel.text size:CGSizeMake(contentW, MAXFLOAT) font:self.detailLabel.font];
        self.detailLabel.ly_size = size;
        self.detailLabel.ly_centerX = centerX;
        startCenterY += size.height /2;
        self.detailLabel.ly_centerY = startCenterY;
        startCenterY = startCenterY + self.detailLabel.ly_height / 2 + LineSpace;
    }
    
    if (self.button) {
        CGSize size = [self returnText:self.button.currentTitle size:CGSizeMake(contentW, MAXFLOAT) font:self.button.titleLabel.font];
        size = CGSizeMake(size.width + 30, size.height + 10);
        self.button.ly_size = size;
        startCenterY += size.height /2;
        self.button.ly_centerX = centerX;
        self.button.ly_centerY = startCenterY;
    }
}


- (CGSize)returnText:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}


@end
