//
//  CustomTabBar.h
//  DressingCollection
//
//  Created by fan junChao on 13-5-16.
//  Copyright (c) 2013年 fan junChao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MYTabBarHeight 49

@class CustomTabBar;
@protocol CustomTabBarDelegate<NSObject>

@optional
- (void)tabBar:(CustomTabBar *)tabBar didSelectIndex:(NSInteger)index;

@end


@interface CustomTabBar : UIView
{
	UIImageView *_backgroundView;
	NSMutableArray *_buttons;
    
    id <CustomTabBarDelegate> _delegate;
}

@property (nonatomic, retain) UIImageView *backgroundView;
@property (nonatomic, retain) NSMutableArray *buttons;
@property (nonatomic, assign) id <CustomTabBarDelegate> delegate;

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray;
- (void)selectTabAtIndex:(NSInteger)index;
- (void)removeTabAtIndex:(NSInteger)index;
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;
- (void)setBackgroundImage:(UIImage *)img;

@end
