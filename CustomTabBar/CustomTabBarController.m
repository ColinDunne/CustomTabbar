//
//  CustomViewController.m
//  DressingCollection
//
//  Created by fan junChao on 13-5-16.
//  Copyright (c) 2013年 fan junChao. All rights reserved.
//

#import "CustomTabBarController.h"
#import "AppDelegate.h"

@interface CustomTabBarController (private)

- (void)displayViewAtIndex:(NSUInteger)index;

@end


static CustomTabBarController *customTabBarController;

@implementation CustomTabBarController

@synthesize delegate = _delegate;
@synthesize selectedViewController = _selectedViewController;
@synthesize viewControllers = _viewControllers;
@synthesize selectedIndex = _selectedIndex;
@synthesize tabBarHidden = _tabBarHidden;
@synthesize animateDriect;

#pragma mark
#pragma mark - initialization and memory manage
- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr
{
	self = [super init];
	if (self != nil)
	{
		_viewControllers = [[NSMutableArray arrayWithArray:vcs] retain];
		
        CGRect rect = [[UIScreen mainScreen] applicationFrame];
        if ([kSYSTEMVERSION intValue]>=7) {
            rect.size.height += 20;
        }
        
		_containerView = [[UIView alloc] initWithFrame:rect];
		
		_transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - MYTabBarHeight)];
		_transitionView.backgroundColor =  [UIColor groupTableViewBackgroundColor];
		
		_tabBar = [[CustomTabBar alloc] initWithFrame:CGRectMake(0, _containerView.frame.size.height - MYTabBarHeight, 320.0f, MYTabBarHeight) buttonImages:arr];
		_tabBar.delegate = self;
		 
        customTabBarController = self;
        animateDriect = 0;
	}
	return self;
}

- (void)loadView
{
	[super loadView];
	
	[_containerView addSubview:_transitionView];
	[_containerView addSubview:_tabBar];
	self.view = _containerView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.selectedIndex = 0;
}

- (void)viewDidUnload
{	
	_tabBar = nil;
	_viewControllers = nil;
    
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    _tabBar.delegate = nil;
	[_tabBar release];
    [_containerView release];
    [_transitionView release];
	[_viewControllers release];
    
    [super dealloc];
}

#pragma mark
#pragma mark - Acionts
- (CustomTabBar *)tabBar
{
	return _tabBar;
}

- (BOOL)tabBarTransparent
{
	return _tabBarTransparent;
}

- (void)setTabBarTransparent:(BOOL)yesOrNo
{
	if (yesOrNo == YES)
	{
		_transitionView.frame = _containerView.bounds;
	}
	else
	{
		_transitionView.frame = CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - MYTabBarHeight);
	}
}

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated
{
	if (yesOrNO == YES)
	{
		if (self.tabBar.frame.origin.y == self.view.frame.size.height)
		{
			return;
		}
	}
	else
	{
//        if ([kSYSTEMVERSION intValue]>=7) {
//            if (self.tabBar.frame.origin.y == self.view.frame.size.height - MYTabBarHeight)
//            {
//                return;
//            }
//        }
//        else
        {
            if (self.tabBar.frame.origin.y == self.view.frame.size.height - MYTabBarHeight)
            {
                return;
            }
        }
	}
	
	if (animated == YES)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3f];
		if (yesOrNO == YES)
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + MYTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		else
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - MYTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		[UIView commitAnimations];
	}
	else
	{
		if (yesOrNO == YES)
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + MYTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		else
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - MYTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
	}
}

- (NSUInteger)selectedIndex
{
	return _selectedIndex;
}

- (UIViewController *)selectedViewController
{
    return [_viewControllers objectAtIndex:_selectedIndex];
}

-(void)setSelectedIndex:(NSUInteger)index
{
    [self displayViewAtIndex:index];
    [_tabBar selectTabAtIndex:index];
}

- (void)removeViewControllerAtIndex:(NSUInteger)index
{
    if (index >= [_viewControllers count])
    {
        return;
    }
    // Remove view from superview.
    [[(UIViewController *)[_viewControllers objectAtIndex:index] view] removeFromSuperview];
    // Remove viewcontroller in array.
    [_viewControllers removeObjectAtIndex:index];
    // Remove tab from tabbar.
    [_tabBar removeTabAtIndex:index];
}

- (void)insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    [_viewControllers insertObject:vc atIndex:index];
    [_tabBar insertTabWithImageDic:dict atIndex:index];
}

#pragma mark - Private methods
- (void)displayViewAtIndex:(NSUInteger)index
{
    // Before change index, ask the delegate should change the index.
    if ([_delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)])
    {
        if (![_delegate tabBarController:self shouldSelectViewController:[self.viewControllers objectAtIndex:index]])
        {
            return;
        }
    }
    
    // If target index if equal to current index, do nothing.
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0)
    {
        return;
    }
    
    _selectedIndex = index;
    
	UIViewController *selectedVC = [self.viewControllers objectAtIndex:index];
	
	selectedVC.view.frame = _transitionView.frame;
	
    if ([selectedVC.view isDescendantOfView:_transitionView])
	{
		[_transitionView bringSubviewToFront:selectedVC.view];
	}
    
	else
	{
		[_transitionView addSubview:selectedVC.view];
	}
    
    // Notify the delegate, the viewcontroller has been changed.
    if ([_delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)])
    {
        [_delegate tabBarController:self didSelectViewController:selectedVC];
    }
}

#pragma mark  
#pragma mark - CustomTabBarDelegate
- (void)tabBar:(CustomTabBar *)tabBar didSelectIndex:(NSInteger)index
{
    
    //先把所有的label的文字设置成 rgb 84 84 84；
    for (UIView *view in tabBar.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            ((UILabel*)view).textColor = [UIColor whiteColor];
        }
    }
    
    //然后把选中的label的文字颜色设置成。。
    UILabel *lbl = (UILabel*)[tabBar viewWithTag:[[NSString stringWithFormat:@"%d%d",index+1,index+1] intValue]];
    lbl.textColor = [UIColor whiteColor];
    
    if (index==0) {
        
    }
    
	if (self.selectedIndex == index)
    {
        UINavigationController *nav = [self.viewControllers objectAtIndex:index];
        [nav popToRootViewControllerAnimated:YES];
    }
    
    else
    {
        //移除上一个页面
//        UIViewController *selectedVC = [self.viewControllers objectAtIndex:self.selectedIndex];
//        [selectedVC.view removeFromSuperview];
        for (int i=0; i<self.viewControllers.count; i++) {
            if (i!=index)
            {
              UIViewController *selectedVC = [self.viewControllers objectAtIndex:i];
                
              NSLog(@"%@'s view removeFromSuperView",selectedVC.view);
              [selectedVC.view removeFromSuperview];
                
//                MLNavigationController *selectedVC = [self.viewControllers objectAtIndex:i];
//                
//                NSLog(@"%@'s view removeFromSuperView",((UIViewController*)[selectedVC.viewControllers objectAtIndex:0]));
//                if ([((UIViewController*)[selectedVC.viewControllers objectAtIndex:0]).view isDescendantOfView:_transitionView])
//                {
//                    [_transitionView sendSubviewToBack:((UIViewController*)[selectedVC.viewControllers objectAtIndex:0]).view];
//                    //[((UIViewController*)[selectedVC.viewControllers objectAtIndex:0]).view removeFromSuperview];
//                }
                
            }
        }
        [self displayViewAtIndex:index];
    }
}

@end

@implementation UIViewController (LeveyTabBarControllerSupport)

- (CustomTabBarController *)customTabBarController
{
	return customTabBarController;
}

@end

