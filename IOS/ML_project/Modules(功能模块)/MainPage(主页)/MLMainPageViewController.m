//
//  MLMainPageViewController.m
//  ML_project
//
//  Created by Angzeng on 2019/12/1.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#import "MLMainPageViewController.h"
#import "FontAndColorMacros.h"
#import "UtilsMacros.h"
#import "MLWelcomeView.h"
#import "MLScrollView.h"
#import "MLCommonTool.h"
#import "UILabel+Extension.h"

@interface MLMainPageViewController ()

@property (nonatomic, strong) MLScrollView *MainScrollView;
//
@property (nonatomic, strong) UIButton *WriteButton;
@property (nonatomic, strong) UIView *coverview;

@end

@implementation MLMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

#pragma mark 页面样式设置

- (void)setUI {
    self.view.backgroundColor = MLColor_LightGray;
    [self setNavBar];
    [self setMainScrollView];
    [self setWelcomeView];
    [self setAutobiographyView];
    [self setWriteButton];
}

- (void)setNavBar {
    //左侧帮助按钮
    UIButton *leftbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
    [leftbutton setTitle:@"帮助" forState:UIControlStateNormal];
    leftbutton.titleLabel.font = [UIFont fontWithName:MLFont size:18];
    //[leftbutton addTarget:self action:@selector(pushSideView) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = leftItem;
    //右侧撰写按钮
    UIButton *rightbutton = [[UIButton alloc] initWithFrame:CGRectMake(MLScreenWidth-60, 0, 60, 20)];
    [rightbutton setTitle:@"撰写" forState:UIControlStateNormal];
    rightbutton.titleLabel.font = [UIFont fontWithName:MLFont size:18];
    //[rightbutton addTarget:self action:@selector(showViewInfo) forControlEvents:UIControlEventTouchDown];
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(-5, 8, 1, 20)];
    line.backgroundColor = MLColor_PureGray;
    [rightbutton addSubview:line];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setMainScrollView {
    //设置滚动背景视图
    _MainScrollView = [[MLScrollView alloc] initWithFrame:CGRectMake(0, 0, MLScreenWidth, MLScreenHeight-MLTableLackHeight)];
    _MainScrollView.backgroundColor = MLColor_WhiteGray;
    _MainScrollView.contentSize = CGSizeMake(MLScreenWidth, 157*MLpx);/*有navigationbar提升后scrollView偏移64pt的bug*/
    if (@available(iOS 11.0, *)) {
        _MainScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }/*修复偏移bug*/
    _MainScrollView.alwaysBounceVertical = YES;
    _MainScrollView.userInteractionEnabled = YES;
    _MainScrollView.showsHorizontalScrollIndicator = NO;
    _MainScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_MainScrollView];
    //
}

- (void)setWelcomeView {
    MLWelcomeView *welcomeV = [[MLWelcomeView alloc] initWithFrame:CGRectMake(2*MLpx, 2*MLpx, 96*MLpx, 42*MLpx)];
    [_MainScrollView addSubview:welcomeV];
}

