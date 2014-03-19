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
            blockSelf.btnMain.frame = CGRectMake(117, 20, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"ALL TIGHTS MUST BE BRAND\n 'BODY WRAPPERS'\n COLOR: SUNTAN \n CONVERTIBLE\n REQUIRED FOR DANCE\n PICTUREDAY AND RECITAL\n (MANDATORY , NO EXCEPTIONS!)\n Creative Movement \n Level 1 - White Ballet Shoes\n Level 2 - White Ballet Shoes\n & White Tap Shoes\n\n\n K-1st Grade Jazz/Tap-Tan\nBallet - White\n K-1st HipHop - Black Sneakers\n\n\n 2nd -5th Jazz/Tap - Tan\n 2nd- 3rd HipHop - Black & White COnverse Sneakers\n 2nd - 5th Ballet/Modern - Foot Undeez or Paws";
            
            
        }];
    }];
    
    UzysSMMenuItem *item1 = [[UzysSMMenuItem alloc] initWithTitle:@"Favorite" image:[UIImage imageNamed:@"a1.png"] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 20, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Menu 2";
        }];
        
        
    }];
    UzysSMMenuItem *item2 = [[UzysSMMenuItem alloc] initWithTitle:@"Search" image:[UIImage imageNamed:@"a2.png"] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 20, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Menu 3";
        }];
        
        
    }];
    UzysSMMenuItem *item3 = [[UzysSMMenuItem alloc] initWithTitle:@"Search" image:[UIImage imageNamed:@"a2.png"] action:^(UzysSMMenuItem *item) {
        NSLog(@"Item: %@ menuState : %d", item , blockSelf.uzysSMenu.menuState);
        [UIView animateWithDuration:0.2 animations:^{
            blockSelf.btnMain.frame = CGRectMake(117, 20, blockSelf.btnMain.bounds.size.width, blockSelf.btnMain.bounds.size.height);
            textView.text = @"Menu 3";
            
        }];
        
        
    }];
    item0.tag = 0;
    item1.tag = 1;
    item2.tag = 2;
    item3.tag = 3;
    
    NSInteger statusbarHeight = 0;
    if(IS_IOS7)
        statusbarHeight = 20;
    
    self.uzysSMenu = [[UzysSlideMenu alloc] initWithItems:@[item0,item1,item2,item3]];
    self.uzysSMenu.frame = CGRectMake(self.uzysSMenu.frame.origin.x, self.uzysSMenu.frame.origin.y+ statusbarHeight, self.uzysSMenu.frame.size.width, self.uzysSMenu.frame.size.height);
    self.uzysSMenu.textView = textView;
    [self.view addSubview:self.uzysSMenu];
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
