//
//  JDYTabBarViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/27.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYTabBarViewController.h"
#import "JDYNavViewController.h"
#import "JDYHomeViewController.h"
#import "JDYDiscoverViewController.h"
#import "JDYMessageViewController.h"
#import "JDYMeViewController.h"

@interface JDYTabBarViewController ()

@end

@implementation JDYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //首页
    JDYHomeViewController *homeVc = [[JDYHomeViewController alloc] init];
    [self addOneChildVc:homeVc andImageName:[UIImage imageNamed:@"tabbar_home"] andSelectedImageName:[UIImage imageNamed:@"tabbar_home_highlighted"] andTitle:@"首页"];
    
    //消息
    JDYMessageViewController *messageVc = [[JDYMessageViewController alloc] init];
    [self addOneChildVc:messageVc andImageName:[UIImage imageNamed:@"tabbar_message_center"] andSelectedImageName:[UIImage imageNamed:@"tabbar_message_center_highlighted"] andTitle:@"消息"];
    
    //发现
    JDYDiscoverViewController *discoverVc = [[JDYDiscoverViewController alloc] init];
    [self addOneChildVc:discoverVc andImageName:[UIImage imageNamed:@"tabbar_discover"] andSelectedImageName:[UIImage imageNamed:@"tabbar_discover_highlighted"] andTitle:@"发现"];
    
    //我
    JDYMeViewController *meVc = [[JDYMeViewController alloc] init];
    [self addOneChildVc:meVc andImageName:[UIImage imageNamed:@"tabbar_profile"] andSelectedImageName:[UIImage imageNamed:@"tabbar_profile_highlighted"] andTitle:@"我"];
}

/**
 *  重构方法添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 *  @param title             标题
 */
- (void)addOneChildVc:(UIViewController *)childVc andImageName:(UIImage *)imageName andSelectedImageName:(UIImage *)selectedImageName andTitle:(NSString *)title
{
    

//    childVc.view.backgroundColor = JDYRandomColor
    //自定义导航控制器
    JDYNavViewController *nav = [[JDYNavViewController alloc] initWithRootViewController:childVc];
    
    //设置图片
    childVc.tabBarItem.image = imageName;
    //设置选中的图片不被渲染
    UIImage *selectedImage = selectedImageName;
    //使用原图
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置选中原图
    childVc.tabBarItem.selectedImage = selectedImage;
    //设置标题
    childVc.title = title;
    
    //设置文字的样式
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSForegroundColorAttributeName] = JDYColor(123, 124, 123);
   
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [childVc.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
   
    
    //添加每个控制器到TabBar中
    [self addChildViewController:nav];
    
}



@end
