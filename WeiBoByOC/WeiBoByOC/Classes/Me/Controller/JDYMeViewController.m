//
//  JDYMeViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/28.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYMeViewController.h"
#import "JDYText1ViewController.h"
@interface JDYMeViewController ()

@end

@implementation JDYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JDYRandomColor;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:0 target:self action:@selector(setting)];
 
    JDYLog(@"JDYMeViewController-viewDidLoad");
}



- (void)setting
{
    JDYText1ViewController *text1 = [[JDYText1ViewController alloc] init];
    
    text1.title = @"ces";
    
    [self.navigationController pushViewController:text1 animated:YES];
}

@end
