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
@synthesize weekDays,scheduleList,detailList,detailList2,detailList3,detailList4,scheduleB;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0, self.tempView.frame.origin.y, self.view.frame.size.width,self.tempView.frame.size.height)];
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
    scheduleB = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSArray *mondayList = [[NSArray alloc] initWithObjects:@"3:30\nto\n4:00", @"5:00\nto\n6:30", @"8:00\nto\n9:30", nil];
    NSArray *tueList = [[NSArray alloc] initWithObjects:@"4:00\nto\n5:00", @"5:45\nto\n7:15", nil];
    NSArray *wedList = [[NSArray alloc] initWithObjects:@"4:00\nto\n4:45", @"5:30\nto\n6:15", @"7:00\nto\n8:00",@"9:00\nto\n9:45", nil];
    NSArray *thuList = [[NSArray alloc] initWithObjects:@"3:45\nto\n4:30", @"5:30\nto\n6:30", nil];
    NSArray *friList = [[NSArray alloc] initWithObjects:@"2:30\nto\n3:15", @"5:00pm\nto\n5:45pm",@"6:45\nto\n7:45", nil];
    NSArray *satList = [[NSArray alloc] initWithObjects:@"9:00am\nto\n10:30am", @"11:30am\nto\n12:00",@"12:45\nto\n1:30",nil];
    
   //bottom timecell
    NSArray *mondayB = [[NSArray alloc] initWithObjects:@"4:30\nto\n5:00", @"6:30\nto\n8:00",@"", nil];
    NSArray *tueB = [[NSArray alloc] initWithObjects:@"5:00\nto\n5:45", @"7:15\nto\n9:00", nil];
    NSArray *wedB = [[NSArray alloc] initWithObjects:@"4:45\nto\n5:30", @"6:15\nto\n7:00",@"8:00\nto\n8:45",@"",nil];
    NSArray *thuB = [[NSArray alloc] initWithObjects:@"4:30\nto\n5:30", @"6:30\nto\n8:00", nil];
     NSArray *friB = [[NSArray alloc] initWithObjects:@"3:30\nto\n5:00", @"5:45\nto\n6:45",@"", nil];
    NSArray *satB = [[NSArray alloc] initWithObjects:@"10:30am\nto\n11:30am", @"12:00\nto\n12:45",@"", nil];
   
    
    //topCell
    NSArray *mondayDetails = [[NSArray alloc] initWithObjects:@"JAZZ/BALLET",@"BALLET TECHNIQUE",@"JAZZ/LYRICAL",@"", nil];
    NSArray *tueDetails = [[NSArray alloc] initWithObjects:@"JAZZ",@"JAZZ/LYRICAL", nil];
    NSArray *wedDetails = [[NSArray alloc] initWithObjects:@"HIP HOP",@"HIP HOP",@"TAP COMPANY",@"HIP HOP",nil];
    NSArray *thurDetails = [[NSArray alloc] initWithObjects:@"BALLET",@"JAZZ COMPANY", nil];
    NSArray *friDetails = [[NSArray alloc] initWithObjects:@"CREATIVE MOVEMENT",@"ACRO", @"ACRO",nil];
    NSArray *satDetails = [[NSArray alloc] initWithObjects:@"JAZZ/LYRICAL",@"TAP",@"CREATIVE MOVEMENT\n", nil];
    
    NSArray *mondayDetails2 = [[NSArray alloc] initWithObjects:@"K to 1st Grade",@"Divas/Superstars",@"12th Grade & Adults", nil];
    NSArray *tueDetails2 = [[NSArray alloc] initWithObjects:@"2nd to 5th Grade",@"Divas Company", nil];
    NSArray *wedDetails2 = [[NSArray alloc] initWithObjects:@"K & 1st Grade",@"4th to 6th grade",@"",@"12th Grade & Adults", nil];
    NSArray *thurDetails2 = [[NSArray alloc] initWithObjects:@"2nd to 5th Grade",@"SRs", nil];
    NSArray *friDetails2 = [[NSArray alloc] initWithObjects:@"Level 1\nAges 2 & 3",@"Level 1",@"Level 3", nil];
    NSArray *satDetails2 = [[NSArray alloc] initWithObjects:@"Tiny Tots Company",@"K & 1st Grade",@"Level 2\nAges 3 1/2 & 41/2", nil];
    
    
    //bottomCell
    NSArray *mondayDetails3 = [[NSArray alloc] initWithObjects:@"TAP",@"BALLET TECHNIQUE",@"", nil];
    NSArray *tueDetails3 = [[NSArray alloc] initWithObjects:@"TAP",@"JAZZ/TAP", nil];
    NSArray *wedDetails3 = [[NSArray alloc] initWithObjects:@"HIP HOP",@"HIP HOP",@"TAP",@"", nil];
    NSArray *thurDetails3 = [[NSArray alloc] initWithObjects:@"MODERN/BALLET TECH",@"SPECIALTY CO", nil];
    NSArray *friDetails3 = [[NSArray alloc] initWithObjects:@"JAZZ & LYRICAL\n",@"ACRO",@"", nil];
    NSArray *satDetails3 = [[NSArray alloc] initWithObjects:@"JAZZ/BALLET",@"CREATIVE MOVEMENT\n",@"",nil];
    
    NSArray *mondayDetails4 = [[NSArray alloc] initWithObjects:@"K & 1st Grade",@"Sr. Company",@"", nil];
    NSArray *tueDetails4 = [[NSArray alloc] initWithObjects:@"2nd to 5th Grade",@"6th Grade & up", nil];
    NSArray *wedDetails4 = [[NSArray alloc] initWithObjects:@"2nd & 3rd Grade",@"7th to 11th Grade", @"12th grade & Adults",@"", nil];
    NSArray *thurDetails4 = [[NSArray alloc] initWithObjects:@"",@"", nil];
    NSArray *friDetails4= [[NSArray alloc] initWithObjects:@"SUPERSTARS\nCOMPANY",@"LEVEL 2",@"", nil];
    NSArray *satDetails4 = [[NSArray alloc] initWithObjects:@"K & 1st Grade",@"Level 1\nAges 2 & 3",@"", nil];

    
    [scheduleList addObject:mondayList];
    [scheduleList addObject:tueList];
    [scheduleList addObject:wedList];
    [scheduleList addObject:thuList];
    [scheduleList addObject:friList];
    [scheduleList addObject:satList];
    [self.view addSubview:self.mTableView];
    
    [scheduleB addObject:mondayB];
    [scheduleB addObject:tueB];
    [scheduleB addObject:wedB];
    [scheduleB addObject:thuB];
    [scheduleB addObject:friB];
    [scheduleB addObject:satB];
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
    return [[self.scheduleB objectAtIndex:section] count];
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
    
    NSArray *schedb =[scheduleB objectAtIndex:indexPath.section];
    cell.timeB.text=[schedb objectAtIndex:indexPath.row];

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
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 100)];
    view.backgroundColor = [UIColor colorWithRed:187/255.0 green:206/255.0 blue:190/255.0 alpha:1];;
    view3.backgroundColor = [UIColor clearColor];;//bottomofOpening Cell
    return view4;
   
}

#pragma mark - Table view delegate
//height inside view
- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70;
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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 68, tableView.frame.size.width, 2)];
    view.backgroundColor = [UIColor wetAsphaltColor];//CELL SEPERATOR
    UILabel *label = [[UILabel alloc] init];
    label.text = [self.weekDays objectAtIndex:section
                  ];
//monday
    label.textColor = [UIColor colorWithRed:255/255.0f green:238/255.0f blue:244/255.0f alpha:1.0];//text label
    label.frame = CGRectMake(130, 10, 200, 50);
    label.textAlignment = NSTextAlignmentCenter;
   
   // UIImageView *image = [[UIImageView alloc]initWithImage:<#(UIImage *)#>;
    

    
    
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
