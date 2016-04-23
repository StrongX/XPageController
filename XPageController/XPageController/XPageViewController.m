//
//  XPageViewController.m
//  XPageController
//
//  Created by xlx on 16/4/21.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "XPageViewController.h"
#import "XPageBar.h"

@interface XPageViewController ()<UIScrollViewDelegate>

@end

@implementation XPageViewController
{
    CGFloat width;
    CGFloat height;
    UIScrollView *XScrollView;
    XPageBar *PageBar;
}
-(id)init{
    self = [super init];
    self.automaticallyAdjustsScrollViewInsets = false;
    width = [UIScreen mainScreen].bounds.size.width;
    height = [UIScreen mainScreen].bounds.size.height;
    
    XScrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    XScrollView.pagingEnabled = true;
    XScrollView.showsVerticalScrollIndicator = false;
    XScrollView.showsHorizontalScrollIndicator = false;
    XScrollView.bounces = false;
    XScrollView.delegate = self;
    [self.view addSubview:XScrollView];
    PageBar = [[XPageBar alloc] initWithFrame:CGRectMake(0, 64, width, 44)];
    PageBar.target = self;
    [self.view addSubview:PageBar];
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"pageViewController didReceiveMemoryWarning");
}
-(void)setControllers:(NSArray *)controllers{
    _controllers = controllers;
    NSMutableArray *titleArray = [@[] mutableCopy];
    for (int i = 0; i<controllers.count; i++) {
        UIViewController *controller = controllers[i];
        [self addChildViewController:controller];
        CGRect rect = self.view.frame;
        rect.origin.x = i*width;
        controller.view.frame = rect;
        [XScrollView addSubview:controller.view];
        [titleArray addObject:controller.title];
    }
    PageBar.XPageTitleArray = titleArray;
    XScrollView.contentSize = CGSizeMake(width*controllers.count, height);
}
/**
 *  scrollView停止滚动
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/width;
    [PageBar setSelectBtnColor:index];
}
-(void)setNormalColor:(UIColor *)normalColor{
    PageBar.normarColor = normalColor;
    [PageBar updateSelectBtn];
}
-(void)setSelectedColor:(UIColor *)selectedColor{
    PageBar.didSelectColor = selectedColor;
    [PageBar updateSelectBtn];
}
-(void)setPageY:(CGFloat)pageY{
    _pageY = pageY;
    CGRect rect = PageBar.frame;
    rect.origin.y = pageY;
    PageBar.frame = rect;
}
-(void)setSelectIndex:(NSInteger )selectIndex{
    _selectIndex = selectIndex;
    [XScrollView setContentOffset:CGPointMake(selectIndex*width, 0) animated:true];
    [PageBar setSelectBtnColor:selectIndex];
}
@end
