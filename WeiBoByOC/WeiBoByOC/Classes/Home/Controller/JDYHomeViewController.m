//
//  JDYHomeViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/28.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYHomeViewController.h"

@interface JDYHomeViewController ()

@end

@implementation JDYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JDYRandomColor;
    
        //设置导航栏上的内容
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendattention" hightImage:@"navigationbar_friendattention_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" hightImage:@"navigationbar_pop_highlighted"];
    
    
    JDYLog(@"JDYHomeViewController-viewDidLoad");
}

- (void)friendSearch
{
    NSLog(@"点击了左边");
}

- (void)pop
{
    NSLog(@"点击了右边");
}

@end
