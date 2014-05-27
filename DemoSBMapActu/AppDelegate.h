//
//  AppDelegate.h
//  DemoSBMapActu
//
//  Created by Tom Bentz on 20/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y6SideMenuNavigationController.h"


@class Y6SideMenuNavigationController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Y6SideMenuNavigationController *navC;

@end
