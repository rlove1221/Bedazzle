//
//  PictureViewController.h
//  Bedazzle
//
//  Created by Richard Morena on 3/7/14.
//  Copyright (c) 2014 chen daozhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureViewController : UIViewController
{
    
    IBOutlet UIImageView *imageView;
}
@property (nonatomic,retain)NSString *imageName;
- (IBAction)back_click:(id)sender;

@end
