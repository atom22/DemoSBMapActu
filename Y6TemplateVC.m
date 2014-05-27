//
//  Y6TemplateVC.m
//  Scan
//
//  Created by Eddy Claessens on 14/01/13.
//  Copyright (c) 2013 IPcrea. All rights reserved.
//

#import "Y6TemplateVC.h"


@interface Y6TemplateVC ()

@end

@implementation Y6TemplateVC

@synthesize headerView, bodyView, footerView;

- (id)init
{
	if (self = [super init]) {
		heightHeaderInit = -1;
		heightFooterInit = -1;
	}
	return self;
}

- (id)initWithHeaderAutoAndFooterHeight:(int)footerHeight
{
	if (self = [self initWithHeaderHeight:-2 andFooterHeight:footerHeight])
	{
        
    }
	return self;
}

- (id)initWithHeaderHeight:(int)headerHeight andFooterHeight:(int)footerHeight
{
	if (self = [self init])
	{
		heightHeaderInit = headerHeight;
		heightFooterInit = footerHeight;
    }
	return self;
}

- (void)loadView {
	[super loadView];
	
	//body part
	bodyView = [[UIScrollView alloc] init];
	[self.view addSubview:bodyView];
	
    
	//header Part
	headerView = [[UIView alloc] init];
	[self.view addSubview:headerView];
   
    if (heightHeaderInit != -1)
    {
        UIImage *headerBkg = [Y6TemplateVC imageForDeviceNamed:@"header_blanc.png"];
        if (headerBkg)
        {
            headerBkgIV = [[UIImageView alloc] initWithImage:headerBkg];
            [headerView addSubview:headerBkgIV];
            
            if (heightHeaderInit == -2)
            {
                heightHeaderInit = headerBkg.size.height;
            }
            
            UIImage *headerTitle = [Y6TemplateVC imageForDeviceNamed:@"headerTitle.png"];
            if (headerTitle)
            {
                headerTitleIV = [[UIImageView alloc] initWithImage:headerTitle];
                [headerBkgIV addSubview:headerTitleIV];
            }
            [headerView sendSubviewToBack:headerTitleIV];
            [headerView sendSubviewToBack:headerBkgIV];
        }
    }
    
	//footer part
	footerView = [[UIView alloc] init];
	[self.view addSubview:footerView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
	[self drawViewIn:[[UIApplication sharedApplication] statusBarOrientation] withDuration:0];

    [super viewWillAppear:animated];

//	[self drawViewIn:[[UIApplication sharedApplication] statusBarOrientation] withDuration:0];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (CGRect)drawViewIn:(UIInterfaceOrientation)orientation withDuration:(NSTimeInterval)duration
{
    CGRect mainFrame = self.view.frame;
    
    UIInterfaceOrientation currentOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (!((UIInterfaceOrientationIsPortrait(orientation) && UIInterfaceOrientationIsPortrait(currentOrientation)) ||
        (UIInterfaceOrientationIsLandscape(orientation) && UIInterfaceOrientationIsLandscape(currentOrientation))))
    {
        if ([[UIApplication sharedApplication] isStatusBarHidden])
            mainFrame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, mainFrame.size.height + STATUS_BAR_HEIGHT, mainFrame.size.width - STATUS_BAR_HEIGHT);
        else 
            mainFrame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, mainFrame.size.height, mainFrame.size.width);
    }
    
     if (heightHeaderInit != -1)
     {
         headerView.frame = CGRectMake(0, 0, mainFrame.size.width, heightHeaderInit);
         [headerBkgIV setFrame:headerView.bounds];
         [headerTitleIV setFrame:CGRectMake(0, 0, headerTitleIV.image.size.width, headerTitleIV.image.size.height)];
         [headerTitleIV setCenter:CGPointMake(headerBkgIV.frame.size.width / 2, headerBkgIV.frame.size.height / 2)];
     }
    
    if (heightFooterInit != -1)
    {
		footerView.frame = CGRectMake(0, mainFrame.size.height - heightFooterInit, mainFrame.size.width, heightFooterInit);
    }
    
    if (heightFooterInit != -1 || heightHeaderInit != -1)
    {
        bodyView.frame = CGRectMake(0, headerView.frame.size.height, mainFrame.size.width, mainFrame.size.height - (heightHeaderInit + heightFooterInit));
    }
    
    return mainFrame;
}

- (void)displayInfo:(NSString *)infos onView:(UIView *)superView
{
    if (infosBlackView == nil)
    {
        infosBlackView = [[UIView alloc] init];
        [infosBlackView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.75]];
        
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [infosBlackView addSubview:spinner];
        
        infosLB = [[UILabel alloc] init];
        [infosLB setBackgroundColor:[UIColor clearColor]];
        [infosLB setTextColor:[UIColor whiteColor]];
        [infosLB setTextAlignment:NSTextAlignmentCenter];
        [infosBlackView addSubview:infosLB];
        
    }
    else
        [infosBlackView removeFromSuperview];
    
    [superView addSubview:infosBlackView];
    
    
    [infosBlackView setFrame:superView.bounds];
    [spinner setCenter:CGPointMake(infosBlackView.frame.size.width / 2, infosBlackView.frame.size.height /2)];
    [infosLB setFrame:CGRectMake(0, BOTTOM_OF_VIEW(spinner) + 25, infosBlackView.frame.size.width, 30)];
    
    [infosBlackView.superview bringSubviewToFront:infosBlackView];
    [infosBlackView setHidden:NO];
    [spinner startAnimating];
    [infosLB setText:infos];
}

- (void)hideInfo
{
    [infosBlackView setHidden:YES];
    [spinner stopAnimating];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self drawViewIn:toInterfaceOrientation withDuration:duration];
}

- (void)goBack
{
    [self goBackAnimated:YES];
}

- (void)goBackAnimated:(BOOL)animated
{
    if (self.navigationController && [self.navigationController.viewControllers count] > 1)
    {
        [self.navigationController popViewControllerAnimated:animated];
    }
}

+ (UIImage *)imageForDeviceNamed:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:[imageName stringByReplacingCharactersInRange:NSMakeRange([imageName length] - 4, 4) withString:[NSString stringWithFormat:@"_%@%@", DEVICE_TYPE, [imageName substringWithRange:NSMakeRange([imageName length] - 4, 4)]]]];
    if (image == nil)
    {
        image = [UIImage imageNamed:imageName];
    }
    return  image;
}

+ (void)adaptAView:(UIView *)inView toThisRect:(CGRect)mainFrame
{
    if (inView.frame.size.width > mainFrame.size.width)
    {
        [inView setFrame:CGRectMake(0, 0,mainFrame.size.width, inView.frame.size.height * mainFrame.size.width / inView.frame.size.width)];
    }
    
    if (inView.frame.size.height > mainFrame.size.height)
    {
        [inView setFrame:CGRectMake(0, 0, inView.frame.size.width * mainFrame.size.height / inView.frame.size.height, mainFrame.size.height)];
    }
    
    [inView setCenter:CGPointMake(mainFrame.origin.x + mainFrame.size.width / 2, mainFrame.origin.y + mainFrame.size.height / 2)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
