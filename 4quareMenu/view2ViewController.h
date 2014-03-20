//
//  view2ViewController.h
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQMultistageTableView.h"

@interface view2ViewController : UIViewController <TQTableViewDataSource, TQTableViewDelegate >

@property (nonatomic,strong) TQMultistageTableView *mTableView;
@property (nonatomic,strong) NSArray *weekDays;
@property (nonatomic,strong) NSMutableArray *scheduleList;
@property (nonatomic,strong) NSMutableArray *detailList;
@property (nonatomic,strong) NSMutableArray *detailList2;
@property (nonatomic,strong) NSMutableArray *detailList3;
@property (nonatomic,strong) NSMutableArray *detailList4;
@property (nonatomic,strong) NSMutableArray *scheduleB;




@end
