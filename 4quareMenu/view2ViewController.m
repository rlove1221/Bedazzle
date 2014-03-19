//
//  view2ViewController.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "view2ViewController.h"
#import "UIColor+FlatUI.h"
#import "UIERealTimeBlurView.h"
#import "ScheduleTableViewCell.h"

@interface view2ViewController ()

@end

@implementation view2ViewController
@synthesize weekDays,scheduleList,detailList,detailList2,detailList3,detailList4;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width,self.view.frame.size.height)];
    self.mTableView.backgroundColor = [UIColor clearColor];
    self.mTableView.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.tableView.allowsSelection = NO;
    self.mTableView.tableView.allowsMultipleSelectionDuringEditing = NO;
     weekDays = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday", nil];
    scheduleList = [[NSMutableArray alloc] initWithCapacity:0];
    detailList = [[NSMutableArray alloc] initWithCapacity:0];
    detailList2 = [[NSMutableArray alloc] initWithCapacity:0];
    detailList3 = [[NSMutableArray alloc] initWithCapacity:0];
    detailList4 = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSArray *mondayList = [[NSArray alloc] initWithObjects:@"8:00pm\n  to\n9:30pm", @"10AM",@"11AM", nil];
    NSArray *tueList = [[NSArray alloc] initWithObjects:@"9AM", @"11AM", nil];
    NSArray *wedList = [[NSArray alloc] initWithObjects:@"8AM", @"10AM", nil];
    NSArray *thuList = [[NSArray alloc] initWithObjects:@"9AM", @"11AM", nil];
    NSArray *friList = [[NSArray alloc] initWithObjects:@"8AM", @"10AM", nil];
    NSArray *satList = [[NSArray alloc] initWithObjects:@"9AM", @"11AM", nil];
    
    NSArray *mondayDetails = [[NSArray alloc] initWithObjects:@"JAZZ/LYRICAL",@"test ",@"test3", nil];
    NSArray *tueDetails = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *wedDetails = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *thurDetails = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *friDetails = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *satDetails = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    
    NSArray *mondayDetails2 = [[NSArray alloc] initWithObjects:@"12thGrade - Adults",@"test2",@"test3", nil];
    NSArray *tueDetails2 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *wedDetails2 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *thurDetails2 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *friDetails2 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *satDetails2 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    
    NSArray *mondayDetails3 = [[NSArray alloc] initWithObjects:@"12thGrade",@"test2",@"test3", nil];
    NSArray *tueDetails3 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *wedDetails3 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *thurDetails3 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *friDetails3 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *satDetails3 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    
    NSArray *mondayDetails4 = [[NSArray alloc] initWithObjects:@"test",@"test2",@"test3", nil];
    NSArray *tueDetails4 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *wedDetails4 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *thurDetails4 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *friDetails4= [[NSArray alloc] initWithObjects:@"test",@"test2", nil];
    NSArray *satDetails4 = [[NSArray alloc] initWithObjects:@"test",@"test2", nil];

    
    [scheduleList addObject:mondayList];
    [scheduleList addObject:tueList];
    [scheduleList addObject:wedList];
    [scheduleList addObject:thuList];
    [scheduleList addObject:friList];
    [scheduleList addObject:satList];
    [self.view addSubview:self.mTableView];
    
    [detailList addObject:mondayDetails];
    [detailList addObject:tueDetails];
    [detailList addObject:wedDetails];
    [detailList addObject:thurDetails];
    [detailList addObject:friDetails];
    [detailList addObject:satDetails];
    [self.view addSubview:self.mTableView];
    
    [detailList2 addObject:mondayDetails2];
    [detailList2 addObject:tueDetails2];
    [detailList2 addObject:wedDetails2];
    [detailList2 addObject:thurDetails2];
    [detailList2 addObject:friDetails2];
    [detailList2 addObject:satDetails2];
    [self.view addSubview:self.mTableView];
    
    [detailList3 addObject:mondayDetails3];
    [detailList3 addObject:tueDetails3];
    [detailList3 addObject:wedDetails3];
    [detailList3 addObject:thurDetails3];
    [detailList3 addObject:friDetails3];
    [detailList3 addObject:satDetails3];
    [self.view addSubview:self.mTableView];
    
    [detailList4 addObject:mondayDetails4];
    [detailList4 addObject:tueDetails4];
    [detailList4 addObject:wedDetails4];
    [detailList4 addObject:thurDetails4];
    [detailList4 addObject:friDetails4];
    [detailList4 addObject:satDetails4];
    [self.view addSubview:self.mTableView];
    
   
    [self.view addSubview:self.mTableView];
    
  
    

}

#pragma mark - TQTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)tableView
{
    return 6;
}

- (NSInteger)mTableView:(TQMultistageTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[self.scheduleList objectAtIndex:section ] count];
    return [[self.detailList objectAtIndex:section]count];
    return [[self.detailList2 objectAtIndex:section]count];
    return [[self.detailList3 objectAtIndex:section]count];
    return [[self.detailList4 objectAtIndex:section]count];
}

- (UITableViewCell *)mTableView:(TQMultistageTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"schedulecell";
    ScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ScheduleTableViewCell" owner:self options:nil];
        cell = [nib lastObject];
    }
    
 
    NSArray *schedule =[scheduleList objectAtIndex:indexPath.section];
    //UILabel *sched = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 100)];
    cell.timeA.text=[schedule objectAtIndex:indexPath.row];

    NSArray *details =[detailList objectAtIndex:indexPath.section];

    cell.class1.text=[details objectAtIndex:indexPath.row];
    NSArray *details2 =[detailList2 objectAtIndex:indexPath.section];
    
    cell.class2.text=[details2 objectAtIndex:indexPath.row];
    NSArray *details3 =[detailList3 objectAtIndex:indexPath.section];
    
    cell.class3.text=[details3 objectAtIndex:indexPath.row];
    NSArray *details4 =[detailList4 objectAtIndex:indexPath.section];
    
    cell.class4.text=[details4 objectAtIndex:indexPath.row];
    
