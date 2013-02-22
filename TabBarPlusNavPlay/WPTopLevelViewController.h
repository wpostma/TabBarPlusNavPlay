//
//  WPTopLevelViewController.h
//  TabBarPlusNavPlay
//
//  Created by Warren Postma on 2013-02-22.
//  Copyright (c) 2013 Warren Postma. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WPSubLevelAViewController.h"

@interface WPTopLevelViewController : UIViewController {

    WPSubLevelAViewController * subLevelAViewController;
    
  //  UINavigationController    * navController;  // don't need to do this, as the framework does it for you!
    
}

- (IBAction) userClickedAButton: (id) sender;

//- (void) setNavigationController:(UINavigationController*) navController;  // don't need this!


@end
