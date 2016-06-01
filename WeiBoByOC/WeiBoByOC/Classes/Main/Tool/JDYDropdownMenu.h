//
//  JDYDropdownMenu.h
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/30.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDYDropdownMenu : UIView

+ (instancetype)menu;
/**
 *  显示
 */
- (void)showFrom:(UIView *)from;

/**
 *  隐藏
 */
- (void)dismiss;

/**
 *  内容
 */
//为什么用这个属性呢,就意味着,外部可以方便的添加按钮.添加TableView等控件,外部就不必担心.里面的实现,直接传东西就可以了.
@property (nonatomic, strong) UIView *content;

/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contenController;
@end
