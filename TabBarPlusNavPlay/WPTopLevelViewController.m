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
    
    // this is a demo so I like to have lots of logging
    NSLog(@"User wants to see another level");
    
    // this is lazy creation of a view controller and its nib loading code, which is just like
    // the nib loading code that XCode generated for me in my app Delegate.  It strikes me that all
    // of this detail should be hidden from this controller level, and in a real production application
    // I'd rather that the stuff below was a class method of [WPSubLevelAViewController loadMyself] or
    // something like that.
    
    if (!subLevelAViewController) {
        
        NSString *nib;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            nib = @"WPSubLevelAViewController_iPhone";
        }
        else {
           nib = @"WPSubLevelAViewController_iPad"; 
        }
        
        subLevelAViewController = [[WPSubLevelAViewController alloc] initWithNibName:nib bundle:nil];
        //subLevelAViewController.parentViewController = self.navigationController; // why am I always trying to write to read only properties?
    }
    
 
    /*
 
     // This is the form of presenting I knew how to code before I wrote this demo code.
     
    UIViewController *aController;
    aController = self.navigationController;
    if (!aController) // fallback to self presentation if we get used without nav controller
        aController = self;
    
    // So this is wrong.  First, if you do this, the view is shown without the nav controller.
    // Secondly, it does so because this is the non-nav-bar style of presenting.
    [aController presentViewController:subLevelAViewController animated:YES completion:nil];
 
     // So if that's not how, then how?
     
     */

  // Aha. I use pushViewController to create an undo-able (pop from stack) navigation
  // movement inwards.  I probably should have read documentation first and tried to code this
  // second.  Pushing and Popping Stack items is covered pretty well in the
  // nav controller's class reference.
    
    // http://developer.apple.com/library/ios/#documentation/uikit/reference/UINavigationController_Class/Reference/Reference.html
    
    if (self.navigationController) {
        [self.navigationController pushViewController:subLevelAViewController animated:YES];
    }
    else
    {
        // Don't crash, dude, it's not nice for users. Better to do nothing visible
        // to the user, in my opinion.
        NSLog(@"Dude, where's my navigationController.");
    }
   
}

@end
