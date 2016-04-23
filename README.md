# XPageController
use to create PageViewController

让我们来看一下效果图：
![](https://github.com/StrongX/XPageController/blob/master/10.gif)
用法十分简单：
```
_window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
VieViewController *vc1 = [[VieViewController alloc]init];
VieViewController *vc2 = [[VieViewController alloc]init];
VieViewController *vc3 = [[VieViewController alloc]init];
VieViewController *vc4 = [[VieViewController alloc]init];
VieViewController *vc5 = [[VieViewController alloc]init];
vc1.title = @"热门";
vc2.title = @"新上榜";
vc3.title = @"日报";
vc4.title = @"七日热门";
vc5.title = @"三十日热门";
XPageViewController *pageController = [[XPageViewController alloc]init];
pageController.controllers = @[vc1,vc2,vc3,vc4,vc5];
pageController.title = @"Demo";
_window.rootViewController = [[UINavigationController alloc]initWithRootViewController:pageController];
[_window makeKeyAndVisible];
```
你需要创建一个XPageViewController，然后给他赋予子控制器，子控制器的title会显示在最上面的滚动条。
你当然可以更改titleBar选中未选中的颜色等之类的属性.
