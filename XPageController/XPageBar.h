//
//  XPageBar.h
//  XPageController
//
//  Created by xlx on 16/4/22.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XPageViewController;


@interface XPageBar : UIView

@property (nonatomic, strong) NSMutableArray *XPageTitleArray;

@property (nonatomic, strong) UIColor *didSelectColor;
@property (nonatomic, strong) UIColor *normarColor;
@property (nonatomic, ) NSInteger selectIndex;

@property (nonatomic) CGFloat offX;

@property (nonatomic, weak) XPageViewController *target;

-(void)setSelectBtnColor:(NSInteger)index;
-(void)updateSelectBtn;

@end
