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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    VieViewController *vc1 = [[VieViewController alloc]init];
    VieViewController *vc2 = [[VieViewController alloc]init];
    VieViewController *vc3 = [[VieViewController alloc]init];
    VieViewController *vc4 = [[VieViewController alloc]init];
    VieViewController *vc5 = [[VieViewController alloc]init];
    
    vc1.title = @"viewController1";
    vc2.title = @"viewController2";
    vc3.title = @"viewController3";
    vc4.title = @"viewController14";
    vc5.title = @"viewController5";
    
    XPageViewController *pageController = [[XPageViewController alloc]init];
    pageController.controllers = @[vc1,vc2,vc3,vc4,vc5];
    pageController.title = @"Demo";
    _window.rootViewController = [[UINavigationController alloc]initWithRootViewController:pageController];
    
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
