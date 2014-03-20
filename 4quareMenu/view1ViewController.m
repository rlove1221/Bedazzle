//
//  view1ViewController.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "view1ViewController.h"
#import "UzysSlideMenu.h"
#import "UIColor+FlatUI.h"

@interface view1ViewController ()

@property (nonatomic,strong) UzysSlideMenu *uzysSMenu;


@end



#define IS_IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7




@implementation view1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //CGRect frame = [UIScreen mainScreen].applicationFrame;
    //self.view.frame = frame;
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.imageView.bounds.size.height);
    self.scrollView.delegate =self;
    
    
    ah__block typeof(self) blockSelf = self;
    UzysSMMenuItem *item0 = [[UzysSMMenuItem alloc] initWithTitle:@"Shoes & Tights List" image:[UIImage imageNamed:@"nil"] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        
        
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"ALL TIGHTS MUST BE BRAND\n 'BODY WRAPPERS'\n COLOR: SUNTAN \n CONVERTIBLE\n REQUIRED FOR DANCE\n PICTUREDAY AND RECITAL\n (MANDATORY , NO EXCEPTIONS!)\n Creative Movement \n Level 1 - White Ballet Shoes\n Level 2 - White Ballet Shoes\n & White Tap Shoes\n\n\n K-1st Grade Jazz/Tap-Tan\nBallet - White\n K-1st HipHop - Black Sneakers\n\n\n 2nd -5th Jazz/Tap - Tan\n 2nd- 3rd HipHop - Black & White COnverse Sneakers\n 2nd - 5th Ballet/Modern - Foot Undeez or Paws";
            
            
        }];
    }];
    
    UzysSMMenuItem *item1 = [[UzysSMMenuItem alloc] initWithTitle:@"COMPANY CSI Rehearsal" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"- COMPANY - \n MANDATORY CSI REHEARSAL FOR COMPETITION\nFriday, April 11th @4:45pm\nCSI Williamson Theater\n$35 fee \n•MUST BE PAID NO LATER THAN \nMARCH 8th";
        }];
        
        
    }];
    UzysSMMenuItem *item2 = [[UzysSMMenuItem alloc] initWithTitle:@"Spring Break" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"•Spring Break•\n Closed\n Monday,April 14th -Tuesday, April 22nd\n •Classes Resume• \nWednesday April 23rd";
        }];
        
        
    }];
    UzysSMMenuItem *item3 = [[UzysSMMenuItem alloc] initWithTitle:@"Weekend" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"The Studio will be closed\nSaturday April 26th & Sunday April 27th, \ndue to traveling with competition team\n\n •Make up Class TBA";
            
        }];
        
        
    }];
    UzysSMMenuItem *item4 = [[UzysSMMenuItem alloc] initWithTitle:@"Picture Day" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Picture Days \n April 29th & April 30th \n May 1st (Company only)\n\n\n •Exact Schedule TBA";
            
        }];
        
        
    }];
    UzysSMMenuItem *item5 = [[UzysSMMenuItem alloc] initWithTitle:@"Picture Pick Up" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Sunday May 18th\n\n10;00am - 2:00pm\n\n @Bedazzle Dance Studio";
            
        }];
        
        
    }];
    UzysSMMenuItem *item6 = [[UzysSMMenuItem alloc] initWithTitle:@"Memorial Day Weekend" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Bedazzle Dance will be closed \nfor Memorial Weekend\n\nSaturday May 24h - Monday May 26th \n\n •Classes Resume Tuesday May 27th";
            
        }];
        
        
    }];
    UzysSMMenuItem *item7 = [[UzysSMMenuItem alloc] initWithTitle:@"Retail Ticket Sales" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Sunday June 1st \n\n Time Slots:  10:00am, 12:00pm & 2:00pm\n\n •TIMES ARE PICKED OUT OF A LOTTERY ON THE PICTURE DAY PICK UP.";
            
        }];
        
        
    }];
    UzysSMMenuItem *item8 = [[UzysSMMenuItem alloc] initWithTitle:@"CSI Rehearsal" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Rehearsal For Recital\n\n Monday June 23rd\n\n The College of Staten Island - Concert Hall \n\n •TIME SCHEDULE TBA ";
            
        }];
        
        
    }];
    UzysSMMenuItem *item9 = [[UzysSMMenuItem alloc] initWithTitle:@"Recital" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Bedazzle Dance Studio 9th Annual Recital\n\n\n Friday June 27 @ 7:00pm \n\n All Dancers must arrive no later than 6:30pm\n\n The College of Staten Island - Concert Hall";
            
        }];
        
        
    }];
    UzysSMMenuItem *item10 = [[UzysSMMenuItem alloc] initWithTitle:@"Fall Registration" image:[UIImage imageNamed:@""] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 0, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Tuesday 9/3 - Friday 9/6 @ 3 - 7pm\nSaturday 9/7 @ 11 - 2pm\nMonday 9/9 - Friday 9/13 @ 3 - 8:00pm\nSaturday 9/14 @ 10 - 2:00pm";
            
        }];
        
        
    }];
    
    item0.tag = 0;
    item1.tag = 1;
    item2.tag = 2;
    item3.tag = 3;
    item4.tag = 4;
    item5.tag = 5;
    item6.tag = 6;
    item7.tag = 7;
    item8.tag = 8;
    item9.tag = 9;
    item10.tag = 10;

    
    NSInteger statusbarHeight = 0;
    if(IS_IOS7)
        statusbarHeight = 20;
    
    self.uzysSMenu = [[UzysSlideMenu alloc] initWithItems:@[item0,item1,item2,item3,item4,item5,item6,item7,item8,item9,item10 ]];
    self.uzysSMenu.frame = CGRectMake(self.uzysSMenu.frame.origin.x, self.uzysSMenu.frame.origin.y+ statusbarHeight, self.uzysSMenu.frame.size.width, self.uzysSMenu.frame.size.height);
    self.uzysSMenu.textView = textView;
    [self.view addSubview:self.uzysSMenu];
    [self.uzysSMenu toggleMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_scrollView release];
    [_imageView release];
     [_btnMain release];
    
    [super ah_dealloc];
}
- (IBAction)actionMenu:(id)sender {
   NSLog(@"Btn touch");
[self.uzysSMenu toggleMenu];
}



#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.uzysSMenu openIconMenu];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
