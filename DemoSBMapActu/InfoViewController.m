//
//  InfoViewController.m
//  DemoSBMapActu
//
//  Created by Tom Bentz on 20/05/14.
//  Copyright (c) 2014 IPSTAND. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
{
    UIWebView   *webView;
}
@end

@implementation InfoViewController

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

    
    [infoBtn setSelected:YES];
    
    webView = [[UIWebView alloc] init];
    webView.opaque = NO;
    webView.backgroundColor = [UIColor clearColor];
    [bodyView addSubview:webView];
    
    NSString *html = @"<html><body style='margin: 0px; padding: 0px; '>\
    <iframe src='%@' width='280' height='211' frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\
    </body></html>";
    
    NSString *htmlString = [NSString stringWithFormat:html,
                            NSLocalizedString(@"HTML_SMARTBEACON_VIDEO", @"")];
    
    NSLog(@"htmlString: %@", htmlString);
    [webView loadHTMLString:htmlString baseURL:nil];

    headerLbl.text = [@"Information" uppercaseString];

}

-(CGRect)drawViewIn:(UIInterfaceOrientation)orientation withDuration:(NSTimeInterval)duration
{
    CGRect mainFrame = [super drawViewIn:orientation withDuration:duration];
        
    webView.frame = CGRectMake(20, bodyView.frame.size.height * 1 / 5, bodyView.frame.size.width - 40, bodyView.frame.size.height * 4 / 5);
    
    return mainFrame;
}

@end
