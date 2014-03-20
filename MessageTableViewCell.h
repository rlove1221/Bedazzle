//
//  MessageTableViewCell.h
//  Bedazzle
//
//  Created by Jacky on 3/20/14.
//  Copyright (c) 2014 chen daozhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *messageLB;
@property (strong, nonatomic) IBOutlet UILabel *createdOnLB;

@end
