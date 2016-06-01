//
//  JDYSearchBar.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/30.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYSearchBar.h"

@implementation JDYSearchBar

/**
 *  初始化对象
 *
 *  @param frame 指定尺寸
 *
 *  @return 返回一个新的视图对象,
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.font = [UIFont systemFontOfSize:13];
        self.placeholder = @"请输入搜索内容";
        self.background = [UIImage imageNamed:@"searchbox"];
        
        //设置左边的放大镜图标
        UIImageView *searchBarIcon = [[UIImageView alloc] init];
        searchBarIcon.image = [UIImage imageNamed:@"sousuo"];
    
        searchBarIcon.JDY_width = 30;
        searchBarIcon.JDY_height = 30;
        
        //searchBarIcon.backgroundColor = [UIColor orangeColor];
        //设置搜索内容保持中心不变
        searchBarIcon.contentMode = UIViewContentModeCenter;
        
        //设置左边的放大镜view的内容
        self.leftView = searchBarIcon;
        //设置左边的view什么时候显示.=总是显示
        self.leftViewMode = UITextFieldViewModeAlways;

    }
    return self;
}
/**
 *  搜索框方法
 *
 *  @return 返回搜索框
 */
+ (instancetype)searchBar
{
    return [[self alloc] init];
}

@end
