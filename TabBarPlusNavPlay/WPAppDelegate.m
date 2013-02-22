//
//  WPAppDelegate.m
//  TabBarPlusNavPlay
//
//  Created by Warren Postma on 2013-02-22.
//  Copyright (c) 2013 Warren Postma. All rights reserved.
//
// github location:
// https://github.com/wpostma/TabBarPlusNavPlay

#import "WPAppDelegate.h"

#import "WPFirstViewController.h"

#import "WPSecondViewController.h"

#import "WPTopLevelViewController.h"

@implementation WPAppDelegate


// This entire application...didFinishLaunching...
// code sample is only applicable to Apps that do not use nib instantiated root view controller and main window.
// If you have an Application.xib or MainWindow.xib (whatever you called it) then this kind of initialization
// happens quietly and Cocoa does it for you, because it sees that you configured your .plist to have a
// "Main nib file base name" property. This app does NOT have such a property set.
//

// It's also not the sort of code you'd expect to find in application...didFinishLaunching...
// in a storyboard based application.

// This is a "root view and controller created entirely in code in the app delegate, and each view in the
// main tab bar is in its own nib" type of sample.

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // XCode's default generated code to make the delegate instantiate
    // the root view of the system, which is a UIWindow.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // initial demo app had two plain views in tabs. I'm adding a third.
    
    UIViewController *navTopLevelViewController; // I'm adding this view inside the navigation controller.
    UIViewController *viewController1, *viewController2; // these views came already inside this new app.
    
    // The apple sample assumes you want a universal app that can load up a different nib for iPhone and iPad.
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        viewController1 = [[WPFirstViewController alloc] initWithNibName:@"WPFirstViewController_iPhone" bundle:nil];
        viewController2 = [[WPSecondViewController alloc] initWithNibName:@"WPSecondViewController_iPhone" bundle:nil];
        
        navTopLevelViewController = [[WPTopLevelViewController alloc] initWithNibName:@"WPTopLevelViewController_iPhone" bundle:nil];
        
    } else {
        
        viewController1 = [[WPFirstViewController alloc] initWithNibName:@"WPFirstViewController_iPad" bundle:nil];
        viewController2 = [[WPSecondViewController alloc] initWithNibName:@"WPSecondViewController_iPad" bundle:nil];
        
        navTopLevelViewController = [[WPTopLevelViewController alloc] initWithNibName:@"WPTopLevelViewController_iPad" bundle:nil];
        
    }
    
    // First time through I tried to set this, and I found you can't. That might be a clue that
    // this navigationController is automatically determined because the controllers in a hiearchy become
    // aware of each other so that they can work together, and this happens inside Cocoa where I can't see it:
         //navTopLevelViewController.navigationController = navTopLevelViewController;
    
    // This is a navigation controller. It will be the third item in the
    // main tab bar:
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:navTopLevelViewController];
    
    
    // Even though the navController is the controller for this tab and even though it has a navigationItem and tabBarItem property,
    // setting the title here has no effect.  Setting the tabBarItem.image would work if it was done here, but it still should NOT
    // be done here. It is up to the viewcontroller, not the app delegate, to specify what a view's tab bar item should  look like.
    // This happens in a view controller somwehere else:
    
    //navController.navigationItem.title = NSLocalizedString(@"NotShown", @"NotShown"); // This wouldn't be shown anyways.
    //navController.tabBarItem.image = [UIImage imageNamed:@"navigate"]; // This would work but its' the wrong place to do it.
       // go see where this  IS set: WPTopLevelViewController.m in a [UIViewController initWithNibName: ... bundle: ... ]

    
    
    // Here we're creating the tab bar controller and then adding the pages to it.
    self.tabBarController = [[UITabBarController alloc] init];
    NSArray *tabs = @[navController,viewController1,viewController2 ];
    self.tabBarController.viewControllers = tabs;
    
    // now we have a root view controller object, so tell the UIWindow about it, and then make it show
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
