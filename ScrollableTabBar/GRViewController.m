//
//  GRViewController.m
//  ScrollableTabBar
//
//  Created by Gaurav Raj on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _tabBar = [[[JSScrollableTabBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44) style:JSScrollableTabBarStyleBlack] autorelease];
	[_tabBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	[_tabBar setDelegate:self];
	[self.view addSubview:_tabBar];
	
	_label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 90, 320, 30)] autorelease];
	[self.view addSubview:_label];
	
	NSMutableArray *items = [NSMutableArray array];
	
	for (int i = 0; i < 25; i++)
	{
		JSTabItem *item = [[JSTabItem alloc] initWithTitle:[NSString stringWithFormat:@"Item %d", i] andColor:[UIColor grayColor] andTextColor:[UIColor whiteColor]];
		[items addObject:item];
		[item release];
	}
	
	[_tabBar setTabItems:items];
	
	UIButton *styleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[styleButton setTitle:@"Change Style" forState:UIControlStateNormal];
	[styleButton addTarget:self
					action:@selector(changeStyle:)
		  forControlEvents:UIControlEventTouchUpInside];
	[styleButton sizeToFit];
	CGRect buttonFrame = [styleButton frame];
	buttonFrame.origin = CGPointMake(150, 150);
	[styleButton setFrame:buttonFrame];
	[self.view addSubview:styleButton];
}


- (void)changeStyle:(id)sender
{
	switch (_tabBar.style) {
		case JSScrollableTabBarStyleBlue:
			_tabBar.style = JSScrollableTabBarStyleBlack;
			break;
		case JSScrollableTabBarStyleBlack:
			_tabBar.style = JSScrollableTabBarStyleTransparent;
			break;
		case JSScrollableTabBarStyleTransparent:
			_tabBar.style = JSScrollableTabBarStyleBlue;
			break;
		default:
			break;
	}
}

- (void)scrollableTabBar:(JSScrollableTabBar *)tabBar didSelectTabAtIndex:(NSInteger)index
{
	[_label setText:[NSString stringWithFormat:@"Selected tab: %d", index]];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
