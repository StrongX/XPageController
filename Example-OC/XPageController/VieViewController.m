//
//  VieViewController.m
//  XPageController
//
//  Created by xlx on 16/4/21.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "VieViewController.h"

@interface VieViewController ()

@end

@implementation VieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    int red = arc4random()%255;
    int green = arc4random()%255;
    int blue = arc4random()%255;
    self.view.backgroundColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
@end
