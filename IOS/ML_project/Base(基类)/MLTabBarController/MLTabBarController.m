//
//  MLTabBarController.m
//  ML_project
//
//  Created by Angzeng on 2019/12/1.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#import "MLTabBarController.h"
#import "MLMainPageViewController.h"
#import "MLWebScanViewController.h"
#import "MLProfileViewController.h"
#import "MLNavigationController.h"
#import "FontAndColorMacros.h"
#import "UtilsMacros.h"

@interface MLTabBarController ()

@end

@implementation MLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

//修改tabbar形状，悬浮框
- (void)viewWillLayoutSubviews{
//    if (IS_IPHONE_X) {
//        return;
//    }
//    CGRect tabFrame = self.tabBar.frame;
//    tabFrame.origin.x = 5;
//    tabFrame.origin.y = MLScreenHeight - 49 - (IS_IPHONE_X?44:10);
//    tabFrame.size.width = MLScreenWidth - 10;
//    tabFrame.size.height = 49;
//
//    self.tabBar.layer.cornerRadius = IS_IPHONE_X?0.02*MLScreenWidth:0.03*MLScreenWidth;
//    self.tabBar.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.9];
//    //视图边界阴影
//    self.tabBar.layer.shadowOpacity = 0.3;
//    self.tabBar.layer.shadowColor = MLColor_Black.CGColor;
//    self.tabBar.layer.shadowRadius = 3;
//    self.tabBar.layer.shadowOffset = CGSizeMake(1, 1);
//    //
//    self.tabBar.frame = tabFrame;
    self.tabBar.backgroundColor = MLColor_WhiteGray;
}

-(void)setUI {
    self.view.backgroundColor = MLColor_LightGray;
    //tabbar分割线
    //[[UITabBar appearance] setShadowImage:[UIImage new]];
    //[[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    //[[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    //
    CGRect rect = CGRectMake(0, 0, MLScreenWidth, 0.1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[UIColor grayColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[UITabBar appearance] setShadowImage:img];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    //设置tabbar子页面
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //set MLMainPageView
    MLMainPageViewController *MLMainPageVC = [[MLMainPageViewController alloc] init];
    MLNavigationController *MLMainPageNavVC = [[MLNavigationController alloc] initWithRootViewController:MLMainPageVC];
    [self setTabBarItem:MLMainPageNavVC.tabBarItem Title:@"撰写" withTitleSize:10 andFoneName:MLFont selectedImage:@"tabbar_MainPage_selected" withTitleColor:MLColor_ChineseRed unselectedImage:@"tabbar_MainPage" withTitleColor:[UIColor grayColor]];
    dict[NSForegroundColorAttributeName] = MLColor_tabBar_DarkRed;
    [MLMainPageNavVC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    //set MLWebScanView
    MLWebScanViewController *MLWebScanVC = [[MLWebScanViewController alloc] init];
    MLNavigationController *MLWebScanNavVC = [[MLNavigationController alloc] initWithRootViewController:MLWebScanVC];
    [self setTabBarItem:MLWebScanNavVC.tabBarItem Title:@"浏览" withTitleSize:10 andFoneName:MLFont selectedImage:@"tabbar_WebScan_selected" withTitleColor:MLColor_ChineseRed unselectedImage:@"tabbar_WebScan" withTitleColor:[UIColor grayColor]];
    dict[NSForegroundColorAttributeName] = MLColor_tabBar_DarkRed;
    [MLWebScanNavVC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    //set MLProfileView
    MLProfileViewController *MLProfileVC = [[MLProfileViewController alloc] init];
    MLNavigationController *MLProfileNavVC = [[MLNavigationController alloc] initWithRootViewController:MLProfileVC];
    [self setTabBarItem:MLProfileNavVC.tabBarItem Title:@"个人" withTitleSize:10 andFoneName:MLFont selectedImage:@"tabbar_Profile_selected" withTitleColor:MLColor_ChineseRed unselectedImage:@"tabbar_Profile" withTitleColor:[UIColor grayColor]];
    dict[NSForegroundColorAttributeName] = MLColor_tabBar_DarkRed;
    [MLProfileNavVC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    //设置viewcontroller
    self.viewControllers = @[MLMainPageNavVC, MLWebScanNavVC, MLProfileNavVC];
}

- (void)setTabBarItem:(UITabBarItem *)tabbarItem Title:(NSString *)title withTitleSize:(CGFloat)size andFoneName:(NSString *)foneName selectedImage:(NSString *)selectedImage withTitleColor:(UIColor *)selectColor unselectedImage:(NSString *)unselectedImage withTitleColor:(UIColor *)unselectColor{
    //设置图片
    tabbarItem = [tabbarItem initWithTitle:title image:[[UIImage imageNamed:unselectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectColor,NSFontAttributeName:[UIFont fontWithName:foneName size:size]} forState:UIControlStateNormal];
    //选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor,NSFontAttributeName:[UIFont fontWithName:foneName size:size]} forState:UIControlStateSelected];
}

- (UIImage*)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
