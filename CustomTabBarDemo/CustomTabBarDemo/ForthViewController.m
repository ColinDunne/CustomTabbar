//
//  ForthViewController.m
//  CustomTabBarDemo
//
//  Created by XuDong Jin on 14-6-26.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "ForthViewController.h"
#import "CustomTabBarController.h"


@interface ForthViewController ()

@end

@implementation ForthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"更多";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(320/2-150/2, 200, 150, 30);
    [btn setTitle:@"隐藏tabbar" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn addTarget:self action:@selector(hideTab) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(320/2-150/2, 250, 150, 30);
    [btn2 setTitle:@"显示tabbar" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor lightGrayColor]];
    [btn2 addTarget:self action:@selector(showTab) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    

}

- (void)hideTab{
    [self.customTabBarController hidesTabBar:YES animated:YES];
}

- (void)showTab{
    [self.customTabBarController hidesTabBar:NO animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
