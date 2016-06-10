//
//  JDYAccount.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/9.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYAccount.h"

@implementation JDYAccount 

/** 用字典实例化对象的类方法,工厂方法 */
+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    JDYAccount *account = [[self alloc] init];
    account.access_token = dict[@"access_token"];
    account.uid = dict[@"uid"];
    account.expires_in = dict[@"expires_in"];
    return account;
}

/**
 *  当一个对象要归档进沙盒中时,就会调用这个方法,它是在归档之前会调用
 *  目的:在这个方法中说明这个对象的哪些属性要存进沙盒
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    //要把一些属性编码进入沙盒,告诉编码哪些要存进沙盒
    [encoder encodeObject:self.access_token forKey:@"access_token"];;
    [encoder encodeObject:self.expires_in forKey:@"expires_in"];
    [encoder encodeObject:self.uid forKey:@"uid"];
    [encoder encodeObject:self.created_time forKey:@"created_time"];
}

/**
 *  当从硬盘中解档一个对象时(从硬盘中加载一个对象时),就会调用这个方法
 *  目的: 在这个方法中说明沙盒中的属性该怎么解析(需要取出那些属性)
 
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]){
        self.access_token = [decoder decodeObjectForKey:@"access_token"];
        self.expires_in = [decoder decodeObjectForKey:@"expires_in"];
        self.uid = [decoder decodeObjectForKey:@"uid"];
        self.created_time = [decoder decodeObjectForKey:@"created_time"];
    }
    return self;
}

@end
