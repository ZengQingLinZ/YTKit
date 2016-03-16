# YTKit
对于某一个UI控件可以使用便利构造器，采用类别的方式封装了一层，例如，对于UILabel:   <br /> 
+(UILabel *)labelWithFrame:(CGRect)labelFrame text:(NSString *)text font:(CGFloat)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)labelAlignment

对于UIButton:  <br />
+(UIButton *)butonWithFrame:(CGRect)frame buttonType:(UIButtonType)type text:(NSString*)text textFont:(CGFloat)fontSize textColor:(UIColor *)textColor

然后还对AFNetwork封装一层，通过block直接回调返回失败，成功的方法，代码如下：  <br />

//成功回调  <br />
typedef void (^success)(NSURLSessionDataTask *task, id responseObject);

//失败回调  <br />
typedef void (^failure)(NSURLSessionDataTask *task, NSError *error);

-(void)fetchDataFromURL:(NSString *)urlString paramDict:(NSDictionary *)paramDict isPostStyle:(BOOL)isPost successBlock:(success) succesBlock failBlock:(failure) failBlock;  <br />
还有对于网络状态监测，这段代码感觉没什么必要，但是可以少些代码也是不错的，及其是否出现转圈圈的情况的代码：  <br />

//网络监测显示  <br />
typedef void (^networkStatus)(NSUInteger netStatus);
//检测网络状态  <br />
-(void)showNetworkStatus:(networkStatus)statusBlock;

//开始或关闭，网络请求的圈圈  <br />
-(void)networkActivity:(BOOL)isShow;
