//
//  FormViewController.m
//  DemoSBMapActu
//
//  Created by Tom Bentz on 27/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController ()
{
    UILabel     *questionLbl;
    UILabel     *markLbl;
    
    UIView      *buttonView;
    
    UIButton    *oneBtn;
    UIButton    *twoBtn;
    UIButton    *threeBtn;
    UIButton    *fourBtn;
    UIButton    *fiveBtn;
    
    UILabel     *commentLbl;
    
    UITextField *commentTF;
    
    UIButton    *sendBtn;
}
@end

@implementation FormViewController

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
    // Do any additional setup after loading the view.
    
    questionLbl = [[UILabel alloc] init];
    questionLbl.text = @"Qu'avez vous pensé de l'expérience SmartBeacon ?";
    questionLbl.textAlignment = NSTextAlignmentCenter;
    questionLbl.font = [UIFont fontWithName:@"OpenSans-Bold" size:15];
    questionLbl.numberOfLines = 0;
    [bodyView addSubview:questionLbl];
    
    markLbl = [[UILabel alloc] init];
    markLbl.text = @"Donnez nous une note :";
    markLbl.textAlignment = NSTextAlignmentCenter;
    markLbl.font = [UIFont fontWithName:@"OpenSans-SemiBold" size:14];
    [bodyView addSubview:markLbl];
    
    buttonView = [[UIView alloc] init];
    [bodyView addSubview:buttonView];
    
    oneBtn = [[UIButton alloc] init];
    [oneBtn setTitle:@"1" forState:UIControlStateNormal];
    oneBtn.titleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:16];
    oneBtn.backgroundColor = [UIColor lightGrayColor];
    oneBtn.tag = 1;
    [oneBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview: oneBtn];
    
    twoBtn = [[UIButton alloc] init];
    [twoBtn setTitle:@"2" forState:UIControlStateNormal];
    twoBtn.titleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:16];
    twoBtn.backgroundColor = [UIColor lightGrayColor];
    twoBtn.tag = 2;
    [twoBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview: twoBtn];
    
    threeBtn = [[UIButton alloc] init];
    [threeBtn setTitle:@"3" forState:UIControlStateNormal];
    threeBtn.titleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:16];
    threeBtn.backgroundColor = [UIColor lightGrayColor];
    threeBtn.tag = 3;
    [threeBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview: threeBtn];
    
    fourBtn = [[UIButton alloc] init];
    [fourBtn setTitle:@"4" forState:UIControlStateNormal];
    fourBtn.titleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:16];
    fourBtn.backgroundColor = [UIColor lightGrayColor];
    fourBtn.tag = 4;
    [fourBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview: fourBtn];
    
    fiveBtn = [[UIButton alloc] init];
    [fiveBtn setTitle:@"5" forState:UIControlStateNormal];
    fiveBtn.titleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:16];
    fiveBtn.backgroundColor = [UIColor lightGrayColor];
    fiveBtn.tag = 5;
    [fiveBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview: fiveBtn];
    
    commentLbl = [[UILabel alloc] init];
    commentLbl.text = @"Laissez nous un commentaire :";
    commentLbl.textAlignment = NSTextAlignmentCenter;
    commentLbl.font = [UIFont fontWithName:@"OpenSans-SemiBold" size:14];
    [bodyView addSubview:commentLbl];
    
    commentTF = [[UITextField alloc] init];
    commentTF.backgroundColor = [UIColor lightGrayColor];
    [bodyView addSubview:commentTF];
    
    sendBtn = [[UIButton alloc] init];
    [sendBtn setTitle:@"Envoyer" forState:UIControlStateNormal];
    sendBtn.titleLabel.font = [UIFont fontWithName:@"OpenSans-Bold" size:16];
    sendBtn.backgroundColor = [UIColor grayColor];
    [bodyView addSubview:sendBtn];
}

-(CGRect)drawViewIn:(UIInterfaceOrientation)orientation withDuration:(NSTimeInterval)duration
{
    CGRect mainFrame = [super drawViewIn:orientation withDuration:duration];
    
    questionLbl.frame = CGRectMake(15, 30, bodyView.frame.size.width - 30, 45);
    
    markLbl.frame = CGRectMake(questionLbl.frame.origin.x, BOTTOM_OF_VIEW(questionLbl) + 25, questionLbl.frame.size.width, 20);
    
    buttonView.frame = CGRectMake(10, BOTTOM_OF_VIEW(markLbl) + 10, bodyView.frame.size.width - 20, 35);
    
    oneBtn.frame = CGRectMake(0, 0, buttonView.frame.size.width / 5 - 1, buttonView.frame.size.height);
    
    twoBtn.frame = CGRectMake(RIGHT_OF_VIEW(oneBtn) + 1, 0, oneBtn.frame.size.width, oneBtn.frame.size.height);
    
    threeBtn.frame = CGRectMake(RIGHT_OF_VIEW(twoBtn) + 1, 0, oneBtn.frame.size.width, oneBtn.frame.size.height);
    
    fourBtn.frame = CGRectMake(RIGHT_OF_VIEW(threeBtn) + 1, 0, oneBtn.frame.size.width, oneBtn.frame.size.height);
    
    fiveBtn.frame = CGRectMake(RIGHT_OF_VIEW(fourBtn) + 1, 0, oneBtn.frame.size.width, oneBtn.frame.size.height);
    
    commentLbl.frame = CGRectMake(questionLbl.frame.origin.x, BOTTOM_OF_VIEW(buttonView) + 30, questionLbl.frame.size.width, 30);
    
    commentTF.frame = CGRectMake(buttonView.frame.origin.x, BOTTOM_OF_VIEW(commentLbl) + 10, buttonView.frame.size.width, 100);
    
    sendBtn.frame = CGRectMake(bodyView.frame.size.width / 2 - 50, BOTTOM_OF_VIEW(commentTF) + 20, 100, 35);
    
    return mainFrame;
}

-(void)buttonPressed:(id)sender
{
    [oneBtn setSelected:NO];
    [twoBtn setSelected:NO];
    [threeBtn setSelected:NO];
    [fourBtn setSelected:NO];
    [fiveBtn setSelected:NO];
    
    oneBtn.backgroundColor = [UIColor lightGrayColor];
    twoBtn.backgroundColor = [UIColor lightGrayColor];
    threeBtn.backgroundColor = [UIColor lightGrayColor];
    fourBtn.backgroundColor = [UIColor lightGrayColor];
    fiveBtn.backgroundColor = [UIColor lightGrayColor];
    
    switch ([sender tag])
    {
        case 1:
            [oneBtn setSelected:YES];
            oneBtn.backgroundColor = [UIColor grayColor];
            break;
        case 2:
            [twoBtn setSelected:YES];
            twoBtn.backgroundColor = [UIColor grayColor];
            break;
        case 3:
            [threeBtn setSelected:YES];
            threeBtn.backgroundColor = [UIColor grayColor];
            break;
        case 4:
            [fourBtn setSelected:YES];
            fourBtn.backgroundColor = [UIColor grayColor];
            break;
        case 5:
            [fiveBtn setSelected:YES];
            fiveBtn.backgroundColor = [UIColor grayColor];
            break;
    }
}

@end
