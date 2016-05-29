//
//  UIView+JDY.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/28.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "UIView+JDY.h"

@implementation UIView (JDY)

+ (instancetype)JDY_viewFormXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (void)setJDY_x:(CGFloat)JDY_x
{
    CGRect frame = self.frame;
    frame.origin.x = JDY_x;
    self.frame = frame;
}

- (void)setJDY_y:(CGFloat)JDY_y
{
    CGRect frame = self.frame;
    frame.origin.y = JDY_y;
    self.frame = frame;
}

- (CGFloat)JDY_x
{
    return self.frame.origin.x;
}

- (CGFloat)JDY_y
{
    return self.frame.origin.y;
}

- (void)setJDY_width:(CGFloat)JDY_width
{
    CGRect frame = self.frame;
    frame.size.width = JDY_width;
    self.frame = frame;
}

- (void)setJDY_height:(CGFloat)JDY_height
{
    CGRect frame = self.frame;
    frame.size.height = JDY_height;
    self.frame = frame;
}

- (CGFloat)JDY_width
{
    return self.frame.size.width;
}

- (CGFloat)JDY_height
{
    return self.frame.size.height;
}

- (void)setJDY_size:(CGSize)JDY_size
{
    CGRect frame = self.frame;
    frame.size = JDY_size;
    self.frame = frame;
}

- (CGSize)JDY_size
{
    return self.frame.size;
}

- (void)setJDY_origin:(CGPoint)JDY_origin
{
    CGRect frame = self.frame;
    frame.origin = JDY_origin;
    self.frame = frame;
}

- (CGPoint)JDY_origin
{
    return self.frame.origin;
}

@end
