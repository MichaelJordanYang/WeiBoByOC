//
//  JDYTabBar.h
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/2.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JDYTabBar;

/**
 *  因为JDYTabBar继承自UITabBar,所以称为UITabBar的代理,也必须实现UITabBar的代理协议
 */
@protocol JDYTabBarDelegate <UITabBarDelegate>

@optional

//tabBar的按钮点击
- (void)tabBarDidClickPlusButton:(JDYTabBar *)tabBar;

@end

@interface JDYTabBar : UITabBar


@property (nonatomic, weak) id<JDYTabBarDelegate> delegate;

@end
