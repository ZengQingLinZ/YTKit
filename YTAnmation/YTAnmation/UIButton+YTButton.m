//
//  UIButton+YTButton.m
//  YTAnmation
//
//  Created by Ljcx on 16/3/14.
//  Copyright © 2016年 Ljcx. All rights reserved.
//

#import "UIButton+YTButton.h"
#import <objc/runtime.h>


static const void *UIButtonBlockKey = &UIButtonBlockKey;

@interface UIButton (YTButton)

@property(nonatomic,strong)NSString *string;

@end

@implementation UIButton (YTButton)

+(UIButton *)butonWithFrame:(CGRect)frame buttonType:(UIButtonType)type text:(NSString*)text textFont:(CGFloat)fontSize textColor:(UIColor *)textColor {
    
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [btn setTitleColor:textColor forState:UIControlStateNormal];

    return btn;
    
}
-(void)setString:(NSString *)string {
    objc_setAssociatedObject(self, @selector(string),string , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
-(NSString *)string {
    return objc_getAssociatedObject(self, @selector(string));
}

-(void)addActionHandler:(TouchedBlock)touchHandler {
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)actionTouched:(UIButton *)btn {
    TouchedBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if(block) {
        block(btn.tag);
    }
}


@end