//    detailLB.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25.0f]; //fontStyle
//    detailLB.textColor = [UIColor colorWithRed:238/255.0f green:255/255.0f blue:254/255.0f alpha:1.0];
//    detailLB.textAlignment = NSTextAlignmentCenter;
//    
//    UIView *view3 = [[UIView alloc] initWithFrame:cell.bounds] ;
//    cell.backgroundView = view3;
//    NSArray *details2 =[detailList2 objectAtIndex:indexPath.section];
//    UILabel *detailLB2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 320, 60)];
//    detailLB2.text=[details2 objectAtIndex:indexPath.row];
//    detailLB2.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f]; //fontStyle
//    detailLB2.textColor = [UIColor colorWithRed:238/255.0f green:255/255.0f blue:254/255.0f alpha:1.0];
//    detailLB2.textAlignment = NSTextAlignmentCenter;
//
//    
//    UIView *view4 = [[UIView alloc] initWithFrame:cell.bounds] ;
//    cell.backgroundView = view4;
//    NSArray *details3 =[detailList3 objectAtIndex:indexPath.section];
//    UILabel *detailLB3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 80)];
//    detailLB3.text=[details3 objectAtIndex:indexPath.row];
//    detailLB3.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f]; //fontStyle
//    detailLB3.textColor = [UIColor colorWithRed:238/255.0f green:255/255.0f blue:254/255.0f alpha:1.0];
//    detailLB3.textAlignment = NSTextAlignmentCenter;
//
//    
//    UIView *view5 = [[UIView alloc] initWithFrame:cell.bounds] ;
//    cell.backgroundView = view5;
//    NSArray *details4 =[detailList4 objectAtIndex:indexPath.section];
//    UILabel *detailLB4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 320, 100)];
//    detailLB4.text=[details4 objectAtIndex:indexPath.row];
//    detailLB4.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f]; //fontStyle
//    detailLB4.textColor = [UIColor colorWithRed:238/255.0f green:255/255.0f blue:254/255.0f alpha:1.0];
//    detailLB4.textAlignment = NSTextAlignmentCenter;
//
//    
//    //[title setText:[[stories objectAtIndex: storyIndex] objectForKey: @"title"]];
//    [cell.contentView addSubview:sched];
//    [cell.contentView addSubview:detailLB];
//    [cell.contentView addSubview:detailLB2];
//    [cell.contentView addSubview:detailLB3];
//    [cell.contentView addSubview:detailLB4];
    cell.backgroundColor =[UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)mTableView:(TQMultistageTableView *)tableView openCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,  0, tableView.bounds.size.width, 100)];
   view.backgroundColor = [UIColor colorWithRed:187/255.0 green:206/255.0 blue:190/255.0 alpha:1];;
   view.backgroundColor = [UIColor clearColor];;//bottomofOpening Cell
    return view;
   UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 100)];
      view.backgroundColor = [UIColor colorWithRed:187/255.0 green:206/255.0 blue:190/255.0 alpha:1];;
    view2.backgroundColor = [UIColor clearColor];;//bottomofOpening Cell
    return view2;
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 100)];
    view.backgroundColor = [UIColor colorWithRed:187/255.0 green:206/255.0 blue:190/255.0 alpha:1];;
    view3.backgroundColor = [UIColor clearColor];;//bottomofOpening Cell
    return view3;
}

#pragma mark - Table view delegate
//height inside view
- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
//secondopen
//- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForOpenCellAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100;
//}

- (UIView *)mTableView:(TQMultistageTableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * control = [[UIView alloc] init];
    control.backgroundColor = [UIColor colorWithRed:255/255.0f green:75/255.0f blue:142/255.0f alpha:1.0];//label pink
    //[control setBackgroundColor:[UIColor colorWithRed:(100/255) green:(5/255) blue:(8/255) alpha:1.0]];
    
    //sepertor
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 48, tableView.frame.size.width, 2)];
    view.backgroundColor = [UIColor wetAsphaltColor];//CELL SEPERATOR
    UILabel *label = [[UILabel alloc] init];
    label.text = [self.weekDays objectAtIndex:section
                  ];
//monday
    label.textColor = [UIColor colorWithRed:255/255.0f green:238/255.0f blue:244/255.0f alpha:1.0];//text label
    label.frame = CGRectMake(20, 0, 200, 40);
    [control addSubview:label];
    [control addSubview:view];
    return control;
}

- (void)mTableView:(TQMultistageTableView *)tableView didSelectHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerClick%d",section);
}

//celll点击
//- (void)mTableView:(TQMultistageTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"cellClick%@",indexPath);
//}

//header展开
- (void)mTableView:(TQMultistageTableView *)tableView willOpenHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerOpen%d",section);
}

//header关闭
- (void)mTableView:(TQMultistageTableView *)tableView willCloseHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerClose%d",section);
}

//- (void)mTableView:(TQMultistageTableView *)tableView willOpenCellAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"OpenCell%@",indexPath);
//}
//
//- (void)mTableView:(TQMultistageTableView *)tableView willCloseCellAtIndexPath:(NSIndexPath *)indexPath;
//{
//    NSLog(@"CloseCell%@",indexPath);
//}

@end
