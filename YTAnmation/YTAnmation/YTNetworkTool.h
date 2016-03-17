//
//  YTNetworkTool.h
//  YTAnmation
//
//  Created by Ljcx on 16/3/14.
//  Copyright © 2016年 Ljcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkReachabilityManager.h"



//成功回调
typedef void (^success)(NSURLSessionDataTask *task, id responseObject);

//失败回调
typedef void (^failure)(NSURLSessionDataTask *task, NSError *error);

//网络监测显示
typedef void (^networkStatus)(NSUInteger netStatus);




@interface YTNetworkTool : NSObject


+(instancetype)networkInstance;

//检测网络状态
-(void)showNetworkStatus:(networkStatus)statusBlock;

//开始或关闭，网络请求的圈圈
-(void)networkActivity:(BOOL)isShow;

//判断iPhone 型号
-(NSString *)iPhoneType;


/*  网络请求
 @param urlString 请求的url
 @param paramDict 请求的参数
 @param isPost    POST or GET请求
 @param successBlock 成功之后的回调
 @param failBlock 失败之后的回调
 */

-(void)fetchDataFromURL:(NSString *)urlString paramDict:(NSDictionary *)paramDict isPostStyle:(BOOL)isPost successBlock:(success) succesBlock failBlock:(failure) failBlock;


@end
