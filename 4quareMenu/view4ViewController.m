//
//  view4ViewController.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "view4ViewController.h"
#import "define.h"
@interface view4ViewController ()

@end

@implementation view4ViewController

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
    
    [self getMessage];
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(getMessage) userInfo:nil repeats:YES];
    messageArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"Messages"];
    // Do any additional setup after loading the view from its nib.
}

- (void)getMessage
{
    [ServiceManager getMessage];
    NSMutableArray *newArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"Messages"] mutableCopy];
    [newArray removeObjectsInArray:messageArray];
    
    if ([newArray count] > 0) {
        messageArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"Messages"];
        [self.messageTableView reloadData];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [messageArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"schedulecell";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:self options:nil];
        cell = [nib lastObject];
    }
    NSDictionary *messageDict = [messageArray objectAtIndex:indexPath.row];
    cell.messageLB.text = [messageDict objectForKey:@"message"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"y-MM-dd HH:mm:ss z"];
    NSString *newDateSring = [NSString stringWithFormat:@"%@ GMT-7",[messageDict objectForKey:@"created_on"]];
    NSDate *date = [formatter dateFromString:newDateSring];
    [formatter setDateFormat:@"MM-dd-y hh:mm a"];
    cell.createdOnLB.text = [formatter stringFromDate:date
                             ];
    
    return cell;
}
- (IBAction)send_click:(id)sender {
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"" message:@"Message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Send Push", nil];
    [alert1 setAlertViewStyle:UIAlertViewStylePlainTextInput];
    alert1.tag = 100;
    [alert1 show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 100 && buttonIndex == 1) {
        NSString *message = [alertView textFieldAtIndex:0].text;
        if (!message || message.length == 0) {
            [Util showAlertWithString:@"Please enter your message"];
        }
        else
        {
            [self performSelectorInBackground:@selector(showProcess) withObject:nil];
            
            if([ServiceManager sendPushNotification:message])
            {
                [SVProgressHUD dismiss];
                [Util showAlertWithString:@"Your message has been sent"];
                
            }
            else
            {
                [SVProgressHUD dismiss];
                
            }
            //[self.navigationController popToRootViewControllerAnimated:YES];
        }
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)showProcess
{
    [SVProgressHUD showWithStatus:@"Sending"];
}
@end
