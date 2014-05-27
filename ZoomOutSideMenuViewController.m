//
//  ZoomOutSideMenuViewController.m
//  SideMenuViewController
//
//  Created by Eddy Claessens on 07/04/2014.
//  Copyright (c) 2014 ipcrea. All rights reserved.
//

#import "ZoomOutSideMenuViewController.h"

@interface ZoomOutSideMenuViewController ()

@end

@implementation ZoomOutSideMenuViewController

- (void)menuInTransitionAtOpeningPercent:(float)percent
{
	[super menuInTransitionAtOpeningPercent:percent];

	float finalPercent = ZOOM_PERCENT + ((100 - ZOOM_PERCENT) * (100 - percent)/100);

	mainView.transform = CGAffineTransformMakeScale(finalPercent / 100., finalPercent/ 100.);
	mainView.transform = CGAffineTransformTranslate(mainView.transform, mainView.frame.size.width * (100 - finalPercent) / 100. * (OPEN_ON_RIGHT ? 1 : -1), 0);
}

@end
