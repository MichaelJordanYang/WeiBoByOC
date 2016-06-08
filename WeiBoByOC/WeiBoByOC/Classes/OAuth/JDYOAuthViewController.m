//
//  JDYOAuthViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/8.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYOAuthViewController.h"

@interface JDYOAuthViewController ()

@end

@implementation JDYOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    
    [self.view addSubview:webView];
    
    //通过url加载webView
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=4064179859&redirect_uri=http://"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}


@end
