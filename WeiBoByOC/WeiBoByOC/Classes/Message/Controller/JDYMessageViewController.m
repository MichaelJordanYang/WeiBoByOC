




//
//  JDYMessageViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/28.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYMessageViewController.h"
#import "JDYText1ViewController.h"

@interface JDYMessageViewController ()//<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JDYMessageViewController

static NSString *ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.view.backgroundColor = JDYRandomColor;
    
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(composeMsg) image:@"MainTagSubIcon" hightImage:@"MainTagSubIconClick"];
    
//    self.tableView.dataSource = self;
    
//    self.tableView.delegate = self;
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    JDYLog(@"JDYMessageViewController-viewDidLoad");

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)composeMsg
{
    JDYLog(@"点击");
}

#pragma mark --------------------
#pragma mark 数据源
//每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
//每行显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"text-message-%ld",(long)indexPath.row];
    
    return cell;
}

#pragma mark --------------------
#pragma mark 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    JDYText1ViewController *text1 = [[JDYText1ViewController alloc] init];
    
    text1.title = @"测试控制器one";
    
    text1.hidesBottomBarWhenPushed = YES;
    
//     NSLog(@"%@",self.navigationController);
    
    [self.navigationController pushViewController:text1 animated:YES];
}



@end
