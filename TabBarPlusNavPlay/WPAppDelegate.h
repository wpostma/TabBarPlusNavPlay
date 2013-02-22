//
//  WPAppDelegate.h
//  TabBarPlusNavPlay
//
//  Created by Warren Postma on 2013-02-22.
//  Copyright (c) 2013 Warren Postma. All rights reserved.
//
// github location:
// https://github.com/wpostma/TabBarPlusNavPlay

#import <UIKit/UIKit.h>

@interface WPAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
