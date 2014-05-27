//
//  Y6SideMenuViewController.h
//  Y6SideMenuViewController
//
//  Created by Eddy Claessens on 07/04/2014.
//  Copyright (c) 2014 Ysix. All rights reserved.
//

#import <UIKit/UIKit.h>

// be careful, there is a bug in the iOS simulator, if you open the menu via the sideMenuClicked method, the menu will re-closing itself, this bug is not present in the device.

#define SIDE_MENU_WIDTH 290 // in pixels

#define OPEN_ON_RIGHT NO // for changing the side of the menu

#define GLOBALSV_MENU_CLOSED_OFFSET ((OPEN_ON_RIGHT ? CGPointMake(0, 0) : CGPointMake(sideMenuView.frame.size.width, 0)))
#define GLOBALSV_MENU_OPENED_OFFSET ((OPEN_ON_RIGHT ? CGPointMake(sideMenuView.frame.size.width, 0) : CGPointMake(0, 0)))

@interface Y6SideMenuViewController : UIViewController
{
    UIView          *sideMenuView;
    UIView          *mainView;
	BOOL            closeMenuOnAppear;
    UIScrollView    *globalSV;

}

@property	(nonatomic) 	BOOL            closeMenuOnAppear; // if set to YES the view controller will be shown with the menu open and will be closing it with an animation, basically set this to YES when the user change the current section in the side menu, this will be re-set to NO on each viewWillAppear 

@property (nonatomic, strong) UIView *mainView; // must be used instead of self.superview

@property (nonatomic, strong) UIView *sideMenuView; // the side menu view


- (void)menuDidClosing; // called when the menu is full closed
- (void)menuDidOpening; // called when the menu is full opened
- (void)menuInTransitionAtOpeningPercent:(float)percent; // called when the menu is in transition with the opening percent in parameters
- (void)sideMenuClicked; // call it to close/open the menu via a button or any user action


@end
