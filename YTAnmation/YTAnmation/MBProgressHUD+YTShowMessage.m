//
//  MBProgressHUD+YTShowMessage.m
//  YTAnmation
//
//  Created by Ljcx on 16/3/14.
//  Copyright © 2016年 Ljcx. All rights reserved.
//

#import "MBProgressHUD+YTShowMessage.h"


@implementation MBProgressHUD (YTShowMessage)


+(MBProgressHUD *)showMessage:(NSString *)message customView:(UIView *)customView mode:(MBProgressHUDMode)modeStyle toView:(UIView *)toView {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:toView animated:YES];
    hud.labelText = message;
    hud.customView = customView;
    hud.mode = modeStyle;
    [hud show:YES];
    
    return hud;
}



@end
