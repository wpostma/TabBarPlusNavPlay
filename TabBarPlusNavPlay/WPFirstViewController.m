//
//  WPFirstViewController.m
//  TabBarPlusNavPlay
//
//  Created by Warren Postma on 2013-02-22.
//  Copyright (c) 2013 Warren Postma. All rights reserved.
//

#import "WPFirstViewController.h"

@interface WPFirstViewController ()

@end

@implementation WPFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
