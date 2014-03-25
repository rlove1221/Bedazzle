/*
     File: APLCollectionViewController.m
 Abstract: 
 
  Version: 1.0
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2013 Apple Inc. All Rights Reserved.
 
 
 Copyright © 2013 Apple Inc. All rights reserved.
 WWDC 2013 License
 
 NOTE: This Apple Software was supplied by Apple as part of a WWDC 2013
 Session. Please refer to the applicable WWDC 2013 Session for further
 information.
 
 IMPORTANT: This Apple software is supplied to you by Apple Inc.
 ("Apple") in consideration of your agreement to the following terms, and
 your use, installation, modification or redistribution of this Apple
 software constitutes acceptance of these terms. If you do not agree with
 these terms, please do not use, install, modify or redistribute this
 Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a non-exclusive license, under
 Apple's copyrights in this original Apple software (the "Apple
 Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple. Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis. APPLE MAKES
 NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE
 IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 EA1002
 5/3/2013
 */

#import "APLCollectionViewController.h"
#import "Util.h"
#define MAX_COUNT 60
#define CELL_ID @"CELL_ID"

@implementation APLCollectionViewController
@synthesize imageArray;



-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
    {
        imageArray = [[NSArray alloc] initWithObjects:@"00001_3271343.jpg",@"00002_3271358.jpg",@"00003_3271404.jpg",@"00004_3271411.jpg",@"00005_3271501.jpg",@"00006_3271538.jpg",@"00007_3271595.jpg",@"00008_3271606.jpg",@"00009_3271626.jpg",@"00010_3271649.jpg",@"00011_3271655.jpg",@"00012_3271717.jpg",@"00013_3271752.jpg",@"00014_3271792.jpg",@"00015_3271845.jpg",@"00016_3271869.jpg",@"00017_3271909.jpg",@"00018_3271775.jpg",@"00019_3271849.jpg",@"00020_3272101.jpg",@"00021_3272162.jpg",@"00022_3272267.jpg",@"00023_3272314.jpg",@"00024_3272334.jpg",@"00025_3272351.jpg",@"00026_3272402.jpg",@"00027_3272417.jpg",@"00028_3272472.jpg",@"00029_3272504.jpg",@"00030_3272518.jpg",@"00031_3272535.jpg",@"00032_3272551.jpg",@"00033_3272569.jpg",@"00034_3272647.jpg",@"00035_3272686.jpg",@"00036_3272690.jpg",@"00037_3272725.jpg",@"00038_3272730.jpg",@"00039_3272767.jpg",@"00040_3272783.jpg",@"00041_3272809.jpg",@"00042_3272824.jpg",@"00043_3272867.jpg",@"00043_3272867.jpg",@"Arechino (sibs)__3271568.jpg",@"Arechino (sibs)__3271571.jpg",@"Belmatch__3271584.jpg",@"Bianco__3272212.jpg",@"Derleth__3271629.jpg",@"Derleth__3271743.jpg",@"Lo Presti__3271316.jpg",@"Solnsteva__3271462.jpg", nil];
        
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CELL_ID];
    }

 //self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"eventsBckgrd@2x.png"]];

   
    
       UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"eventsBckgrd@2x.png"]];
    self.collectionView.backgroundView =imageView;
    imageView.contentMode = UIViewContentModeScaleToFill;
    
//self.collectionView.backgroundView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 640,640)];
 //   self.collectionView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"eventsBckgrd.png"]];

  //  UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0,100,0,640)];
 //   [imageView setImage:[UIImage imageNamed:@"eventsBckgrd.png"]];
    
  

  // self.collectionView.backgroundView = imageView;
   // self.collectionView.backgroundView = UIViewContentModeScaleToFill;
    

  

    
    return self;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    //UIColor* cellColor = [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
    UIImage *image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    image = [Util imageWithImage:image scaledToSize:CGSizeMake(100, 100)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 100, cell.contentView.frame.size.width, cell.contentView.frame.size.height);
    [cell.contentView addSubview:imageView];
    //cell.contentView.backgroundColor = cellColor;
    

    return cell;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [imageArray count];;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p
{
    return nil;
}


- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView
                        transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
{
    UICollectionViewTransitionLayout *transitionLayout = [[UICollectionViewTransitionLayout alloc] initWithCurrentLayout:fromLayout nextLayout:toLayout];
    return transitionLayout;
}

@end
