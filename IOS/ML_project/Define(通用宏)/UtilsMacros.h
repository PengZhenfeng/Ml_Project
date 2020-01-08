//
//  UtilsMacros.h
//  ML_project
//  定义工具宏
//  Created by Angzeng on 2019/12/1.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

//判断手机型号
#define IS_IPHONE                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_XR                (IS_IPHONE && MLScreenHeight == 896.0f)                        //代表了896宽度物理点的手机型号
#define IS_IPHONE_X                 (IS_IPHONE && MLScreenHeight == 812.0f)                        //代表了812宽度物理点的手机型号
#define IS_IPHONE_6                 (IS_IPHONE && MLScreenHeight == 667.0f)
#define IS_IPHONE_6P                (IS_IPHONE && MLScreenHeight == 736.0f)
#define IS_IPHONE_5                 (IS_IPHONE && MLScreenHeight == 568.0f)
#define IS_IPHONE_4                 (IS_IPHONE && MLScreenHeight == 480.0f)
#define IS_LITTLE                   (IS_IPHONE && (IS_IPHONE_4 || IS_IPHONE_5))
//基础单位
#define MLpx                        0.01*[[UIScreen mainScreen] bounds].size.width
#define FontPx                      0.3125*MLpx
//屏幕尺寸
#define MLScreenWidth               [[UIScreen mainScreen] bounds].size.width
#define MLScreenHeight              [[UIScreen mainScreen] bounds].size.height
//定义居中时左初始位置
#define MLLeftPoint(w)              [[UIScreen mainScreen] bounds].size.width/2-w/2
//状态栏高度
#define MLStatusRectHeight          [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏高度
#define MLNavigationRectHeight      44
//状态栏和导航栏高度
#define MLTopHeight                 MLNavigationRectHeight+MLStatusRectHeight
//Tableview向下空缺距离
#define MLTableLackHeight           ((IS_IPHONE_X || IS_IPHONE_XR)?172:114)

//基础图标尺寸
#define MLIcontx                     0.06*[[UIScreen mainScreen] bounds].size.height

#endif /* UtilsMacros_h */
