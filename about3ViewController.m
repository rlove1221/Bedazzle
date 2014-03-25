//
//  about3ViewController.m
//  Bedazzle
//
//  Created by Richard Morena on 3/21/14.
//  Copyright (c) 2014 chen daozhao. All rights reserved.
//

#import "about3ViewController.h"

@interface about3ViewController ()

@end

@implementation about3ViewController

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
    
    
    textView.text = @"Miss Karin is a working choreographer and teacher residing in New York City. Graduating Cum Laud from Florida International University, Miami Florida, she earned a BA in Dance.";
    
    bottomText.text = @" Her infectious energy and her passion for dance were seasoned while she mentored under Broadway tap dancer, Jimmy Tate. Karin has been teaching for over 14 years and during this time, was honored to become the Director of the Dance Department at the nationally renowned Weiss School. She has also directed a youth tap company in South Florida where her students and choreography were recognized with numerous awards at a variety of competitions on both regional and national levels. In addition, Karin continues to teach master classes and create choreography for many students all over the country and abroad as well as teaching on the competition/convention circuit and can be found on faculty with Dance Teachers United, Throwdown Dance Challenge, True Talent Dance Competition and Groove Competition. Though her specialty is tap, Karin also teaches jazz, hip hop, acro and creative movement classes for young movers. She currently can be found on faculty at Peridance Capezio Center (NYC) in both their children and adult programs. Karin’s passion for her art and the technique that supports it, for rhythm and energy and the combination of it all, can be seen in each and every class she teaches as well as in her ambitious and expressive choreography!";
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back_click:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
