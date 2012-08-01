//
//  GRViewController.h
//  ScrollableTabBar
//
//  Created by Gaurav Raj on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSScrollableTabBar.h"

@interface GRViewController : UIViewController <JSScrollableTabBarDelegate>
{
    JSScrollableTabBar *_tabBar;
    UILabel *_label;
}
@end
