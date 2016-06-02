//
//  JDYDropdownMenu.m
//  WeiBoByOC
//
//  Created by xiaoyang on 16/5/30.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYDropdownMenu.h"

@interface JDYDropdownMenu ()
/**
 *  显示具体内容的容器图片
 */
@property (nonatomic, weak) UIImageView *containerView;

@end

@implementation JDYDropdownMenu


//懒加载
- (UIImageView *)containerView
{
    if (!_containerView) {
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.JDY_width = 217;
        containerView.JDY_height = 217;
        containerView.userInteractionEnabled = YES;
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}

/**
 *  初始化对象
 *
 *  @param frame 指定尺寸
 *
 *  @return 返回一个新的视图对象,
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //清除颜色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

/**
 *  下拉菜单方法
 *
 *  @return 返回下拉菜单安妮怒
 */
+ (instancetype)menu
{
    return [[self alloc] init];
}
/**
 *  拿到这个属性重写setter方法
 *
 *  @param content 通过content属性拿到以前的东西
 */
- (void)setContent:(UIView *)content
{
    //保存内容,拥有它防止销毁
    _content = content;
    
    //调整内容的位置
    content.JDY_x = 10;
    
    content.JDY_y = 15;
    
    //调整内容的宽度
    content.JDY_width = self.containerView.JDY_width - 2 * content.JDY_x;
    
    //设置灰色的高度
    self.containerView.JDY_height = CGRectGetMaxY(content.frame) + 10;

    
    //添加内容到灰色的图片中
    [self.containerView addSubview:content];
}



- (void)setContenController:(UIViewController *)contenController
{
    _contenController = contenController;
    
    self.content = contenController.view;
}



/**
 *  显示
 */
- (void)showFrom:(UIView *)from
{
    //1.获取最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    //2.添加自己到窗口中
    [window addSubview:self];
    
    //3.设置尺寸,系统自带的窗口创建出来就是全屏的
    self.frame = window.bounds;
    
    //4.调整灰色图片的位置
    //默认你情况向,frame是以父控件左上角坐标为原点
    //转换坐标系.
    CGRect newFrame = [from convertRect:from.bounds toView:window];
    //获取自身中点的x值
    self.containerView.JDY_centerX = CGRectGetMidX(newFrame);
    
    self.containerView.JDY_y = CGRectGetMaxY(newFrame);
    
}

/**
 *  隐藏
 */
- (void)dismiss
{
    /**
     *  将菜单从窗口中移除
     */
    [self removeFromSuperview];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

@end
