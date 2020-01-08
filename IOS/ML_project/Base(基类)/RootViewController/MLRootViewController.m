//
//  MLRootViewController.m
//  ML_project
//
//  Created by Angzeng on 2019/12/1.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#import "MLRootViewController.h"
#import "MLLogInViewController.h"

@interface MLRootViewController ()

@end

@implementation MLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLogInView];
}

- (void)setLogInView {
    //登录页面导入
    MLLogInViewController *LoginVC = [[MLLogInViewController alloc] init];
    LoginVC.modalPresentationStyle = 0;/*使推出的视图控制器全屏*/
    [self presentViewController:LoginVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
