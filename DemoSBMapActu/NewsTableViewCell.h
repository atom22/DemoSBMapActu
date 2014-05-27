//
//  NewsTableViewCell.h
//  DemoSBMapActu
//
//  Created by Tom Bentz on 26/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *logoIV;
@property (strong, nonatomic) UILabel     *titleLbl;
@property (strong, nonatomic) UILabel     *timeLbl;
@property (strong, nonatomic) UILabel     *contenLbl;

@end
