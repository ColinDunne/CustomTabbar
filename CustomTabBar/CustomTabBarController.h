//
//  CustomViewController.h
//  DressingCollection
//
//  Created by fan junChao on 13-5-16.
//  Copyright (c) 2013年 fan junChao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBar.h"

@protocol CustomTabBarControllerDelegate;
@interface CustomTabBarController : UIViewController <CustomTabBarDelegate>
{
    CustomTabBar *_tabBar;
	UIView      *_containerView;
	UIView		*_transitionView;
	NSMutableArray *_viewControllers;
	NSUInteger _selectedIndex;
	
	BOOL _tabBarTransparent;        //_tabBar透明
	BOOL _tabBarHidden;
    
    NSInteger animateDriect;
    
    id <CustomTabBarControllerDelegate> _delegate;
}

@property(nonatomic, copy) NSMutableArray *viewControllers;

@property(nonatomic, readonly) UIViewController *selectedViewController;
@property(nonatomic) NSUInteger selectedIndex;

// Apple is readonly
@property (nonatomic, readonly) CustomTabBar *tabBar;

// Default is NO, if set to YES, content will under tabbar
@property (nonatomic) BOOL tabBarTransparent;
@property (nonatomic) BOOL tabBarHidden;
@property(nonatomic,assign) NSInteger animateDriect;
@property(nonatomic,assign) id<CustomTabBarControllerDelegate> delegate;

- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr;

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated driect:(NSInteger)driect;

// Remove the viewcontroller at index of viewControllers.
- (void)removeViewControllerAtIndex:(NSUInteger)index;

// Insert an viewcontroller at index of viewControllers.
- (void)insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;

@end


@protocol CustomTabBarControllerDelegate <NSObject>

@optional
- (BOOL)tabBarController:(CustomTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(CustomTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end


@interface UIViewController (CustomTabBarControllerSupport)

@property(nonatomic, readonly)  CustomTabBarController *customTabBarController;

@end