//
//  ViewController.m
//  EagleEmptyView
//
//  Created by Mac on 2018/7/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "ELEmptyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (self.type == 0) {
        self.view.emptyView = [ELEmptyView emptyViewWithImageNameStr:@"nodata" titleStr:@"titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle" detailStr:@"detailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetails"];

    }
    else if (self.type == 1){
        self.view.emptyView = [ELEmptyView emptyNoDataButtonPressBlock:^(ELEmptyView *emptyView) {
            NSLog(@"press");
        }];

    }
    else if (self.type == 2){
        self.view.emptyView = [ELEmptyView emptyNoNetworkButtonPressBlock:^(ELEmptyView *emptyView) {
            NSLog(@"press");
        }];

    }
    else if (self.type == 3){
        self.view.emptyView = [ELEmptyView emptyLoadFailButtonPressBlock:^(ELEmptyView *emptyView) {
            NSLog(@"press");
        }];

    }

    
//    self.view.emptyView = [ELEmptyView emptyViewWithImageNameStr:@"noNetwork"
//                                                        titleStr:@"没有数据"
//                                                       detailStr:@"暂时没有数据哦"
//                                                  buttonTitleStr:@"重新加载"
//                                                buttonPressBlock:^(ELEmptyView *emptyView) {
//                                                    NSLog(@"button press");
//                                                }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
