//
//  XPageViewController.h
//  XPageController
//
//  Created by xlx on 16/4/21.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XPageViewController : UIViewController


@property (nonatomic, strong) NSArray *controllers;
/**
 *  文字为选中的颜色
 */
@property (nonatomic, strong) UIColor *normalColor;
/**
 *  文字选中以后的颜色
 */
@property (nonatomic, strong) UIColor *selectedColor;
/**
 *  设置标题滚动条的Y值；
 */
@property (nonatomic, ) CGFloat pageY;
/**
 *  设置滚动区滚动到某一个界面
 */
@property (nonatomic, ) NSInteger selectIndex;
/**
 *  设置titleBar的背景颜色
 */
@property (nonatomic, strong) UIColor *titleBarColor;
@end
