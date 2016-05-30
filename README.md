# XPageController
use to create PageViewController

design sketch：

![](https://github.com/StrongX/XPageController/blob/master/10.gif)

# Install
you just need drag the XPageController folder to your project

# Usage
```
_window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
XPageViewController *pageController = [[XPageViewController alloc]init];
pageController.title = @"Demo";
pageController.dataSource = self;
_window.rootViewController = [[UINavigationController alloc]initWithRootViewController:pageController];

```
-you should implementation dataSource
```
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
return [NSString stringWithFormat:@"ViewController%ld",index];
}
```
# Other
you should init a XPageViewController,and set the childController,the childController's title will show above the Controller.
you can change the title's color and title's backGroundColor

