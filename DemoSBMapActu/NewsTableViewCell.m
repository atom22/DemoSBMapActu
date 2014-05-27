//
//  NewsTableViewCell.m
//  DemoSBMapActu
//
//  Created by Tom Bentz on 26/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
        self.logoIV = [[UIImageView alloc] init];
        self.logoIV.frame = CGRectMake(5, 5, CELL_HEIGHT - 10, CELL_HEIGHT - 10);
        [self addSubview:self.logoIV];
        
        self.titleLbl = [[UILabel alloc] init];
        self.titleLbl.frame = CGRectMake(RIGHT_OF_VIEW(self.logoIV) + 5, self.logoIV.frame.origin.y, self.frame.size.width - RIGHT_OF_VIEW(self.logoIV) - 10, 12);
        self.titleLbl.font = [UIFont fontWithName:@"Lato-Bold" size:15];
        [self addSubview:self.titleLbl];
        
        self.timeLbl = [[UILabel alloc] init];
        self.timeLbl.frame = CGRectMake(self.titleLbl.frame.origin.x, BOTTOM_OF_VIEW(self.titleLbl) + 5, self.titleLbl.frame.size.width, 12);
        self.timeLbl.font = [UIFont fontWithName:@"Lato-Bold" size:12];
        [self addSubview:self.timeLbl];
        
        self.contenLbl = [[UILabel alloc] init];
        self.contenLbl.frame = CGRectMake(self.titleLbl.frame.origin.x, BOTTOM_OF_VIEW(self.timeLbl), self.titleLbl.frame.size.width, CELL_HEIGHT - BOTTOM_OF_VIEW(self.timeLbl) - 5);
        self.contenLbl.font = [UIFont fontWithName:@"Lato-Bold" size:12];
        self.contenLbl.numberOfLines = 2;
        [self addSubview:self.contenLbl];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
