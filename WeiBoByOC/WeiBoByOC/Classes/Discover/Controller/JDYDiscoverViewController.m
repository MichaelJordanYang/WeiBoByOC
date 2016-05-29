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
    UIImageView *searchBarIcon = [[UIImageView alloc] init];
    searchBarIcon.image = [UIImage imageNamed:@"sousuo"];
    searchBarIcon.JDY_width = 30;
    searchBarIcon.JDY_height = 30;
    searchBarIcon.contentMode = UIViewContentModeCenter;

    searchBar.leftView = searchBarIcon;
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    
    self.navigationItem.titleView = searchBar;
    
    
}



@end
