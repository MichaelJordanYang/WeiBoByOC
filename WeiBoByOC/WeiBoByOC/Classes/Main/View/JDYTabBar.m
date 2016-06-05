//
//  JDYTabBar.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/2.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYTabBar.h"

@interface JDYTabBar ()

@property (nonatomic, weak) UIButton *addBtn;

@end

@implementation JDYTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //3.添加按钮到tabbar中
        UIButton *addBtn = [[UIButton alloc] init];
        [addBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [addBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [addBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [addBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        addBtn.JDY_size = addBtn.currentBackgroundImage.size;
        //给加号按钮添加点击事件
        [addBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:addBtn];
        self.addBtn = addBtn;
    }
    return self;
}

/**
 *  加号按钮点击
 */
- (void)plusClick
{
    //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //1.设置加号按钮的位置
    self.addBtn.JDY_centerX = self.JDY_width * 0.5;
    self.addBtn.JDY_centerY = self.JDY_height * 0.5;
    
    //2.设置其他TabBarButton的位置和尺寸
    CGFloat tabbarButtonW = self.JDY_width / 5;
    CGFloat tabbarButtonIndex = 0;
    
    
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        
        if ([child isKindOfClass:class]) {
            //设置宽度
            child.JDY_width = tabbarButtonW;
            
            //设置x
            child.JDY_x = tabbarButtonIndex * tabbarButtonW;
            
            //增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}


@end
