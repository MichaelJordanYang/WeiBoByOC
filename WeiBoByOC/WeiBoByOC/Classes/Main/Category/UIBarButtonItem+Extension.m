//
//  UIBarButtonItem+Extension.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/29.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

/**
 *  创建一个item
 *
 *  @param target     点击item后调用哪个对象的方法
 *  @param action     点击item后调用target的哪个方法
 *  @param image      图片
 *  @param hightImage 高亮的图片
 *
 *  @return 创建完的item
 */

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image hightImage:(NSString *)hightImage
{
    //自定义按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    
    //设置按钮尺寸为当前图片的size
    btn.JDY_size = btn.currentBackgroundImage.size;
    
    //返回按钮位置
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
