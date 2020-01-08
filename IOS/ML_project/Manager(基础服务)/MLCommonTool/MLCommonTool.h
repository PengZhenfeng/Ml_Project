//
//  MLCommonTool.h
//  ML_project
//
//  Created by Angzeng on 2019/12/5.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MLCommonTool : NSObject

//设置图片边框阴影
+ (void)setViewShadow:(UIView *)View;
//过滤特殊字符
+ (NSString *)filtratSpecialCodeWithString:(NSString *)string;
//获取屏幕顶层window
+ (UIWindow *)WindowView;
//长方形图片处理
+ (UIImage*)getSubImage:(UIImage *)image centerBool:(BOOL)centerBool;
//方形图片处理
+ (UIImage *)circleImage:(UIImage*)image withParam:(CGFloat)inset;
//设置图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha image:(UIImage*)image;

@end
