//
//  MLNavigationController.m
//  ML_project
//
//  Created by Angzeng on 2019/12/1.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#import "MLNavigationController.h"
#import "FontAndColorMacros.h"

@interface MLNavigationController ()

@end

@implementation MLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI {
    self.navigationBar.translucent = NO;
    //self.navigationBar.barTintColor = YHMainColor;
    self.navigationBar.barTintColor = MLColor_ChineseRed;
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self.navigationBar setTitleTextAttributes:dict];
    //
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
