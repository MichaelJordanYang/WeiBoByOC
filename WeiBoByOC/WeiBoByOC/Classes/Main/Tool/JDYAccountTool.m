//
//  JDYAccountTool.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/9.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#define JDYAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

#import "JDYAccountTool.h"
#import "JDYAccount.h"
@implementation JDYAccountTool


//+ (NSString *)path
//{
//    //返回沙盒路径拼接文件
//    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"];
//}

/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(JDYAccount *)account
{
    //获取账号存储的时间(accessToken的产生时间)
    account.created_time = [NSDate date];

    //自定义对象的存储必须用NSKeyedArchiver,不再有什么writeToFile
    [NSKeyedArchiver archiveRootObject:account toFile:JDYAccountPath];
}

/**
 *  返回账号信息
 *
 *  @return 账号模型(如果账号过期,则返回nil)
 */
+ (JDYAccount *)account
{
    
    //加载模型
    JDYAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:JDYAccountPath];
    
    //验证账号是否过期
    //过期的秒数
    long long expires_in = [account.expires_in longLongValue];
    
    //获取过期的时间
    NSDate *expiresTime = [account.created_time dateByAddingTimeInterval:expires_in];
    
    //获取当前时间
    NSDate *now = [NSDate date];
    
    //如果expiresTime <= now, 过期
    /*
     NSOrderedAscending = -1L,升序,右边 > 左边
     NSOrderedSame, 一样
     NSOrderedDescending 降序, 右边 < 左边
     */
    NSComparisonResult result = [expiresTime compare:now];
    
    if (result != NSOrderedAscending ) { //过期
        return nil;
    }
    JDYLog(@"%@--%@",expiresTime,now);
    return account;
}

@end
