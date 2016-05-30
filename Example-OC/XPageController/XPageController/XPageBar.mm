//
//  XPageBar.m
//  XPageController
//
//  Created by xlx on 16/4/22.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "XPageBar.h"
#import "XPageViewController.h"
@implementation XPageBar
{
    CGFloat width;
    CGFloat height;
    UIScrollView *scrollView;
    NSMutableArray *titleBtnArray;
    
    
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    width = [UIScreen mainScreen].bounds.size.width;
    height = [UIScreen mainScreen].bounds.size.height;
    titleBtnArray = [@[] mutableCopy];
    _selectIndex = 0;
    _normarColor = [UIColor grayColor];
    _didSelectColor = [UIColor colorWithRed:234/255.0 green:69/255.0 blue:47/255.0 alpha:0.8];
    self.backgroundColor = [UIColor whiteColor];
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
    scrollView.showsVerticalScrollIndicator = false;
    scrollView.showsHorizontalScrollIndicator = false;
    
    [self addSubview:scrollView];
    return self;
}

-(void)setXPageTitleArray:(NSMutableArray *)XPageTitleArray{
    _XPageTitleArray = XPageTitleArray;
    CGFloat X = 0;
    for (int i = 0; i<XPageTitleArray.count; i++) {
        NSString *title = XPageTitleArray[i];
        UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(X, 0, [self returnSizeWidthWithTitle:title]+40, 44)];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [titleBtn setTitle:title forState:0];
        [titleBtn setTitleColor:[UIColor grayColor] forState:0];
        [scrollView addSubview:titleBtn];
        X+=([self returnSizeWidthWithTitle:title]+40);
        [titleBtnArray addObject:titleBtn];
        titleBtn.tag = i;
        [titleBtn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:1<<6];
    }
    if (X<width) {
        [self setTitleWidth:(width-X)/_XPageTitleArray.count];
    }else{
        scrollView.contentSize = CGSizeMake(X, 44);
    }
    [self setSelectBtnColor:_selectIndex];
}
-(CGFloat)returnSizeWidthWithTitle:(NSString *)title{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:15]};
    return [title boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
}
/**
 *  重新设置title按钮的高度
 *
 *  @param moreWidth 需要增加的宽度
 */
-(void)setTitleWidth:(CGFloat)moreWidth{
    CGFloat X = 0;
    for (UIButton *btn in titleBtnArray) {
        CGRect rect = btn.frame;
        rect.size.width+=moreWidth;
        rect.origin.x = X;
        btn.frame = rect;
        X+=rect.size.width;
    }
    scrollView.contentSize = CGSizeMake(X, 44);
}
/**
 *  设置选中按钮颜色
 */
-(void)setSelectBtnColor:(NSInteger)index{
    _selectIndex = index;
    for (UIButton *btn in titleBtnArray) {
        [btn setTitleColor:_normarColor forState:0];
    }
    UIButton *selectBtn = titleBtnArray[index];
    [selectBtn setTitleColor:_didSelectColor forState:0];
    [self scrollPageBar];
}
-(void)updateSelectBtn{
    [self setSelectBtnColor:_selectIndex];
}
/**
 *  点击按钮事件
 */
-(void)clickTitleBtn:(UIButton *)btn{
    _selectIndex = btn.tag;
    [self setSelectBtnColor:btn.tag];
    [self scrollPageBar];
    _target.selectIndex = btn.tag;
}
/**
 *  滚动pageBar
 */
-(void)scrollPageBar{
    UIButton *btn = titleBtnArray[_selectIndex];
    CGFloat btnCenter = btn.center.x;
    CGFloat scrollToX = btnCenter - width/2;
    if (scrollToX>0&&scrollToX<scrollView.contentSize.width-width) {
        [scrollView setContentOffset:CGPointMake(scrollToX, 0) animated:true];
    }
    if (scrollToX>scrollView.contentSize.width-width) {
        [scrollView setContentOffset:CGPointMake(scrollView.contentSize.width-width, 0) animated:true];
    }
    if (scrollToX<0) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:true];
        
    }
}
@end
