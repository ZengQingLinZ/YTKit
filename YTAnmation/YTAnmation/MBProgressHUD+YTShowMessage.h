//
//  MBProgressHUD+YTShowMessage.h
//  YTAnmation
//
//  Created by Ljcx on 16/3/14.
//  Copyright © 2016年 Ljcx. All rights reserved.
//

#import "MBProgressHUD.h"


@interface MBProgressHUD (YTShowMessage)

//显示：文字,图片,mode样式

+(MBProgressHUD *)showMessage:(NSString *)message customView:(UIView *)customView mode:(MBProgressHUDMode)modeStyle toView:(UIView *)toView;


@end
