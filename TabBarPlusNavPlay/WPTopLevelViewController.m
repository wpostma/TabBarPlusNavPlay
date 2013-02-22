//
//  WPTopLevelViewController.m
//  TabBarPlusNavPlay
//
//  Created by Warren Postma on 2013-02-22.
//  Copyright (c) 2013 Warren Postma. All rights reserved.
//

#import "WPTopLevelViewController.h"

@interface WPTopLevelViewController ()

@end

@implementation WPTopLevelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
                self.title = NSLocalizedString(@"Navigate", @"Navigate");
                self.tabBarItem.image = [UIImage imageNamed:@"navigate"];
        
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


// show a second view, which makes the navigation controller actually do something interesting.

- (IBAction) userClickedAButton: (id) sender {
    //
    NSLog(@"User wants to see another level"); 
}

@end
