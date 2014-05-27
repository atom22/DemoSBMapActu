//
//  Y6SideMenuNavigationController.h
//  Epaillote
//
//  Created by Eddy Claessens on 18/04/2014.
//  Copyright (c) 2014 Hermann Angoula. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Y6SideMenuNavigationController : UINavigationController

@property (nonatomic) BOOL popToRootOnChange;
@property (nonatomic, readonly) int currentSection;


- (void)addSectionWithViewController:(UIViewController *)rootViewController name:(NSString *)name andAnyInfos:(NSDictionary *)infos;

- (void)addSectionWithViewController:(UIViewController *)rootViewController name:(NSString *)name;

- (NSArray *)getSectionInfos;

- (void)goToSectionAtIndex:(int)sectionIndex;

@end