- (void)setAutobiographyView {
    UIView *AutobiographyV = [[UIView alloc] initWithFrame:CGRectMake(2*MLpx, 46*MLpx, 96*MLpx, MLScreenHeight-MLTableLackHeight-48*MLpx)];
    AutobiographyV.backgroundColor = MLColor_DarkGray;
    AutobiographyV.layer.cornerRadius = 1*MLpx;
    [_MainScrollView addSubview:AutobiographyV];
    //设置标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(2*MLpx, 2*MLpx, 10*MLpx, 40*MLpx)];
    titleLabel.backgroundColor = MLColor_DarkGray;
    titleLabel.verticalText = @"我的自传";
    titleLabel.font = [UIFont fontWithName:MLFont size:6.2*MLpx];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [AutobiographyV addSubview:titleLabel];
    //设置更新时间
    UILabel *updateTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(2*MLpx, AutobiographyV.frame.size.height-60*MLpx, 8*MLpx, 60*MLpx)];
    updateTimeLabel.backgroundColor = [UIColor clearColor];
    updateTimeLabel.textColor = MLColor_Black;
    updateTimeLabel.verticalText = @"二零一九年十一月五日更撰";
    updateTimeLabel.font = [UIFont fontWithName:MLFont size:3.8*MLpx];
    updateTimeLabel.textAlignment = NSTextAlignmentCenter;
    //[AutobiographyV addSubview:updateTimeLabel];
    //设置内容背景视图
    UIView *contentV = [[UIView alloc] initWithFrame:CGRectMake(14*MLpx, 2*MLpx, 80*MLpx, MLScreenHeight-MLTableLackHeight-52*MLpx)];
    contentV.backgroundColor = MLColor_LightGray;
    [AutobiographyV addSubview:contentV];
    //设置内容
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(2*MLpx, 2*MLpx, 74*MLpx, MLScreenHeight-MLTableLackHeight-56*MLpx)];
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.text = @"    1993年8月,我七岁上小学.临学前,母亲教育我,今天的幸福生活来之不易,是无数革命先烈用生命和鲜血换来得,我应该好好学习,不辜负党对我的培育.我牢记母亲的话,上小学后,学习上努力刻苦,争当先进;劳动中,不怕脏不怕累.最终在小学三年级光荣的加入了中国少先队.从此,我每天都戴着鲜艳的红领巾去上学,我知道自己是公产主义接班人,肩负着光荣而又重大的历史使命.我学习更加努力.另外.母亲对我要求也很严格,从小就教育我:学习是自己的事,我们家不是很富裕,考上什么样的学校就上什么样的学校,就靠自己的个人能力了.这让我养成了独,一切靠自己努力的个性.虽然小升初我只上了一个普通中学,但我从不气馁,也不怨天尤人,而是更加努力的学习.\n    1999年8月,我进入三中学习.虽然这只是一所普通中学,但我在这里过的很愉快、很充实.在学习上,我多次被评为三好学生,我也积极的参加学校和班级活动.这是一所寄宿学校,由于我独立生活能力强,我被任命为寝室长,协助老师负责同学们的生活.艰苦的生活磨练了我的意志和体质,我还有幸参加了较体育队,代表学校去参加镇上的运动会.\n  2000年5月4日,我在初二的时候加入了中国共青团,这不仅仅是一种荣誉,更是一种责任和义务.就这样伴随着责任和义务我的初中生活结束了.\n  2002年8月,我进入了三高继续学习,十六岁的我对生活充满了无比的希望,在高中三年,不管是在学习上还是在集体生活中,我仍是积极努力.此时正是三个代表思想的春风吹遍神州大地.这也让我充分认识到了党的先进性,对我们党的理解进一步加深了.";
    contentLabel.numberOfLines = 30;
    contentLabel.font = [UIFont fontWithName:MLFont size:3.6*MLpx];
    contentLabel.textColor = MLColor_Black;
    [contentV addSubview:contentLabel];
    
}

- (void)setWriteButton {
    _WriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_WriteButton setImage:[UIImage imageNamed:@"icon_write"] forState:UIControlStateNormal];
    _WriteButton.frame = CGRectMake(0.5*MLpx, 0.5*MLpx, 12*MLpx, 12*MLpx);
    //[_WriteButton addTarget:self action:@selector(writeClick) forControlEvents:UIControlEventTouchUpInside];
    
    _coverview= [[UIView alloc]initWithFrame:CGRectMake(MLScreenWidth-17*MLpx,MLScreenHeight-MLTableLackHeight-17*MLpx, 13*MLpx, 13*MLpx)];
    _coverview.backgroundColor = MLColor_WhiteGray;
    _coverview.layer.cornerRadius = 6.5*MLpx;
    _coverview.layer.masksToBounds = YES;
    //
    [MLCommonTool setViewShadow:_coverview];
    //
    [_coverview addSubview:_WriteButton];
    [self.view addSubview:_coverview];
}

@end
