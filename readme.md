一个方便好用的自定义tabbar，注意，不支持arc，需添加-fno-objc-arc

![image](https://raw.githubusercontent.com/jxd001/CustomTabbar/master/Untitled3.gif) 

![image](https://raw.githubusercontent.com/jxd001/CustomTabbar/master/Untitled4.gif)
###Step 1，在Appdelegate.h添加代理

```obj-c
 
@interface AppDelegate : UIResponder <UIApplicationDelegate,CustomTabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

    
```

###Step 2，Appdelegate.m中

```obj-c
 //要装入tabbar的ctrlers
    HomeViewCtrl *homeCtrl = [[HomeViewCtrl alloc] initWithNibName:@"HomeViewCtrl" bundle:nil];
    MLNavigationController *nav1 = [[MLNavigationController alloc] initWithRootViewController:homeCtrl];
    
    CompetitionCtrl *compeCtrl = [[CompetitionCtrl alloc] initWithNibName:@"CompetitionCtrl" bundle:nil];
    MLNavigationController *nav2 = [[MLNavigationController alloc] initWithRootViewController:compeCtrl];
    
    
    DataViewCtrl *dataCtrl = [[DataViewCtrl alloc] initWithNibName:@"DataViewCtrl" bundle:nil];
    MLNavigationController *nav3 = [[MLNavigationController alloc] initWithRootViewController:dataCtrl];
   
    MoreViewCtrl *moreCtrl = [[MoreViewCtrl alloc] initWithNibName:@"MoreViewCtrl" bundle:nil];
    MLNavigationController *nav4 = [[MLNavigationController alloc] initWithRootViewController:moreCtrl];
    
    NSArray *ctrlArray = [NSArray arrayWithObjects:nav1,nav2,nav3,nav4, nil];
    
```

###Step 3

```obj-c
//自定义tabbar的图片、选中的图片、title
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic setObject:[UIImage imageNamed:@"新闻"] forKey:@"Default"];
    [imgDic setObject:[UIImage imageNamed:@"新闻-按下"] forKey:@"Seleted"];
    [imgDic setObject:@"新闻" forKey:@"Title"];
    
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic2 setObject:[UIImage imageNamed:@"比赛"] forKey:@"Default"];
    [imgDic2 setObject:[UIImage imageNamed:@"比赛-按下"] forKey:@"Seleted"];
    [imgDic2 setObject:@"比赛" forKey:@"Title"];
    
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic3 setObject:[UIImage imageNamed:@"数据"] forKey:@"Default"];
    [imgDic3 setObject:[UIImage imageNamed:@"数据-按下"] forKey:@"Seleted"];
    [imgDic3 setObject:@"数据" forKey:@"Title"];
    
    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic4 setObject:[UIImage imageNamed:@"更多-新闻"] forKey:@"Default"];
    [imgDic4 setObject:[UIImage imageNamed:@"更多-按下"] forKey:@"Seleted"];
    [imgDic4 setObject:@"更多" forKey:@"Title"];
    
    NSArray *imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,imgDic4,nil];
```

###Step 4

```obj-c
 customTabBarController = [[CustomTabBarController alloc]initWithViewControllers:ctrlArray imageArray:imgArr];
    [customTabBarController setTabBarTransparent:YES];
    customTabBarController.delegate = self;

    [_window setRootViewController:_nav];
    
```

###隐藏与显示tabbar
```obj-c
//因为CustomTabBarController中添加了一个UIViewController的category，类别中可以返回当前的tabbar，所以可以用下面的代码在viewcontroller的任意位置调用self.customTabBarController

//隐藏
[self.customTabBarController hidesTabBar:YES animated:YES];
//显示
[self.customTabBarController hidesTabBar:NO animated:YES];
```

#Good luck
