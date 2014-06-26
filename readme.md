#Step 1 ， 在Appdelegate.h添加代理

```obj-c
 
@interface AppDelegate : UIResponder <UIApplicationDelegate,CustomTabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

    
```

#Step 2 ，Appdelegate.m中

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

#Step 3

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

#Step 4

```obj-c
 customTabBarController = [[CustomTabBarController alloc]initWithViewControllers:ctrlArray imageArray:imgArr];
    [customTabBarController setTabBarTransparent:YES];
    customTabBarController.delegate = self;

    [_window setRootViewController:_nav];
    
```

#Good luck
