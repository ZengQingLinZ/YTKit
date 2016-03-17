//
//  UILabel+YTLabel.h
//  YTAnmation
//
//  Created by Ljcx on 16/3/14.
//  Copyright © 2016年 Ljcx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YTLabel)

/*
 @param frame label大小
 @param text 文字显示
 @param font 字体大小
 @param textColor 字体颜色
 @param backgroundColor label背景颜色
 */

+(UILabel *)labelWithFrame:(CGRect)labelFrame text:(NSString *)text font:(CGFloat)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)labelAlignment;

@end
