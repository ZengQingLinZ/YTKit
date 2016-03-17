//
//  UILabel+YTLabel.m
//  YTAnmation
//
//  Created by Ljcx on 16/3/14.
//  Copyright © 2016年 Ljcx. All rights reserved.
//

#import "UILabel+YTLabel.h"

@implementation UILabel (YTLabel)

+(UILabel *)labelWithFrame:(CGRect)labelFrame text:(NSString *)text font:(CGFloat)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)labelAlignment {
    
    UILabel *ytLabel = [[UILabel alloc]initWithFrame:labelFrame];
    ytLabel.text = text;
    ytLabel.font = [UIFont systemFontOfSize:font];
    ytLabel.textColor = textColor;
    ytLabel.textAlignment = labelAlignment;
    return ytLabel;
    
}

@end
