//
//  NewsViewController.m
//  DemoSBMapActu
//
//  Created by Tom Bentz on 20/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"
#import "DetailNewsViewController.h"

@interface NewsViewController ()
{
    UITableView *newsTV;
}
@end

@implementation NewsViewController

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
    
    [newsBtn setSelected:YES];
    
    newsTV = [[UITableView alloc] init];
    newsTV.backgroundColor = [UIColor clearColor];
    newsTV.delegate = self;
    newsTV.dataSource = self;
    newsTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [bodyView addSubview:newsTV];
    
    headerLbl.text = [@"Actualités" uppercaseString];
}

-(CGRect)drawViewIn:(UIInterfaceOrientation)orientation withDuration:(NSTimeInterval)duration
{
    CGRect mainFrame = [super drawViewIn:orientation withDuration:duration];
    
    newsTV.frame = bodyView.bounds;

    return mainFrame;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // a décommenté une fois que le flux sera OK
    
    //    return self.dataArray.count;
    
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell Identifier";
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.titleLbl.text = @"Nom de l'actualité";
    cell.timeLbl.text = @"24.02.2014, 0:00";
    cell.contenLbl.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et";
    
    
 // A décommenter une fois que le flux sera OK //
    
//    double timeStamp = [[[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"date"] doubleValue];
//    NSLog(@"timestamp %f", timeStamp);
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
//    
//    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
//    [timeFormatter setDateFormat:@"dd.MM.yyyy, HH:mm"];
//	[timeFormatter setDefaultDate:date];
//    
//    cell.timeLbl.text = [timeFormatter stringFromDate:date];
//    
//    cell.titleLbl.text = [[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"title"];
//    cell.contenLbl.text = [[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"description"];
//    cell.logoIV.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"image"]]]];
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailNewsViewController *dvc = [[DetailNewsViewController alloc] init];
    dvc.data = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
}

@end
