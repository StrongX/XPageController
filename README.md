# XPageController
use to create PageViewController

design sketch：

![](https://github.com/StrongX/XPageController/blob/master/10.gif)

# Install
you just need drag the XPageController folder to your project

# Usage
```
_window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    VieViewController *vc1 = [[VieViewController alloc]init];
    VieViewController *vc2 = [[VieViewController alloc]init];
    VieViewController *vc3 = [[VieViewController alloc]init];
    VieViewController *vc4 = [[VieViewController alloc]init];
    VieViewController *vc5 = [[VieViewController alloc]init];
    
    vc1.title = @"viewController1";
    vc2.title = @"viewController2";
    vc3.title = @"viewController3";
    vc4.title = @"viewController4";
    vc5.title = @"viewController5";
    
    XPageViewController *pageController = [[XPageViewController alloc]init];
    
    pageController.selectedColor = XPageRedColor;
    pageController.normalColor = [UIColor lightGrayColor];      //default Color is  lightGrayColor
    pageController.titleBarColor = [UIColor whiteColor];        //default Color is  whiteColor
    
    pageController.controllers = @[vc1,vc2,vc3,vc4,vc5];
    pageController.title = @"Demo";
    _window.rootViewController = [[UINavigationController alloc]initWithRootViewController:pageController];
    
    [_window makeKeyAndVisible];
```
# Other
you should init a XPageViewController,and set the childController,the childController's title will show above the Controller.
you can change the title's color and title's backGroundColor

