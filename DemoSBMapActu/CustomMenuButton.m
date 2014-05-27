//
//  CustomMenuButton.m
//  DemoSBMapActu
//
//  Created by Tom Bentz on 26/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import "CustomMenuButton.h"

@implementation CustomMenuButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.iconIV = [[UIImageView alloc] init];
        self.iconIV.frame = CGRectMake(10, 8, self.frame.size.height - 16, self.frame.size.height - 16);
        [self addSubview:self.iconIV];
        
        self.nameLbl = [[UILabel alloc] init];
        self.nameLbl.frame = CGRectMake(RIGHT_OF_VIEW(self.iconIV) + 10, self.iconIV.frame.origin.y, self.frame.size.width - RIGHT_OF_VIEW(self.iconIV) - 15, self.iconIV.frame.size.height);
        self.nameLbl.font = [UIFont fontWithName:@"OpenSans-Light" size:16];
        [self addSubview:self.nameLbl];
        
    }
    return self;
}

-(void)setSelected:(BOOL)selected
{
    if (selected)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.nameLbl.textColor = [UIColor blackColor];
        [self.iconIV setImage:self.selectedImg];
    }
    else
    {
        self.backgroundColor = [UIColor clearColor];
        self.nameLbl.textColor = [UIColor whiteColor];
        [self.iconIV setImage:self.unselectedImg];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
