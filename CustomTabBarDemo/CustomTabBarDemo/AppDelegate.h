//
//  AppDelegate.h
//  CustomTabBarDemo
//
//  Created by XuDong Jin on 14-6-26.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,CustomTabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
