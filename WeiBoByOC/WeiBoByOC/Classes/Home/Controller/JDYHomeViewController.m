//
//  JDYHomeViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/28.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYHomeViewController.h"
#import "JDYDropdownMenu.h"

#import "JDYMenuViewController.h"
@interface JDYHomeViewController ()<JDYDropdownMenuDelegate>

//@property (nonatomic, weak) UIButton *titleButton;

@end

@implementation JDYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JDYRandomColor;
    
        //设置导航栏上的内容
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendattention" hightImage:@"navigationbar_friendattention_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" hightImage:@"navigationbar_pop_highlighted"];
    
    /*中间标题按钮*/
    UIButton *titleBtn = [[UIButton alloc] init];
    titleBtn.JDY_width = 100;
    titleBtn.JDY_height = 30;
    
    //设置中间图片和文字
    [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -120);
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);

    [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleBtn;
    
}
/**
 *  标题点击
 */
- (void)titleClick:(UIButton *)titleButton
{
    //创建下拉菜单
    JDYDropdownMenu *menu = [JDYDropdownMenu menu];
    
    //设置代理
    menu.delegate = self;
    
    //设置内容
    JDYMenuViewController *menuVc = [[JDYMenuViewController alloc] init];
    
    menuVc.view.JDY_height = 44 * 2;
    
    menu.contenController = menuVc;
    
    //显示
    [menu showFrom:titleButton];
    
  
    
}

- (void)friendSearch
{
    NSLog(@"点击了左边");
}

- (void)pop
{
    NSLog(@"点击了右边");
}


#pragma mark --------------------
#pragma mark JDYDropdownMenuDelegate
/**
 *  下拉菜单被销毁了调用
 */
- (void)dropdownMenuDidDismiss:(JDYDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    //箭头朝下
    titleButton.selected = NO;
//    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
}
/**
 *  下拉菜单显示调用
 */
- (void)dropdownMenuDidShow:(JDYDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    //让箭头向上
//    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    titleButton.selected = YES;

}


@end
