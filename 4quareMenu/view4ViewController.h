//
//  view4ViewController.h
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageTableViewCell.h"
@interface view4ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *messageArray;
}
@property (strong, nonatomic) IBOutlet UITableView *messageTableView;
- (IBAction)send_click:(id)sender;

@end
