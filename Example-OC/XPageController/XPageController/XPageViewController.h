//
//  XPageViewController.h
//  XPageController
//
//  Created by xlx on 16/4/21.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XPageDataSource <NSObject>

-(NSInteger)numberOfControllers;

-(UIViewController *)XPageCurrentViewController:(NSInteger)index;

-(NSString *)XPageTitleOfEachController:(NSInteger)index;

@end

@interface XPageViewController : UIViewController

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
/**
 *  dataSource
 */
@property (nonatomic,) id<XPageDataSource>dataSource;

@end
