//
//  JDYDiscoverViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/28.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYDiscoverViewController.h"

@interface JDYDiscoverViewController ()

@end

@implementation JDYDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JDYRandomColor;
    
//    UISearchBar *searchBar = [[UISearchBar alloc] init];
//    
//    self.navigationItem.titleView = searchBar;
    
    
    
    //创建搜索框对象
    UITextField *searchBar = [[UITextField alloc] init];
    searchBar.JDY_width = 357;
    searchBar.JDY_height = 30;
    searchBar.font = [UIFont systemFontOfSize:13];
    searchBar.placeholder = @"请输入搜索内容";
    searchBar.background = [UIImage imageNamed:@"searchbox"];
    
    //设置左边的放大镜图标
//    UIImageView *searchBarIcon = [[UIImageView alloc] init];
//    searchBarIcon.image = [UIImage imageNamed:@"sousuo"];
    UIImage *image = [UIImage imageNamed:@"sousuo"];
    UIImageView *searchBarIcon = [[UIImageView alloc] initWithImage:image];
    searchBarIcon.JDY_width = 30;
    searchBarIcon.JDY_height = 30;
    
//    searchBarIcon.backgroundColor = [UIColor orangeColor];
//    //设置搜索内容保持中心不变
    searchBarIcon.contentMode = UIViewContentModeCenter;

    //设置左边的放大镜view的内容
    searchBar.leftView = searchBarIcon;
    //设置左边的view什么时候显示.=总是显示
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    
    self.navigationItem.titleView = searchBar;
    
    
}



@end
