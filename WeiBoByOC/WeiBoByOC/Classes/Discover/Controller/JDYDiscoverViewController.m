//
//  JDYDiscoverViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/28.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYDiscoverViewController.h"

#import "JDYSearchBar.h"

@interface JDYDiscoverViewController ()

@end

@implementation JDYDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JDYRandomColor;
    
    //创建搜索框对象
    JDYSearchBar *searchBar = [JDYSearchBar searchBar];
    searchBar.JDY_width = 357;
    searchBar.JDY_height = 30;

    self.navigationItem.titleView = searchBar;
    
}



@end
