//
//  JDYNavViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/28.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYNavViewController.h"
#import "JDYText2ViewController.h"
@interface JDYNavViewController ()

@end

@implementation JDYNavViewController

+ (void)initialize
{
    //设置全局所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置普通状态
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.7];
    
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  重写这个方法的目的:能够拦截所有push进来的控制器
 *
 *  @param viewController: 即将push进来的控制器
 *  @param animated: 是否需要动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        //自动显示和隐藏TabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
        //设置导航栏左边图片内容
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationButtonReturn" hightImage:@"navigationButtonReturnClick"];
        
        //设置导航栏右边图片内容
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_friendattention" hightImage:@"navigationbar_friendattention_highlighted"];
   
    }
    
    [super pushViewController:viewController animated:animated];
    
    NSLog(@"%lu",(unsigned long)self.viewControllers.count);
    
//    NSLog(@"%@",viewController);

}

- (void)back
{
    [self popViewControllerAnimated:YES];
}


- (void)more
{
    JDYText2ViewController *text2 = [[JDYText2ViewController alloc] init];
    [self pushViewController:text2 animated:YES];
}
@end
