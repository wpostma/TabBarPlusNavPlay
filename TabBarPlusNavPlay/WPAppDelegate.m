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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
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
    
    // This is a navigation controller. It will be the third item in the
    // main tab bar:
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:navTopLevelViewController];
    
    
    // Even though the navController is the controller for this tab and even though it has a navigationItem and tabBarItem property,
    // setting them here has no effect:
    
    // In a real app you wouldn't bother setting this:
    navController.navigationItem.title = NSLocalizedString(@"NotShown", @"NotShown"); // This is overridden by the inner view's text, so it's not shown.
    
    navController.tabBarItem.image = [UIImage imageNamed:@"navigate"]; // this however, works.
    

   
    self.tabBarController = [[UITabBarController alloc] init];
     
     NSArray *tabs = @[navController,viewController1,viewController2 ];
     

    self.tabBarController.viewControllers = tabs;
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
