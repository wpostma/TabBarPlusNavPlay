//
//  WPSubLevelAViewController.m
//  TabBarPlusNavPlay
//
//  Created by Warren Postma on 2013-02-22.
//  Copyright (c) 2013 Warren Postma. All rights reserved.

// This is a view presented one level down (or inwards if you like) from the WPTopLevelViewController.
// Thanks to the NavBar, you should be able to navigate back from this to the top level.  Having one of
// these lets the Nav Bar do what it was meant to do, which is show you where you are in some hierarchy and
// let you get back to where you were before.//

#import "WPSubLevelAViewController.h"

@interface WPSubLevelAViewController ()

@end

@implementation WPSubLevelAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Details A", @"Details A");
        self.tabBarItem.image = [UIImage imageNamed:@"details"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
