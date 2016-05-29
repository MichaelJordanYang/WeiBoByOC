//
//  UIBarButtonItem+Extension.h
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/29.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image hightImage:(NSString *)hightImage;

@end
