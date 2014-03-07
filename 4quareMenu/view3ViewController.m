//
//  view3ViewController.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "view3ViewController.h"
#import "APLCollectionViewController.h"

@interface view3ViewController ()


@end
#define MAX_COUNT 60
#define CELL_ID @"CELL_ID"

@implementation view3ViewController

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [self nextViewControllerAtPoint:CGPointZero];
    [self.navigationController pushViewController:vc animated:YES];
}


-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p
{
    // We could have multiple section stacks and find the right one,
    UICollectionViewFlowLayout* grid = [[UICollectionViewFlowLayout alloc] init];
    grid.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    grid.itemSize = CGSizeMake(600, 600);
    APLCollectionViewController* nextCollectionViewController = [[APLCollectionViewController alloc] initWithCollectionViewLayout:grid];
    nextCollectionViewController.useLayoutToLayoutNavigationTransitions = YES;
    nextCollectionViewController.title = @"Layout 2";
    return nextCollectionViewController;
}


@end
