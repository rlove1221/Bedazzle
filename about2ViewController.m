//
//  about2ViewController.m
//  Bedazzle
//
//  Created by Richard Morena on 3/21/14.
//  Copyright (c) 2014 chen daozhao. All rights reserved.
//

#import "about2ViewController.h"
#import "about3ViewController.h"

@interface about2ViewController ()

@end

@implementation about2ViewController

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
    aScrollView.contentSize = CGSizeMake(310, 600);
    
    
    textView.text = @"We are very excited to welcome Neil Totton to our staff. With over 10 years of experience as a performer, instructor, and coach, Neil’s charismatic and personable personality would benefit your students. He believes in sharing with students the tools necessary to break out of their shells and develop the proper technique to dance with strength, confidence, and grace. Neil has a unique way of teaching and working with students to make learning a fun yet challenging experience, in addition to demonstrating excellent classroom management.";
    
 

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
    about3ViewController *controller = [[about3ViewController alloc] initWithNibName:@"about3ViewController" bundle:nil];;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
