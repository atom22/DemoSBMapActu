//
//  MotherViewController.h
//  DemoSBMapActu
//
//  Created by Tom Bentz on 26/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y6TemplateVC.h"
#import "CustomMenuButton.h"
#import "AFNetworking.h"

@interface MotherViewController : Y6TemplateVC
{
    UIButton         *menuBtn;
    UILabel          *headerLbl;
    
    CustomMenuButton *newsBtn;
    CustomMenuButton *mapBtn;
    CustomMenuButton *infoBtn;
}

@property (strong, nonatomic) NSArray *dataArray;

- (id)initCustom;

@end
