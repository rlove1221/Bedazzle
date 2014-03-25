//
//  about2ViewController.h
//  Bedazzle
//
//  Created by Richard Morena on 3/21/14.
//  Copyright (c) 2014 chen daozhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface about2ViewController : UIViewController<UIScrollViewDelegate>
{
    IBOutlet UIScrollView *aScrollView;
    IBOutlet UIView *contentView;
    IBOutlet UITextView *textView;
    IBOutlet UITextView *bottomText;
}

- (IBAction)back_click:(id)sender;
- (IBAction)about2_click:(id)sender;

@end
