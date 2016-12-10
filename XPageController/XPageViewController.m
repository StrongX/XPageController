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
    NSInteger _numberOfControllers;
    NSMutableDictionary *hasIntControllerTag;
}
-(id)init{
    self = [super init];
    self.automaticallyAdjustsScrollViewInsets = false;
    width = [UIScreen mainScreen].bounds.size.width;
    height = [UIScreen mainScreen].bounds.size.height;
    hasIntControllerTag = [@{} mutableCopy];
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
-(void)setDataSource:(id<XPageDataSource>)dataSource{
    _numberOfControllers = [dataSource numberOfControllers];
    _dataSource = dataSource;
    XScrollView.contentSize = CGSizeMake(width*_numberOfControllers, height);
    NSMutableArray *titleArray = [@[] mutableCopy];
    for (int i = 0; i<_numberOfControllers; i++) {
        [titleArray addObject:[dataSource XPageTitleOfEachController:i]];
    }
    PageBar.XPageTitleArray = titleArray;
    [self setSelectIndex:0];
}
/**
 *  scrollView停止滚动
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/width;
    [self setSelectIndex:index];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat X = scrollView.contentOffset.x;
    PageBar.offX = X;
}
-(void)setSelectIndex:(NSInteger )selectIndex{
    _selectIndex = selectIndex;
    [XScrollView setContentOffset:CGPointMake(selectIndex*width, 0) animated:true];
    [PageBar setSelectBtnColor:selectIndex];
    [self addControllerToScrollView:selectIndex-1];
    [self addControllerToScrollView:selectIndex];
    [self addControllerToScrollView:selectIndex+1];
}
-(void)addControllerToScrollView:(NSInteger)index{
    NSString *strIndex = [NSString stringWithFormat:@"%ld",(long)index];
    if (!((NSNumber *)hasIntControllerTag[strIndex]).boolValue && index<=_numberOfControllers-1 && index>=0) {
        UIViewController *vc = [_dataSource XPageCurrentViewController:index];
        [self addChildViewController:vc];
        CGRect rect = vc.view.frame;
        rect.origin.x = index * width;
        vc.view.frame = rect;
        [XScrollView addSubview:vc.view];
        [hasIntControllerTag setValue:@(true) forKey:strIndex];
    }
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

-(void)setTitleBarColor:(UIColor *)titleBarColor{
    PageBar.backgroundColor = titleBarColor;
}
@end
