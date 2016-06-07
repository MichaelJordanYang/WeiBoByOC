//
//  JDYNewFeatureViewController.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/6/5.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYNewFeatureViewController.h"
#import "JDYTabBarViewController.h"
#define JDYNewFeatrueCount 4

@interface JDYNewFeatureViewController () <UIScrollViewDelegate>
/**
 *  页码
 */
@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation JDYNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //创建一个ScrollView显示版本新特性
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    
    //设置scrollView的代理
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
    //添加图片到scrollView中
    CGFloat scrollW = scrollView.JDY_width;
    CGFloat scrollH = scrollView.JDY_height;
    
    for (int i = 0; i < JDYNewFeatrueCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.JDY_width = scrollW;
        imageView.JDY_height = scrollH;
        imageView.JDY_y = 0;
        imageView.JDY_x = i * scrollW;
        
        //显示图片
        NSString *name = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        //如果是最后一个imageView就往里面添加内容
        if (i == (JDYNewFeatrueCount -1)){
            [self setUpLastImageView:imageView];
        }
    }
    
    //设置scrollView的contenSize
    scrollView.contentSize = CGSizeMake(JDYNewFeatrueCount * scrollW, 0);
    //去除弹簧
    scrollView.bounces = NO;
    //设置自动分页
    scrollView.pagingEnabled = YES;
    //去除水平滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //设置pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = JDYNewFeatrueCount;
    pageControl.currentPageIndicatorTintColor = JDYColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = JDYColor(189, 189, 189);
    pageControl.JDY_centerX = scrollW * 0.5;
    pageControl.JDY_centerY = scrollH - 50;
    [self.view addSubview: pageControl];
    self.pageControl = pageControl;
    
}

#pragma mark --------------------
#pragma mark UIScrollViewDelegate
/**
 *  只要scrollView滚动就会调用这个方法,监听scrollView的滚动
 *
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    //获取当前页码.
    double page = scrollView.contentOffset.x / scrollView.JDY_width;
    self.pageControl.currentPage = (int)(page + 0.5);
    
}
/**
 *  初始化最后一个imageView
 *
 *  @param imageView 最后一个imageView
 */
- (void)setUpLastImageView:(UIImageView *)imageView
{
    //开启交互
    imageView.userInteractionEnabled = YES;
    
    //1.分享给大家按钮
    UIButton *shareBtn = [[UIButton alloc]init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享生活" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    shareBtn.JDY_width = 100;
    shareBtn.JDY_height = 30;
    shareBtn.JDY_centerX = imageView.JDY_width * 0.5;
    shareBtn.JDY_centerY = imageView.JDY_height * 0.65;
    
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    shareBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventAllEvents];
    [imageView addSubview:shareBtn];
    
    //2.开始微博
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    
    
    startBtn.JDY_size = startBtn.currentBackgroundImage.size;
    startBtn.JDY_centerX = shareBtn.JDY_centerX;
    startBtn.JDY_centerY = imageView.JDY_height * 0.72;
    [startBtn setTitle:@"进入微博" forState:UIControlStateNormal];
    
    [startBtn addTarget:self action:@selector(pushNextClick) forControlEvents:UIControlEventAllEvents];
    [imageView addSubview:startBtn];
}
/**
 *  分享点击按钮
 */
- (void)shareClick:(UIButton *)shareBtn
{
    //分享按钮状态取反
    shareBtn.selected = !shareBtn.isSelected;
}

/**
 *  点击进入窗口的根控制器
 */
- (void)pushNextClick
{
    
    UIWindow *window = [UIApplication sharedApplication] .keyWindow;
    
    window.rootViewController = [[JDYTabBarViewController alloc] init];
    
}
@end
