//
//  aboutViewController.m
//  Bedazzle
//
//  Created by Richard Morena on 3/20/14.
//  Copyright (c) 2014 chen daozhao. All rights reserved.
//

#import "aboutViewController.h"
#import "FlipSquaresNavigationController.h"
#import "about2ViewController.h"

@interface aboutViewController ()

@end

@implementation aboutViewController

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
    // Do any additional setup after loading the view from its nib.
    aScrollView.contentSize = CGSizeMake(310, 1100);
    
    
    textView.text = @"Miss Jennifer Pascucci is a graduate of Dance Educators of America Training School and acquired her teaching certification in 2001.";
    
    bottomText.text = @" Miss Jenn instills confidence and reassurance in all her students. She brings a new found energy to all her classes as demonstrated in some of her fun-filled Tap, Hip Hop, and Break-dancing routines. Along with competing herself, the solos,duos,trios and groups she has worked with through the years have been awarded at regional and national competitions. Miss Jenn is a loyal,dedicated teacher who loves and cares for her students.“Every single child has something unique to give and it’s up to us as teachers to find out what that is.This way we can guide them to their fullest potential”";
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)back_click:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)about2_click:(id)sender {
    about2ViewController *controller = [[about2ViewController alloc] initWithNibName:@"about2ViewController" bundle:nil];;
    [self.navigationController pushViewController:controller animated:YES];
}
@end
