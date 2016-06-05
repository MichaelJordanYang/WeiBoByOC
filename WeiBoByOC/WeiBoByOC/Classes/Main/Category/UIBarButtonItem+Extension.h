//
//  UIBarButtonItem+Extension.h
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/29.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)


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
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image hightImage:(NSString *)hightImage;

@end
