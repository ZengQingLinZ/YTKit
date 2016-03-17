//
//  UIButton+YTButton.h
//  YTAnmation
//
//  Created by Ljcx on 16/3/14.
//  Copyright © 2016年 Ljcx. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^TouchedBlock)(NSInteger tag);


@interface UIButton (YTButton)

+(UIButton *)butonWithFrame:(CGRect)frame buttonType:(UIButtonType)type text:(NSString*)text textFont:(CGFloat)fontSize textColor:(UIColor *)textColor;

-(void)addActionHandler:(TouchedBlock)touchHandler;

@end
