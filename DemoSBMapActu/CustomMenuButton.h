//
//  CustomMenuButton.h
//  DemoSBMapActu
//
//  Created by Tom Bentz on 26/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomMenuButton : UIButton

@property (strong, nonatomic) UIImageView *iconIV;
@property (strong, nonatomic) UILabel     *nameLbl;
@property (strong, nonatomic) UIImage     *unselectedImg;
@property (strong, nonatomic) UIImage     *selectedImg;

@end
