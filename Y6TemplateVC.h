//
//  Y6TemplateVC.h
//  Scan
//
//  Created by Eddy Claessens on 14/01/13.
//  Copyright (c) 2013 IPcrea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoomOutSideMenuViewController.h"

@class XMLToDict;

#define DEVICE_TYPE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ? @"ipad" : @"iphone")

#define STATUS_BAR_HEIGHT 20

@interface Y6TemplateVC : ZoomOutSideMenuViewController
{
    int heightHeaderInit;
    int heightFooterInit;

    //Header Part
    UIView      *headerView;
    UIImageView *headerBkgIV;
    UIImageView *headerTitleIV;

    //Body Part
    UIScrollView *bodyView;

    //Footer Part
    UIView *footerView;
    
    //Display Infos Part
    
    UIView                  *infosBlackView;
    UILabel                 *infosLB;
    UIActivityIndicatorView *spinner;
    
    // compatibility with Network -----
    NSString    *serverAddress;
    XMLToDict   *XMLToDictParser;
    
    // -------
    
    
    // compatibility with textfield ------
    int     decalageBody;
    UIResponder *textFieldFirstResponder;
    
    // object for manage Pickers
    UIView       *viewForPicker;
    UIPickerView *pickerToDisplay;
    UIDatePicker *datePicker;
    NSMutableArray *titlesForPicker;
    SEL sendResultSelector;
    BOOL    isHourPicker;
    BOOL    isDatePicker;
    
    // ---------
}

@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIScrollView *bodyView;
@property (nonatomic, retain) UIView *footerView;

- (id)initWithHeaderAutoAndFooterHeight:(int)footerHeight;
- (id)initWithHeaderHeight:(int)headerHeight andFooterHeight:(int)footerHeight;

- (CGRect)drawViewIn:(UIInterfaceOrientation)orientation withDuration:(NSTimeInterval)duration;

- (void)displayInfo:(NSString *)infos onView:(UIView *)superView;
- (void)hideInfo;

- (void)goBack;
- (void)goBackAnimated:(BOOL)animated;

+ (UIImage *)imageForDeviceNamed:(NSString *)imageName;
+ (void)adaptAView:(UIView *)inView toThisRect:(CGRect)mainFrame;

@end

