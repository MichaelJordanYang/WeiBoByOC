//
//  JDYAccount.h
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/9.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDYAccount : NSObject <NSCoding>
/** string 用于调用access_token,接口获取授权后的access token */
@property (nonatomic, copy) NSString *access_token;

/** string access_token的生命周期,单位是秒数 */
@property (nonatomic, copy) NSString *expires_in;

/** string 当前授权用户的UID */
@property (nonatomic, copy) NSString *uid;

//** access token 的创建时间 */
@property (nonatomic, strong) NSDate *created_time;
/** 用字典实例化对象的类方法,工厂方法 */
+ (instancetype)accountWithDict: (NSDictionary *)dict;

@end
