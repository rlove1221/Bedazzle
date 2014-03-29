//
//  view5ViewController.h
//  quare4Menu
//
//  Created by Richard Morena on 3/2/14.
//  Copyright (c) 2014 chen daozhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FUIAlertView.h"
#import "UIPopoverController+FlatUI.h"
#import "FUIButton.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"
#import <MessageUI/MessageUI.h>

@interface view5ViewController : UIViewController<UIScrollViewDelegate,FUIAlertViewDelegate,UIActionSheetDelegate,MFMailComposeViewControllerDelegate>
{
    
    IBOutlet UIScrollView *aScrollView;
    IBOutlet UIView *contentView;
    IBOutlet UITextView *bottomText;
    IBOutlet UITextView *bottomText2;
    MFMailComposeViewController *mc;
}
    
    
@property (weak, nonatomic) IBOutlet FUIButton *alertViewButton;





@end
