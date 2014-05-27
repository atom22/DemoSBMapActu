//
//  Y6TemplateVC+TextField.h
//  
//
//  Created by Eddy Claessens on 20/05/13.
//
//

#import <UIKit/UIKit.h>
#import "Y6TemplateVC.h"


#define SIZE_OF_KEYBOARD_IPHONE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]) ? 162 : 216)


@interface Y6TemplateVC (TextField)

- (void)displayAPickerWith:(NSArray *)choices andReturnChoiceTo:(SEL)selector;
- (void)displayHourPickerandReturnChoiceTo:(SEL)selector;
- (void)displayDatePickerandReturnChoiceTo:(SEL)selector;
- (void)hidePicker:(id)sender;

@end
