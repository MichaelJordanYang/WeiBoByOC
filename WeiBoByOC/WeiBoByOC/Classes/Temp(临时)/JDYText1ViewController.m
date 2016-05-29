//
//  JDYText1ViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/29.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYText1ViewController.h"
#import "JDYText2ViewController.h"

@interface JDYText1ViewController ()

@end

@implementation JDYText1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
        
    
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    JDYText2ViewController *text2 = [[JDYText2ViewController alloc] init];
    
    text2.title = @"测试控制器2";
    
    [self.navigationController pushViewController:text2 animated:YES];
}



@end
