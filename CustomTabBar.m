//
//  CustomTabBar.m
//  DressingCollection
//
//  Created by fan junChao on 13-5-16.
//  Copyright (c) 2013年 fan junChao. All rights reserved.
//

#import "CustomTabBar.h"

@implementation CustomTabBar

@synthesize backgroundView = _backgroundView;
@synthesize delegate = _delegate;
@synthesize buttons = _buttons;

#pragma mark - initialization and memory manage
- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray
{
    self = [super initWithFrame:frame];
    
    if (self)
	{
		self.backgroundColor = [UIColor whiteColor];
		_backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundView.image = [UIImage imageNamed:@"tabbarBG"];
		[self addSubview:_backgroundView];
		
		self.buttons = [NSMutableArray arrayWithCapacity:[imageArray count]];
		UIButton *btn;
        UILabel *lbl;
		CGFloat width = 320.0f / [imageArray count];
        
		for (int i = 0; i < [imageArray count]; i++)
		{
			btn = [UIButton buttonWithType:UIButtonTypeCustom];
			btn.showsTouchWhenHighlighted = NO;
            btn.backgroundColor = [UIColor clearColor];
			btn.tag = i;
			btn.frame = CGRectMake(width*(i), 0, width, MYTabBarHeight);
            [btn setImageEdgeInsets:UIEdgeInsetsMake(7, 16, 13, 16)];
			[btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Default"] forState:UIControlStateNormal];
			[btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
			[btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Seleted"] forState:UIControlStateSelected];
			[btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
			[self.buttons addObject:btn];
            
            //tabbar的文字
			lbl = [[UILabel alloc] initWithFrame:CGRectMake(width*i, 29, width, 19)];
            lbl.backgroundColor = [UIColor clearColor];
            lbl.userInteractionEnabled = YES;
            lbl.textAlignment = NSTextAlignmentCenter;
            lbl.text = [[imageArray objectAtIndex:i] objectForKey:@"Title"];
            lbl.textColor = [UIColor whiteColor];
            lbl.font = [UIFont systemFontOfSize:12];
            lbl.tag = [[NSString stringWithFormat:@"%d%d",i+1,i+1] intValue];
            
            if (i==0) {
                lbl.textColor = [UIColor whiteColor];
            }
            
            [self addSubview:lbl];
            [self addSubview:btn];
		}
    }
    return self;
}

- (void)dealloc
{
    [_backgroundView release];
    [_buttons release];
    [super dealloc];
}


#pragma mark
#pragma mark - 按钮事件
- (void)tabBarButtonClicked:(id)sender
{
	UIButton *btn = sender;
	[self selectTabAtIndex:btn.tag];
    //XLOG(@"Select index: %d",btn.tag);
    
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)])
    {
        [_delegate tabBar:self didSelectIndex:btn.tag];
    }
}

#pragma mark
#pragma mark - Actions
- (void)setBackgroundImage:(UIImage *)img
{
	[_backgroundView setImage:img];
}

- (void)selectTabAtIndex:(NSInteger)index
{
	for (int i = 0; i < [self.buttons count]; i++)
	{
		UIButton *b = [self.buttons objectAtIndex:i];
		b.selected = NO;
//		b.userInteractionEnabled = YES;
	}
	UIButton *btn = [self.buttons objectAtIndex:index];
	btn.selected = YES;
//	btn.userInteractionEnabled = NO;
}

- (void)removeTabAtIndex:(NSInteger)index
{
    // Remove button
    [(UIButton *)[self.buttons objectAtIndex:index] removeFromSuperview];
    [self.buttons removeObjectAtIndex:index];
    
    // Re-index the buttons
    CGFloat width = 320.0f / [self.buttons count];
    for (UIButton *btn in self.buttons)
    {
        if (btn.tag > index)
        {
            btn.tag --;
        }
        btn.frame = CGRectMake(width * btn.tag, 0, width, self.frame.size.height);
    }
}
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    // Re-index the buttons
    CGFloat width = 320.0f / ([self.buttons count] + 1);
    for (UIButton *b in self.buttons)
    {
        if (b.tag >= index)
        {
            b.tag ++;
        }
        b.frame = CGRectMake(width * b.tag, 0, width, self.frame.size.height);
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.showsTouchWhenHighlighted = YES;
    btn.tag = index;
    btn.frame = CGRectMake(width * index, 0, width, self.frame.size.height);
    [btn setImage:[dict objectForKey:@"Default"] forState:UIControlStateNormal];
    [btn setImage:[dict objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
    [btn setImage:[dict objectForKey:@"Seleted"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttons insertObject:btn atIndex:index];
    [self addSubview:btn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
