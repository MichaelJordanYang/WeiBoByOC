//
//  UIView+JDY.h
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/28.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JDY)

@property (nonatomic, assign) CGFloat JDY_x;
@property (nonatomic, assign) CGFloat JDY_y;
@property (nonatomic, assign) CGFloat JDY_width;
@property (nonatomic, assign) CGFloat JDY_height;
@property (nonatomic, assign) CGSize JDY_size;
@property (nonatomic, assign) CGPoint JDY_origin;

//提供类方法加载xib
+ (instancetype)JDY_viewFormXib;

@end
