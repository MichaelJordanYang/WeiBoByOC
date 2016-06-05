//
//  JDYDropdownMenu.h
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/30.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDYDropdownMenu;
@protocol JDYDropdownMenuDelegate <NSObject>

@optional
/**
 *  当下拉菜单被销毁时调用
 */
- (void)dropdownMenuDidDismiss:(JDYDropdownMenu *)menu;
/**
 *  当下拉菜单显示的时候调用
 */
- (void)dropdownMenuDidShow:(JDYDropdownMenu *)menu;
@end

@interface JDYDropdownMenu : UIView

@property (nonatomic, weak) id<JDYDropdownMenuDelegate> delegate;


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
