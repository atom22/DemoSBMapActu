//
//  DetailNewsViewController.m
//  DemoSBMapActu
//
//  Created by Tom Bentz on 27/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import "DetailNewsViewController.h"

@interface DetailNewsViewController ()
{
    UIView         *headerView;
    UILabel        *headerLbl;
    UIScrollView   *bodyView;
    UIButton       *backBtn;
    
    UIImageView    *logoIV;
    UILabel        *titleLbl;
    UILabel        *dateLbl;
    UILabel        *contentLbl;
}
@end

@implementation DetailNewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    
    headerLbl = [[UILabel alloc] init];
    headerLbl.text = [@"Actualités" uppercaseString];
    headerLbl.textColor = [UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    headerLbl.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:headerLbl];
    
    bodyView = [[UIScrollView alloc] init];
    bodyView.backgroundColor = [UIColor colorWithRed:245.0f/255.0f green:245.0f/255.0f blue:245.0f/255.0f alpha:1];
    bodyView.contentSize = CGSizeMake(bodyView.frame.size.width, BOTTOM_OF_VIEW(contentLbl));
    [self.view addSubview:bodyView];
    
    backBtn = [[UIButton alloc] init];
    [backBtn setImage:[UIImage imageNamed:@"left-75.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goPrevious) forControlEvents:UIControlEventTouchUpInside];
    backBtn.tintColor = [UIColor colorWithRed:49.0f/255.0f green:49.0f/255.0f blue:49.0f/255.0f alpha:1.0f];
    [headerView addSubview:backBtn];
    
    logoIV = [[UIImageView alloc] init];
    logoIV.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.data objectForKey:@"image"]]]];
    logoIV.backgroundColor = [UIColor redColor];
    [bodyView addSubview:logoIV];
    
    titleLbl = [[UILabel alloc] init];
    titleLbl.text = [self.data objectForKey:@"title"];
    titleLbl.backgroundColor = [UIColor orangeColor];
    [bodyView addSubview:titleLbl];
    
    dateLbl = [[UILabel alloc] init];
    dateLbl.text = [self.data objectForKey:@"date"];
    dateLbl.backgroundColor = [UIColor yellowColor];
    [bodyView addSubview:dateLbl];
    
    contentLbl = [[UILabel alloc] init];
    contentLbl.text = [self.data objectForKey:@"description"];
    contentLbl.numberOfLines = 0;
    contentLbl.backgroundColor = [UIColor purpleColor];
    [bodyView addSubview:contentLbl];
    
    double timeStamp = [[self.data objectForKey:@"date"] doubleValue];
    NSLog(@"timestamp %f", timeStamp);
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"dd.MM.yyyy, HH:mm"];
	[timeFormatter setDefaultDate:date];
    
    dateLbl.text = [timeFormatter stringFromDate:date];

}

-(void)viewWillAppear:(BOOL)animated
{
    headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    headerLbl.frame = CGRectMake(30, 30, headerView.frame.size.width - 60, 20);
    bodyView.frame = CGRectMake(0, BOTTOM_OF_VIEW(headerView), self.view.frame.size.width, self.view.frame.size.height - headerView.frame.size.height);
    backBtn.frame= CGRectMake(headerView.frame.size.width / 20, headerView.frame.size.height / 2, headerView.frame.size.width / 15, headerView.frame.size.height / 3);
    
    logoIV.frame = CGRectMake(10, 10, bodyView.frame.size.width * 2 / 5, bodyView.frame.size.width * 2 / 5);
    titleLbl.frame = CGRectMake(RIGHT_OF_VIEW(logoIV) + 20, logoIV.frame.origin.y, bodyView.frame.size.width - RIGHT_OF_VIEW(logoIV) - 30, 40);
    dateLbl.frame = CGRectMake(titleLbl.frame.origin.x, BOTTOM_OF_VIEW(titleLbl) + 10, titleLbl.frame.size.width, titleLbl.frame.size.height);
    contentLbl.frame = CGRectMake(logoIV.frame.origin.x, BOTTOM_OF_VIEW(logoIV) + 30, bodyView.frame.size.width - 2 * logoIV.frame.origin.x, 50);
    [contentLbl sizeToFit];
}

-(void)goPrevious
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
