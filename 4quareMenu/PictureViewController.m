//
//  PictureViewController.m
//  Bedazzle
//
//  Created by Richard Morena on 3/7/14.
//  Copyright (c) 2014 chen daozhao. All rights reserved.
//

#import "PictureViewController.h"
#import "FlipSquaresNavigationController.h"
@interface PictureViewController ()

@end

@implementation PictureViewController
@synthesize imageName;

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
    imageView.image = [UIImage imageNamed:imageName];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back_click:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}
@end
