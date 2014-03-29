//
//  view5ViewController.m
//  quare4Menu
//
//  Created by Richard Morena on 3/2/14.
//  Copyright (c) 2014 chen daozhao. All rights reserved.
//

#import "view5ViewController.h"
#import "aboutViewController.h"
#import "about2ViewController.h"
#import "about3ViewController.h"
#import "define.h"
#import "FlipSquaresNavigationController.h"


@interface view5ViewController ()

- (IBAction)pushViewController:(id)sender;

@end

@implementation view5ViewController





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
    aScrollView.contentSize = CGSizeMake(310, 200);


    
    NSString *text = @" The owner/director Miss Christine Mignone, opened the doors to Bedazzle Dance Studio in 2005. Growing up as a competitive dancer, she was no stranger to the dance world. Christine knew she wanted to share her passion for dance at a very young age and choose teaching as her profession. She is a former dancer for Star Struck dance company for over 15 years and has competed in many dance competitions across America, winning highest honors. Some of which include Starpower, Access Broadway, Star Systems, Stars of Tomorrow, Rising Star, Showstopper, StarBound, and Nexstar. She has also performed at Madison Square Garden, Disney World, Nickelodeon, The Miss New York Pageant, The Miss Staten Island Pageant,and many more events. Christine has taken master classes with professional choreographers including Laurie Ann Gibson, Chris Judd, Wade Robson, Mia Michaels, Frank Hatchet, and attends frequent classes at Broadway Dance Center & various dance workshops to maintain her skills. She has choreographed and directed productions for 2 years at I.S.27 and P.S.39 and has choreographed hundreds of dance routines which have received highest honors from various dance competitions.\n We are a family-run studio providing an environment where your children will learn both the fundamentals and creative aspects of dance. We strive to prepare our students for the dance world so they might flourish in their personal development – whether it is for recreational or competition purposes. Miss Christine takes pride knowing that we are not only contributing to the development of good dancers, but to outstanding citizens and caring people.";

                                        
    bottomText.text  = text;
    bottomText2.text  = text;
    CGRect rect = contentView.frame;
    rect.size.height = 336;
    if (IS_IPHONE5) {
        bottomText.hidden = NO;
        bottomText2.hidden = YES;
    }
    else
    {
        contentView.frame = rect;
        bottomText.hidden = YES;
        bottomText2.hidden = NO;
    }
        

    
    [self.navigationController setNavigationBarHidden:YES];

    // Do any additional setup after loading the view from its nib.
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushViewController:(id)sender {
  
    aboutViewController *secondVC = [[aboutViewController alloc]initWithNibName:@"aboutViewController" bundle:nil];
    FlipSquaresNavigationController *nav =(FlipSquaresNavigationController*)self.view.window.rootViewController;
    [nav pushViewController:secondVC animated:YES];

    
   }

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return contentView;
}
- (IBAction)showAlertView:(id)sender {
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"458 Midland Ave\nStaten Island, NY 10306\n 718.980.0189" message:@"" delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:@"call Bedazzle",@"@Bedazzle", nil];
    alertView.delegate = self;
    alertView.titleLabel.textColor = [UIColor cloudsColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    alertView.messageLabel.textColor = [UIColor cloudsColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:14];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
    alertView.defaultButtonColor = [UIColor colorWithRed:1 green:0.0784314 blue:0.576471 alpha:.7];
    alertView.defaultButtonShadowColor = [UIColor asbestosColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
    alertView.defaultButtonTitleColor = [UIColor cloudsColor];
    [alertView show];
}
- (void)alertView:(FUIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        UIDevice *device = [UIDevice currentDevice];
        if ([[device model] isEqualToString:@"iPhone"] ) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:7189800189"]]];
        } else {
            UIAlertView *notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature. Call us: 718 980.0189" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [notpermitted show];
        }
    }else if(buttonIndex ==2) {
        // Email Subject
        NSString *emailTitle = @"hello Bedazzle";
        // Email Content
        NSString *messageBody = @"";
        // To address
        NSArray *toRecipents = [NSArray arrayWithObject:@"bedazzledance@aol.com"];
        if([MFMailComposeViewController canSendMail])
        {
        mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        
        // Present mail view controller on screen
          FlipSquaresNavigationController *nav =(FlipSquaresNavigationController*)self.view.window.rootViewController;
        [nav presentViewController:mc animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Email Account"
                                                            message:@"You must set up an email account for your device before you can send mail."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }

    }
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface

    [mc dismissViewControllerAnimated:YES completion:NULL];
}

@end
