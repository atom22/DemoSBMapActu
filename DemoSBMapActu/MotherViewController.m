//
//  MotherViewController.m
//  DemoSBMapActu
//
//  Created by Tom Bentz on 26/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import "MotherViewController.h"
#import "Y6SideMenuNavigationController.h"
#import "FormViewController.h"

@interface MotherViewController ()
{
    UIImageView      *logoIV;
    
    UILabel          *eventNameLbl;

    UIView           *line1;
    UIView           *line2;
    
    UIButton    *tempExitBtn;
}
@end

@implementation MotherViewController

- (id)initCustom
{
    self = [super initWithHeaderHeight:64 andFooterHeight:0];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    
    [self loadData];
    
    [headerView removeFromSuperview];
    [bodyView removeFromSuperview];
    [footerView removeFromSuperview];
    
    [mainView addSubview:bodyView];
    [mainView addSubview:footerView];
    [mainView addSubview:headerView];
    
    bodyView.backgroundColor = [UIColor colorWithRed:245.0f/255.0f green:245.0f/255.0f blue:245.0f/255.0f alpha:1];
    sideMenuView.backgroundColor = [UIColor grayColor];
    
    self.dataArray = [[NSArray alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    
    headerView.backgroundColor = [UIColor whiteColor];
    
    headerLbl = [[UILabel alloc] init];
    headerLbl.text = @"Démo SmartBeacon";
    headerLbl.textColor = [UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    headerLbl.font = [UIFont fontWithName:@"OpenSans-Bold" size:16];
    headerLbl.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:headerLbl];
    
    logoIV = [[UIImageView alloc] init];
    [headerView addSubview:logoIV];
    
    eventNameLbl = [[UILabel alloc] init];
    eventNameLbl.text = [@"Nom d'évenement" uppercaseString];
    eventNameLbl.font = [UIFont fontWithName:@"OpenSans-Bold" size:18];
    eventNameLbl.textColor = [UIColor whiteColor];
    eventNameLbl.textAlignment = NSTextAlignmentCenter;
    [sideMenuView addSubview:eventNameLbl];
    
    newsBtn = [[CustomMenuButton alloc] initWithFrame:CGRectMake(0, BOTTOM_OF_VIEW(eventNameLbl) + 60, self.view.frame.size.width, 40)];
    newsBtn.nameLbl.text = [@"Actualités" uppercaseString];
    newsBtn.selectedImg = [UIImage imageNamed:@"news_black.png"];
    newsBtn.unselectedImg = [UIImage imageNamed:@"news_white.png"];
    [newsBtn addTarget:self action:@selector(goNews) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuView addSubview:newsBtn];
    
    mapBtn = [[CustomMenuButton alloc] initWithFrame:CGRectMake(0, BOTTOM_OF_VIEW(line1), newsBtn.frame.size.width, newsBtn.frame.size.height)];
    mapBtn.nameLbl.text = [@"Voir les évènements" uppercaseString];
    mapBtn.selectedImg = [UIImage imageNamed:@"map_black.png"];
    mapBtn.unselectedImg = [UIImage imageNamed:@"map_white.png"];
    [mapBtn addTarget:self action:@selector(goMap) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuView addSubview:mapBtn];
    
    infoBtn = [[CustomMenuButton alloc] initWithFrame:CGRectMake(0, BOTTOM_OF_VIEW(line2), newsBtn.frame.size.width, newsBtn.frame.size.height)];
    infoBtn.nameLbl.text = [@"Information" uppercaseString];
    infoBtn.selectedImg = [UIImage imageNamed:@"info_black.png"];
    infoBtn.unselectedImg = [UIImage imageNamed:@"info_white.png"];
    [infoBtn addTarget:self action:@selector(goInfo) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuView addSubview:infoBtn];
    
    line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor whiteColor];
    [sideMenuView addSubview:line1];
    
    line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor whiteColor];
    [sideMenuView addSubview:line2];
    
    [newsBtn setSelected:NO];
    [mapBtn setSelected:NO];
    [infoBtn setSelected:NO];
    
    menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuBtn setImage:[UIImage imageNamed:@"button_list_topbar.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(sideMenuClicked) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:menuBtn];
    
    tempExitBtn = [[UIButton alloc] init];
    tempExitBtn.backgroundColor = [UIColor purpleColor];
    [tempExitBtn addTarget:self action:@selector(goExit) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuView addSubview:tempExitBtn];
    NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Lato"]);
}

-(CGRect)drawViewIn:(UIInterfaceOrientation)orientation withDuration:(NSTimeInterval)duration
{
    CGRect mainFrame = [super drawViewIn:orientation withDuration:duration];
    
    headerLbl.frame = CGRectMake(30, 30, headerView.frame.size.width - 60, 20);
    
    logoIV.frame = CGRectMake(headerView.frame.size.width - 25, 10, 20, 20);
    
    eventNameLbl.frame = CGRectMake(20, 60, sideMenuView.frame.size.width - 40, 30);
    
    newsBtn.frame = CGRectMake(0, BOTTOM_OF_VIEW(eventNameLbl) + 60, sideMenuView.frame.size.width, 40);
    
    line1.frame = CGRectMake(0, BOTTOM_OF_VIEW(newsBtn), sideMenuView.frame.size.width, 1);
    
    mapBtn.frame = CGRectMake(0, BOTTOM_OF_VIEW(line1), newsBtn.frame.size.width, newsBtn.frame.size.height);
    
    line2.frame = CGRectMake(0, BOTTOM_OF_VIEW(mapBtn), sideMenuView.frame.size.width, 1);
    
    infoBtn.frame = CGRectMake(0, BOTTOM_OF_VIEW(line2), newsBtn.frame.size.width, newsBtn.frame.size.height);
    
    [menuBtn setFrame:CGRectMake(0, 0, menuBtn.currentImage.size.width, menuBtn.currentImage.size.height)];
    [menuBtn setCenter:CGPointMake(headerView.frame.size.height * 4 / 9, headerView.frame.size.height * 7 / 11)];
    
    tempExitBtn.frame = CGRectMake(20, BOTTOM_OF_VIEW(infoBtn) + 20, 100, 30);
    
    return mainFrame;
}

-(void)goNews
{
    [(Y6SideMenuNavigationController *)self.navigationController goToSectionAtIndex:0];
}

-(void)goMap
{
    [(Y6SideMenuNavigationController *)self.navigationController goToSectionAtIndex:1];
}

-(void)goInfo
{
    [(Y6SideMenuNavigationController *)self.navigationController goToSectionAtIndex:2];
}

-(void)goExit
{
    FormViewController *fvc = [[FormViewController alloc] initCustom];
    [self.navigationController pushViewController:fvc animated:YES];
}

-(void)loadData
{
    NSURL *url = [NSURL URLWithString:@"http://www.galerie-sakura.com/mobile/"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    [httpClient postPath:@"photosfeed.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableDictionary *dict=  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
         
         self.dataArray = [dict objectForKey:@"feed"];
     
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
         [self hideInfo];
     }];
}

@end
