//
//  JDYOAuthViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/8.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYOAuthViewController.h"
#import "AFNetworking.h"

#import "JDYAccount.h"
#import "JDYAccountTool.h"
#import "MBProgressHUD+XMG.h"
#import "JDYWindowTool.h"

@interface JDYOAuthViewController ()<UIWebViewDelegate>

@end

@implementation JDYOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    
    webView.delegate = self;
    
    [self.view addSubview:webView];
    
    //通过url加载webView
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=4064179859&redirect_uri=http://"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

#pragma mark --------------------
#pragma mark UIWebViewDelegate
/* 网页将加载完成时调用 */
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //    JDYLog(@"webViewDidFinishLoad");
    [MBProgressHUD hideHUD];
}
/* 网页开始时调用 */
- (void)webViewDidStartLoad:(UIWebView *)webView
{
//    JDYLog(@"webViewDidStartLoad");
     [MBProgressHUD showMessage:@"正在加载数据..."];
}

/* 当网页加载失败超时的时候调用 */
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //隐藏HUD
    [MBProgressHUD hideHUD];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
//    JDYLog(@"shouldStartLoadWithRequest--%@",request.URL.absoluteURL);
    
    //1.获取url
    NSString *url = request.URL.absoluteString;
    
    //2.判断是否为回调地址
    NSRange range = [url  rangeOfString:@"code="];
    if (range.length != 0) { //是回调地址
        //截取code=后面的参数值
        NSInteger fromIndex = range.location + range.length;
        NSString *code = [url substringFromIndex:fromIndex];
        
//        JDYLog(@"%@ %@",code,url);
        //利用code换取一个accessToken
        [self accessTokenWithCode:code];
        
        //禁止加载回调地址
        return NO;
    }
    
    return YES;
}

/**
 *  利用code(授权成功后的request token)换取一个accessToken
 *
 *  @param code 授权成功后的request token
 */
- (void)accessTokenWithCode:(NSString *)code
{
    /*
     url: https://api.weibo.com/oauth2/access_token
     请求参数:
     client_id:申请应用时分配的AppKey
     client_secret:申请应用时分配的AppSecret
     grant_type:使用authorization_code
     redirect_uri:授权成功后的回调地址
     code:授权成功后的返回code
     */
    //创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //设置服务器响应序列化返回JSON
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //拼接请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"client_id"] = @"4064179859";
    params[@"client_secret"] = @"1123b4f10695fd122002b1c724c7353e";
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = @"http://";
    params[@"code"] = code;
    
    //发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        //隐藏HUD
        [MBProgressHUD hideHUD];
        
        
        JDYAccount *account = [JDYAccount accountWithDict:responseObject];
        
        //存储账号信息
        [JDYAccountTool saveAccount:account];
        
        
        //切换控制器
        [JDYWindowTool windowSwitchController];
        
        
        NSLog(@"%@---成功",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@失败",error);
        
        //隐藏HUD
        [MBProgressHUD hideHUD];
    }];


    
    
}

@end
