//
//  MLProfileViewController.m
//  ML_project
//
//  Created by Angzeng on 2019/12/1.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#import "MLProfileViewController.h"
#import "FontAndColorMacros.h"
#import "UtilsMacros.h"

@interface MLProfileViewController ()

@end

@implementation MLProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI {
    self.view.backgroundColor = MLColor_LightGray;
    [self setNavBar];
}

- (void)setNavBar {
    //
    UIButton *leftbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
    [leftbutton setTitle:@"帮助" forState:UIControlStateNormal];
    leftbutton.titleLabel.font = [UIFont fontWithName:MLFont size:18];
    //[leftbutton addTarget:self action:@selector(pushSideView) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem=leftItem;
    //
    UIButton *rightbutton = [[UIButton alloc] initWithFrame:CGRectMake(MLScreenWidth-60, 0, 60, 20)];
    [rightbutton setTitle:@"我的" forState:UIControlStateNormal];
    rightbutton.titleLabel.font = [UIFont fontWithName:MLFont size:18];
    //[rightbutton addTarget:self action:@selector(showViewInfo) forControlEvents:UIControlEventTouchDown];
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(-5, 8, 1, 20)];
    line.backgroundColor = MLColor_PureGray;
    [rightbutton addSubview:line];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

@end
