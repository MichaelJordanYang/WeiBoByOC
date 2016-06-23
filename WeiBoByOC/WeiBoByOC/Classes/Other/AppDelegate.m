//
//  AppDelegate.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/27.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "AppDelegate.h"

#import "JDYOAuthViewController.h"
#import "JDYAccount.h"
#import "JDYAccountTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置窗口根控制器
    JDYAccount *account = [JDYAccountTool account];
    
    if (account) { //之前已经登录成功过,就存进沙盒文件
        //如果有账号信息了,还是要添加新版本,显示新特效,不管上次是不是打开这个软件,上次虽然已经打开这个软件,登录成功了,上次可能再1.0中登录成功,所以这次如果是2.0,还是要显示新特性
        
        //切换控制器

        [self.window windowSwitchRootViewController];
        
    }else{ //沙盒中不存在pilst文件
    
        self.window.rootViewController = [[JDYOAuthViewController alloc] init];
        
    }
    

    //显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
