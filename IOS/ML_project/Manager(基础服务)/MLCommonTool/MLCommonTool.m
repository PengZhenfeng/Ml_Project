//
//  MLCommonTool.m
//  ML_project
//
//  Created by Angzeng on 2019/12/5.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#import "MLCommonTool.h"
#import "FontAndColorMacros.h"

@implementation MLCommonTool

//设置图片边框阴影
+ (void)setViewShadow:(UIView *)View {
    View.layer.shadowOpacity = 0.1;
    View.layer.shadowColor = MLColor_Black.CGColor;
    View.layer.shadowRadius = 3;
    View.layer.shadowOffset = CGSizeMake(1, 1);
    return;
}

//过滤换行符和空字符
+ (NSString *)filtratSpecialCodeWithString:(NSString *)string {
    NSString *newString = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    newString = [newString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    newString = [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return newString;
}

//获取屏幕顶层window
+ (UIWindow *)WindowView {
    UIApplication *YHwindow = [UIApplication sharedApplication];
    if ([YHwindow.delegate respondsToSelector:@selector(window)]) {
        return [YHwindow.delegate window];
    }else {
        return [YHwindow keyWindow];
    }
}

//长方形图片处理
+ (UIImage*)getSubImage:(UIImage *)image centerBool:(BOOL)centerBool{
    CGRect mCGRect;
    if (image.size.width >= image.size.height) {
        mCGRect = CGRectMake(0, 0, image.size.height, image.size.height);
    }else {
        mCGRect = CGRectMake(0, 0, image.size.width, image.size.width);
    }
    /*如若centerBool为Yes则是由中心点取mCGRect范围的图片*/
    float imgWidth = image.size.width;
    float imgHeight = image.size.height;
    float viewWidth = mCGRect.size.width;
    float viewHidth = mCGRect.size.height;
    CGRect rect;
    if(centerBool){
        rect = CGRectMake((imgWidth-viewWidth)/2,(imgHeight-viewHidth)/2,viewWidth,viewHidth);
    }else{
        if(viewHidth < viewWidth){
            if(imgWidth <= imgHeight){
                rect = CGRectMake(0, 0, imgWidth, imgWidth*imgHeight/viewWidth);
            }else{
                float width = viewWidth*imgHeight/viewHidth;
                float x = (imgWidth - width)/2;
                if(x > 0){
                    rect = CGRectMake(x, 0, width, imgHeight);
                }else{
                    rect = CGRectMake(0, 0, imgWidth, imgWidth*viewHidth/viewWidth);
                }
            }
        }else{
            if(imgWidth <= imgHeight){
                float height = viewHidth*imgWidth/viewWidth;
                if(height < imgHeight){
                    rect = CGRectMake(0,0, imgWidth, height);
                }else{
                    rect = CGRectMake(0,0, viewWidth*imgHeight/viewHidth,imgHeight);
                }
            }else{
                float width = viewWidth * imgHeight / viewHidth;
                if(width < imgWidth){
                    float x = (imgWidth - width)/2;
                    rect = CGRectMake(x,0,width, imgHeight);
                }else{
                    rect = CGRectMake(0,0,imgWidth, imgHeight);
                }
            }
        }
    }
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    CGRect smallBounds = CGRectMake(0,0,CGImageGetWidth(subImageRef),CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage *smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

//方形图片处理
+ (UIImage *)circleImage:(UIImage*)image withParam:(CGFloat)inset {
    image = [self getSubImage:image centerBool:YES];
    //
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillPath(context);
    CGContextSetLineWidth(context, .5);
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

//设置图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha image:(UIImage*)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
