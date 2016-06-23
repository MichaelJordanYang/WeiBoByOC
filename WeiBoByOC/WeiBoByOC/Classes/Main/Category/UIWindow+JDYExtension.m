//
//  UIWindow+JDYExtension.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/23.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "UIWindow+JDYExtension.h"
#import "JDYTabBarViewController.h"
#import "JDYNewFeatureViewController.h"


@implementation UIWindow (JDYExtension)

- (void)windowSwitchRootViewController
{
    NSString *key = @"CFBundleVersion";
    
    //上一次使用的版本.存储在沙盒中的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    //当前软件版本号.从info.plist中获取
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    
    //    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    //判断
    if ([currentVersion isEqualToString:lastVersion]){ //版本号相同:这次打开和上次一打开的是同一个版本
        self.rootViewController = [[JDYTabBarViewController alloc] init];
    }else{//这个次打开的版本和上次一的不一样,则显示新版本特性
        self.rootViewController = [[JDYNewFeatureViewController alloc] init];
        
        //将当前版本号存进沙盒中
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
