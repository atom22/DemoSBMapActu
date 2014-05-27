//
//  Y6SideMenuViewController.m
//  Y6SideMenuViewController
//
//  Created by Eddy Claessens on 07/04/2014.
//  Copyright (c) 2014 Ysix. All rights reserved.
//

#import "Y6SideMenuViewController.h"



@interface Y6SideMenuViewController () <UIScrollViewDelegate>
{
	UIView			*dimissSideMenuView;
}

@end

@implementation Y6SideMenuViewController

@synthesize mainView, sideMenuView, closeMenuOnAppear;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
	[super loadView];

	sideMenuView = [[UIView alloc] init];
    [self.view addSubview:sideMenuView];

    globalSV = [[UIScrollView alloc] init];
    [globalSV setDelegate:self];
    [globalSV setPagingEnabled:YES];
    [globalSV setShowsHorizontalScrollIndicator:NO];

    mainView =  [[UIView alloc] init];

	dimissSideMenuView = [[UIView alloc] init];
	[dimissSideMenuView	addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sideMenuClicked)]];
	[mainView addSubview:dimissSideMenuView];

	[globalSV addSubview:mainView];


    [self.view addSubview:globalSV];


	[globalSV setFrame:self.view.frame];

    [sideMenuView setFrame:CGRectMake((OPEN_ON_RIGHT ? self.view.frame.size.width - SIDE_MENU_WIDTH : 0), 0, SIDE_MENU_WIDTH, self.view.frame.size.height)];

    [mainView setFrame:CGRectMake((OPEN_ON_RIGHT ? 0 : sideMenuView.frame.size.width), 0, globalSV.frame.size.width, globalSV.frame.size.height)];
	[dimissSideMenuView setFrame:mainView.bounds];

    [globalSV setContentSize:CGSizeMake(mainView.frame.size.width + sideMenuView.frame.size.width, globalSV.frame.size.height)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (!closeMenuOnAppear)
    {
        [globalSV setContentOffset:GLOBALSV_MENU_CLOSED_OFFSET animated:NO];
    }
    else
    {
        [globalSV setContentOffset:GLOBALSV_MENU_OPENED_OFFSET animated:NO];
    }

	[self scrollViewDidScroll:globalSV];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];

	if (closeMenuOnAppear)
    {
        [globalSV setContentOffset:GLOBALSV_MENU_CLOSED_OFFSET animated:YES];
        closeMenuOnAppear = NO;
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];

	[globalSV setContentOffset:GLOBALSV_MENU_CLOSED_OFFSET];
}

#pragma mark - Menu Opening Methods

- (void)sideMenuClicked
{
	[dimissSideMenuView setHidden:YES];

    if (globalSV.contentOffset.x == GLOBALSV_MENU_CLOSED_OFFSET.x)
    {
        [globalSV setContentOffset:GLOBALSV_MENU_OPENED_OFFSET animated:YES];
    }
    else if (globalSV.contentOffset.x == GLOBALSV_MENU_OPENED_OFFSET.x)
    {
        [globalSV setContentOffset:GLOBALSV_MENU_CLOSED_OFFSET animated:YES];
    }
}

- (void)menuDidOpening
{

    if (dimissSideMenuView.hidden)
	{
		[dimissSideMenuView setHidden:NO];
		[dimissSideMenuView.superview bringSubviewToFront:dimissSideMenuView];
	}
    
}

- (void)menuDidClosing
{
	[dimissSideMenuView setHidden:YES];
}

- (void)menuInTransitionAtOpeningPercent:(float)percent
{
	
}

#pragma mark - ScrollView Delegates Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == globalSV)
    {
		float openedPercent = (scrollView.contentOffset.x * 100.0 / SIDE_MENU_WIDTH);

		if (!OPEN_ON_RIGHT)
			openedPercent = 100 - openedPercent;

        [self menuInTransitionAtOpeningPercent:(openedPercent < 0 ? 0 : openedPercent)];

        if ((OPEN_ON_RIGHT && scrollView.contentOffset.x < GLOBALSV_MENU_CLOSED_OFFSET.x) || (!OPEN_ON_RIGHT && scrollView.contentOffset.x > GLOBALSV_MENU_CLOSED_OFFSET.x))
            [scrollView setContentOffset:GLOBALSV_MENU_CLOSED_OFFSET animated:NO];

        if (scrollView.contentOffset.x == GLOBALSV_MENU_OPENED_OFFSET.x)
        {
            [self.view bringSubviewToFront:sideMenuView];
            [self menuDidOpening];
        }
        else
            [self.view sendSubviewToBack:sideMenuView];

        if (scrollView.contentOffset.x == GLOBALSV_MENU_CLOSED_OFFSET.x)
            [self menuDidClosing];
    }
}


@end
