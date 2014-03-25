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


    
    bottomText.text = @" The owner/director Miss Christine Mignone, opened the doors to Bedazzle Dance Studio in 2005. Growing up as a competitive dancer, she was no stranger to the dance world. Christine knew she wanted to share her passion for dance at a very young age and choose teaching as her profession. She is a former dancer for Star Struck dance company for over 15 years and has competed in many dance competitions across America, winning highest honors. Some of which include Starpower, Access Broadway, Star Systems, Stars of Tomorrow, Rising Star, Showstopper, StarBound, and Nexstar. She has also performed at Madison Square Garden, Disney World, Nickelodeon, The Miss New York Pageant, The Miss Staten Island Pageant,and many more events. Christine has taken master classes with professional choreographers including Laurie Ann Gibson, Chris Judd, Wade Robson, Mia Michaels, Frank Hatchet, and attends frequent classes at Broadway Dance Center & various dance workshops to maintain her skills. She has choreographed and directed productions for 2 years at I.S.27 and P.S.39 and has choreographed hundreds of dance routines which have received highest honors from various dance competitions.\n We are a family-run studio providing an environment where your children will learn both the fundamentals and creative aspects of dance. We strive to prepare our students for the dance world so they might flourish in their personal development – whether it is for recreational or competition purposes. Miss Christine takes pride knowing that we are not only contributing to the development of good dancers, but to outstanding citizens and caring people.";

                                        
    
    
                                        

    
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


@end
