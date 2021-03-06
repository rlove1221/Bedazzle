//
//  MaskView.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-21.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "MaskView.h"

@implementation MaskView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGContextSetRGBFillColor(context,   0.0, 0.0, 0.0, 0.35);
 //   CGContextSetRGBFillColor(context, 0.933333 ,0.509804 ,0.933333, .30);//pink
//  CGContextSetRGBFillColor(context,0.372549, 0.619608 ,0.627451, .30);//green
   //CGContextSetRGBFillColor(context, 0.184314 ,0.309804, 0.309804, .50);//slategreen
  // CGContextSetRGBFillColor(context, 0.282353, 0.819608, 0.8, .60);
  CGContextSetRGBFillColor(context,  0.972549, 0.972549, 1, .60);//ghostwhite
 //   CGContextSetRGBFillColor(context,  0.219608 ,0.556863 ,0.556863, .55);
 //   CGContextSetRGBFillColor(context,  1, 1, 1, .60);
    CGContextSetRGBStrokeColor(context, 1, 1, 1, .80);
//    CGContextSetRGBStrokeColor(context, 0.6, 0.6, 0.6, 1.0);
    
    CGRect clips[] = {rect};
    CGContextClipToRects(context, clips, sizeof(clips) / sizeof(clips[0]));
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3.0);
    
    CGContextFillRect(context, self.bounds);
    CGContextStrokeRect(context, self.bounds);
    UIGraphicsEndImageContext();
}

@end
