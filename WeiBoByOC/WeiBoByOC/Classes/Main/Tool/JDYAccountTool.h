//
//  JDYAccountTool.h
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/9.
//  Copyright © 2016年 yangChunFu. All rights reserved.
// 处理账号相关的所有操作:存储账户.取出账号.验证账号

#import <Foundation/Foundation.h>

@class JDYAccount;
@interface JDYAccountTool : NSObject

/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(JDYAccount *)account;

/**
 *  返回账号信息
 *
 *  @return 账号模型(如果账号过期,则返回nil)
 */
+ (JDYAccount *)account;
@end
