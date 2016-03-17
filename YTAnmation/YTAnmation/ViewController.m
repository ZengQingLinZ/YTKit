//
//  ViewController.m
//  YTAnmation
//
//  Created by Ljcx on 16/3/14.
//  Copyright © 2016年 Ljcx. All rights reserved.
//

#import "ViewController.h"
#import "YTNetworkTool.h"
#import "YTKit.h"


@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *myScrollView;
@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeTest];
    self.navigationItem.title = @"test";
    [self makeUI];
    
//    UILabel *label = [UILabel labelWithFrame:CGRectMake(50,100,100,60) text:@"尤婷婷" font:13 textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
//    label.backgroundColor = [UIColor redColor];
//    [self.view addSubview:label];
//    
//    UIButton *btn = [UIButton butonWithFrame:CGRectMake(100,200,100,50) buttonType:UIButtonTypeCustom text:@"本宝宝" textFont:14 textColor:[UIColor blackColor]];
//    btn.backgroundColor = [UIColor redColor];
//    [self.view addSubview:btn];
    
    self.myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,64,self.view.frame.size.width,300)];
    self.myScrollView.backgroundColor = [UIColor redColor];
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3,200);
    self.myScrollView.showsHorizontalScrollIndicator = NO;
    self.myScrollView.showsVerticalScrollIndicator = NO;
    self.myScrollView.delegate = self;
    [self.view addSubview:self.myScrollView];
    
    for (int i = 0 ; i < 4; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * i , 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        
 
        UIImage *image = [UIImage imageNamed:@"forward.png"];
        imageView.image = image;
        
        [self.myScrollView addSubview:imageView];
    }
    
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(40,300,150,100)];
    self.pageControl.numberOfPages = 3;
//    self.pageControl.backgroundColor = [UIColor redColor];
    self.pageControl.currentPage = 0;
    [self.pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.pageControl];
    
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];

    
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(50,100,100,100)];
//    testView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:testView];
    
    //位移
    
//    CABasicAnimation *anmation = [CABasicAnimation animationWithKeyPath:@"position"];
//    anmation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0,150)];
//    anmation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
//    anmation.duration = 6.F;
//    anmation.fillMode = kCAFillModeForwards;
//    anmation.removedOnCompletion = NO;
//    [testView.layer addAnimation:anmation forKey:@"positionAnimation"];
    //圆形位移
//    CAKeyframeAnimation *anmation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200,200, 200, 200)];
//    anmation.path = path.CGPath;
//    anmation.duration = 5.f;
//    anmation.removedOnCompletion = NO;
//    [testView.layer addAnimation:anmation forKey:@"positionAnimation"];

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)makeUI {
    UIButton *btn = [UIButton butonWithFrame:CGRectMake(100,500,100,50) buttonType:UIButtonTypeCustom text:@"本宝宝" textFont:14 textColor:[UIColor blackColor]];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(fireButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)fireButtonPressed:(id)sender {
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0f
//                                              target:self
//                                            selector:@selector(timerFire:)
//                                            userInfo:nil
//                                             repeats:YES];
//    [timer fire];
}
-(void)timerFire:(id)userinfo {
    NSLog(@"Fire");
}
//5秒切换图片
//-(void)handleTimer:(NSTimer *)timer {
//    NSUInteger timeNum;
//    BOOL *isShow;
//    
//    if(timeNum % 5 == 0) {
//        if(!isShow) {
//            self.pageControl.currentPage ++;
//            
//        }
//    }
//}



- (void)pageTurn:(UIPageControl *)pageControl {
    
    CGSize viewSize = self.myScrollView.frame.size;
    CGRect rect = CGRectMake(pageControl.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [self.myScrollView scrollRectToVisible:rect animated:YES];

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 记录scrollView 的当前位置， 第几页
    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    
    self.pageControl.currentPage = current;
    
    if (self.pageControl.currentPage == 3) {
        
    }
}



-(void)makeTest {
    
    MBProgressHUD *hud = [MBProgressHUD showMessage:@"本宝宝心里苦，但是本宝宝不说" customView:nil mode:MBProgressHUDModeText toView:self.view];
    
    __weak typeof(self) weakSelf = self;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        [weakSelf makeNet];
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
}


-(void)makeNet {
    NSString *urlString = @"www.baidu.com";
    NSDictionary *dict = @{@"type":@"100"};
    
    [[YTNetworkTool networkInstance]fetchDataFromURL:urlString paramDict:dict isPostStyle:YES successBlock:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"111");
    } failBlock:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"222");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
