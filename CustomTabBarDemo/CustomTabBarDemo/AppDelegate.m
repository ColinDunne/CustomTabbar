//
//  AppDelegate.m
//  CustomTabBarDemo
//
//  Created by XuDong Jin on 14-6-26.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)initCustomtabbar{
    
    //Step 1 ,要装入tabbar的ctrlers
    FirstViewController *ctrl1 = [[FirstViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:ctrl1];
    
    SecondViewController *ctrl2 = [[SecondViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:ctrl2];
    
    ThirdViewController *ctrl3 = [[ThirdViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:ctrl3];
    
    ForthViewController *ctrl4 = [[ForthViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:ctrl4];
    
    NSArray *ctrlArray = [NSArray arrayWithObjects:nav1,nav2,nav3,nav4, nil];
    
    //Step 2,定义tabbar的图片、选中的图片、title
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
    CustomTabBarController *customTabBarController = [[CustomTabBarController alloc]initWithViewControllers:ctrlArray imageArray:imgArr];
    [customTabBarController setTabBarTransparent:YES];
    customTabBarController.delegate = self;
    
    [_window setRootViewController:_nav];

}

@end
