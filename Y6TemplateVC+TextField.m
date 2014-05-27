//
//  Y6TemplateVC+TextField.m
//  
//
//  Created by Eddy Claessens on 20/05/13.
//
//

#import "Y6TemplateVC+TextField.h"


@implementation Y6TemplateVC (TextField)

#pragma mark - TextFieldDelegate functions


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self hidePicker:nil];
    textFieldFirstResponder = textField;
    [bodyView setFrame:CGRectMake(bodyView.frame.origin.x, bodyView.frame.origin.y + decalageBody, bodyView.frame.size.width, bodyView.frame.size.height)];
    decalageBody = 0;
    
    CGRect frameOnMainView = [textField convertRect:textField.bounds toView:self.view];
    CGFloat viewHeight;
    viewHeight = self.view.frame.size.height;
    
    if (![self.navigationController.viewControllers containsObject:self] && UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
    {
        viewHeight = ([[UIApplication sharedApplication] isStatusBarHidden] ? 320 : 300);
    } // /!\ ce if est la pour resoudre un "bug" qui fait que self.view.frame.size.height n'est pas a la bonne taille pour les modals VC en mode landscape
    
    if (frameOnMainView.origin.y + frameOnMainView.size.height + 50 > viewHeight - SIZE_OF_KEYBOARD_IPHONE)
    {
        decalageBody = frameOnMainView.origin.y + frameOnMainView.size.height + 50 - (viewHeight - SIZE_OF_KEYBOARD_IPHONE);
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        
        [bodyView setFrame:CGRectMake(bodyView.frame.origin.x, bodyView.frame.origin.y - decalageBody, bodyView.frame.size.width, bodyView.frame.size.height)];
        
        [UIView commitAnimations];
        
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    
    [bodyView setFrame:CGRectMake(bodyView.frame.origin.x, bodyView.frame.origin.y + decalageBody, bodyView.frame.size.width, bodyView.frame.size.height)];
    
    [UIView commitAnimations];
    
    decalageBody = 0;
    textFieldFirstResponder = nil;
    return NO;
}

#pragma mark - UIPickerViewDelegate functions

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [titlesForPicker objectAtIndex:row];
}

#pragma mark UIPickerViewDataSource functions

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [titlesForPicker count];
}

#pragma mark UIPicker others functions

- (void)initPicker
{
    if (textFieldFirstResponder)
    {
        [textFieldFirstResponder resignFirstResponder];
        [bodyView setFrame:CGRectMake(bodyView.frame.origin.x, bodyView.frame.origin.y + decalageBody, bodyView.frame.size.width, bodyView.frame.size.height)];
        decalageBody = 0;
        textFieldFirstResponder = nil;
    }
    
    if (viewForPicker == nil)
    {
        viewForPicker = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 250)];
        [viewForPicker setBackgroundColor:[UIColor colorWithRed:0.157 green:0.165 blue:0.224 alpha:1]];
        [self.view addSubview:viewForPicker];
    }
    
    for (UIView *v in [viewForPicker subviews])
        [v removeFromSuperview];
    
    UIButton *btnCloseTimePicker;
    UIButton *btnValidTime;
    
    btnCloseTimePicker = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnCloseTimePicker setFrame:CGRectMake(65, 220, 70, 26)];
    [btnCloseTimePicker setTitle:@"Fermer" forState:UIControlStateNormal];
    [btnCloseTimePicker setTag:2];
    [btnCloseTimePicker addTarget:self action:@selector(hidePicker:) forControlEvents:UIControlEventTouchDown];
    
    btnValidTime = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnValidTime setFrame:CGRectMake(185, 220, 70, 26)];
    [btnValidTime setTitle:@"Valider" forState:UIControlStateNormal];
    [btnValidTime setTag:1];
    [btnValidTime addTarget:self action:@selector(hidePicker:) forControlEvents:UIControlEventTouchDown];
    
    [viewForPicker addSubview:btnCloseTimePicker];
    [viewForPicker addSubview:btnValidTime];
    
    if (isHourPicker)
    {
        if (datePicker == nil)
        {
            datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
        }
        [viewForPicker addSubview:datePicker];
        [datePicker setDatePickerMode:UIDatePickerModeTime];
    }
    else if (isDatePicker)
    {
        if (datePicker == nil)
        {
            datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
        }
        [viewForPicker addSubview:datePicker];
        [datePicker setDatePickerMode:UIDatePickerModeDate];
    }
    else
    {
        if (pickerToDisplay == nil)
        {
            pickerToDisplay = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
            [pickerToDisplay setShowsSelectionIndicator:YES];
            [pickerToDisplay setDelegate:self];
            [pickerToDisplay setDataSource:self];
        }
        [viewForPicker addSubview:pickerToDisplay];
        [pickerToDisplay selectRow:0 inComponent:0 animated:NO];
    }
    [self.view bringSubviewToFront:viewForPicker];
}

- (void)reloadAndDisplayPicker
{
    [pickerToDisplay reloadAllComponents];
    
    CGRect rectPicker = [viewForPicker frame];
    if (isHourPicker)
    {
        rectPicker.origin.y = BOTTOM_OF_VIEW(self.view) - viewForPicker.frame.size.height;//160;
    }
    else {
        rectPicker.origin.y = BOTTOM_OF_VIEW(self.view) - viewForPicker.frame.size.height;//210;
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    [viewForPicker setFrame:rectPicker];
    
    [UIView commitAnimations];
}

- (void)displayHourPickerandReturnChoiceTo:(SEL)selector
{
    isHourPicker = YES;
    isDatePicker = NO;
    [self initPicker];
    sendResultSelector = selector;
    [self reloadAndDisplayPicker];
}

- (void)displayDatePickerandReturnChoiceTo:(SEL)selector
{
    isHourPicker = NO;
    isDatePicker = YES;
    [self initPicker];
    sendResultSelector = selector;
    [self reloadAndDisplayPicker];
    
}

- (void)displayAPickerWith:(NSArray *)choices andReturnChoiceTo:(SEL)selector
{
    [self initPicker];
    
    if (titlesForPicker == nil)
    {
        titlesForPicker = [[NSMutableArray alloc] init];
    }
    [titlesForPicker removeAllObjects];
    [titlesForPicker addObjectsFromArray:choices];
    sendResultSelector = selector;
    
    isHourPicker = NO;
    isDatePicker = NO;
    
    [self reloadAndDisplayPicker];
}

- (void)hidePicker:(id)sender
{
    if (sender && [(UIButton *)sender tag])// on enregistre les changement
	{
		if ([(UIButton *)sender tag] == 1)
		{
            if (isDatePicker)
            {
                NSDateFormatter *getDateFormatter = [[NSDateFormatter alloc ] init];
                [getDateFormatter setDateFormat:@"dd/MM/yyyy"];
                
                [self performSelector:sendResultSelector withObject:[getDateFormatter stringFromDate:[datePicker date]]];
            }
            else if (isHourPicker)
            {
                NSDateFormatter *getHourFormatter = [[NSDateFormatter alloc ] init];
                [getHourFormatter setDateFormat:@"HH:mm"];
                
                [self performSelector:sendResultSelector withObject:[getHourFormatter stringFromDate:[datePicker date]]];
            }
            else
                [self performSelector:sendResultSelector withObject:[titlesForPicker objectAtIndex:[pickerToDisplay selectedRowInComponent:0]]];
		}
	}
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    [viewForPicker setFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, viewForPicker.frame.size.height)];
    
    [UIView commitAnimations];
}

@end
