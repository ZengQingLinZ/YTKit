//
//  YTNetworkTool.m
//  YTAnmation
//
//  Created by Ljcx on 16/3/14.
//  Copyright © 2016年 Ljcx. All rights reserved.
//

#import "YTNetworkTool.h"
#import "AFNetworking/AFHTTPSessionManager.h"
#import <sys/utsname.h>
#import <sys/sysctl.h>



@implementation YTNetworkTool


static YTNetworkTool *shareInstace = nil;

+(instancetype)networkInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstace = [[YTNetworkTool alloc]init];
    });
    return shareInstace;
}

#pragma mark 网络状态的监测

-(void)showNetworkStatus:(networkStatus)statusBlock {
    AFNetworkReachabilityStatus status = [[AFNetworkReachabilityManager manager]networkReachabilityStatus];
    if(statusBlock){
        statusBlock(status);
    }
}

#pragma mark 是否开始转圈圈

-(void)networkActivity:(BOOL)isShow {
    [UIApplication  sharedApplication].networkActivityIndicatorVisible = isShow;
}


#pragma mark 抓取网络数据 POST/GET

-(void)fetchDataFromURL:(NSString *)urlString paramDict:(NSDictionary *)paramDict isPostStyle:(BOOL)isPost successBlock:(success) succesBlock failBlock:(failure) failBlock {
    
    [self showNetworkStatus:^(NSUInteger netStatus) {
        if(netStatus <= 0) {
            NSLog(@"出错啦");
        }else {
            NSLog(@"一切正常");
        }
    }];

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    [self networkActivity:YES];
    
    if(isPost){
        //POST请求
        [manager POST:urlString parameters:paramDict constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(succesBlock) {
                succesBlock(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failBlock) {
                failBlock(task,error);
            }
        }];
        [self networkActivity:NO];
    }else {
        //GET请求
        [manager GET:urlString parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(succesBlock) {
                succesBlock(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failBlock) {
                failBlock(task,error);
            }
        }];
        [self networkActivity:NO];
    }
}


#pragma mark 判断iPhone型号

-(NSString*) deviceName {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

-(NSString *)iPhoneType {
    
    NSString *type = [self deviceName];
    
    if([type isEqualToString:@"iPhone2,1"])  return @"iPhone 3GS";
    if ([type isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([type isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([type isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([type isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([type isEqualToString:@"iPad1,1"])      return @"iPad 1";
    if ([type isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([type isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([type isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([type isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([type isEqualToString:@"iPad3,2"])      return @"iPad 3 (4G,2)";
    if ([type isEqualToString:@"iPad3,3"])      return @"iPad 3 (4G,3)";
    if ([type isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([type isEqualToString:@"iPhone7,1"])    return @"iPhone 6";
    if ([type isEqualToString:@"iPhone7,2"])    return @"iPhone 6 Plus";
    if ([type isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([type isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    return type;
}


@end
