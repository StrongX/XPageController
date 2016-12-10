//
//  AppDelegate.m
//  XPageController
//
//  Created by xlx on 16/4/21.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "AppDelegate.h"
#import "XPageViewController.h"
#import "VieViewController.h"

@interface AppDelegate ()<XPageDataSource>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    
    XPageViewController *pageController = [[XPageViewController alloc]init];
    pageController.title = @"Demo";
    pageController.dataSource = self;
    _window.rootViewController = [[UINavigationController alloc]initWithRootViewController:pageController];
    [_window makeKeyAndVisible];

    return YES;
}
/**
 *  XpageDataSource
 *
 */
-(NSInteger)numberOfControllers{
    return 5;
}
-(UIViewController *)XPageCurrentViewController:(NSInteger)index{
    VieViewController *vc = [[VieViewController alloc]init];
    return vc;
}
-(NSString *)XPageTitleOfEachController:(NSInteger)index{
    if (index == 1) {
        return @"123";
    }
    if (index == 3) {
        return @"title";
    }
    return [NSString stringWithFormat:@"ViewController%ld",index];
}

@end
