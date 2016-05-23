//
//  XPageViewController.h
//  XPageController
//
//  Created by xlx on 16/4/21.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XPageDataSource <NSObject>

-(NSInteger)XPageCountOfPages;
-(UIViewController *)XPageXurrentViewController;

@end
@protocol XPageDelegate <NSObject>


@end
@interface XPageViewController : UIViewController


@property (nonatomic, strong) NSArray *controllers;
/**
 *  text not selected Color
 */
@property (nonatomic, strong) UIColor *normalColor;
/**
 *  text selected Color
 */
@property (nonatomic, strong) UIColor *selectedColor;
/**
 *  the XPage's Y
 */
@property (nonatomic, ) CGFloat pageY;
/**
 *  the select ViewController
 */
@property (nonatomic, ) NSInteger selectIndex;
/**
 *  titleBar's backgroundColor
 */
@property (nonatomic, strong) UIColor *titleBarColor;
@end
