//
//  FontAndColorMacros.h
//  ML_project
//  定义全局用色值、字体大小
//  Created by Angzeng on 2019/12/1.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

//定义取色值宏
#define ColorWithRGB(r,g,b)         [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define ColorWithRGBA(r,g,b,a)      [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//定义项目配色方案
/*弃用#define MLMainColor                 [UIColor colorWithRed:230/255.0 green:38/255.0 blue:42/255.0 alpha:1.0]*/
/*弃用#define MLColor_red                 [UIColor colorWithRed:245/255.0 green:40/255.0 blue:27/255.0 alpha:1.0]*/
/*弃用#define MLColor_LightRed            [UIColor colorWithRed:235/255.0 green:63/255.0 blue:47/255.0 alpha:1.0]*/
#define MLColor_DarkRed             [UIColor colorWithRed:179/255.0 green:24/255.0 blue:0/255.0 alpha:1.0]
#define MLColor_LightGray           [UIColor colorWithRed:245/255.0 green:246/255.0 blue:235/255.0 alpha:1.0]
#define MLColor_PureGray            [UIColor colorWithRed:239/255.0 green:240/255.0 blue:220/255.0 alpha:1.0]
#define MLColor_DarkGray            [UIColor colorWithRed:201/255.0 green:202/255.0 blue:187/255.0 alpha:1.0]
#define MLColor_Black               [UIColor colorWithRed:52/255.0 green:53/255.0 blue:44/255.0 alpha:1.0]
#define MLColor_tapBackColor        [UIColor colorWithRed:0.94902 green:0.980392 blue:1.0 alpha:1.0]
#define MLColor_tabBar_DarkRed      [UIColor colorWithRed:200/255.0 green:41/255.0 blue:50/255.0 alpha:1.0]
#define MLColor_riceWhite           [UIColor colorWithRed:248/255.0 green:246/255.0 blue:231/255.0 alpha:1.0]

//定义项目主色方案
#define MLColor_ChineseRed          [UIColor colorWithRed:196/255.0 green:38/255.0 blue:42/255.0 alpha:1.0]
#define MLColor_Golden              [UIColor colorWithRed:149/255.0 green:133/255.0 blue:71/255.0 alpha:1.0];
#define MLColor_WhiteGray           [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1.0]
//定义项目字体
//#define MLFont                      @"Wyue-GutiFangsong-NC"
#define MLFont                      @"FZJUZXFJW--GB1-0"
#define MLPingFangFont              @"PingFangSC-Light"

#endif /* FontAndColorMacros_h */
