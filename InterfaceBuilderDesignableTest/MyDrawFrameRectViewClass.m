//
//  MyDrawFrameRectViewClass.m
//  InterfaceBuilderDesignableTest
//
//  Created by Seth Jin on 15/7/20.
//  Copyright (c) 2015年 Gintong. All rights reserved.
//

#import "MyDrawFrameRectViewClass.h"

@implementation MyDrawFrameRectViewClass

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect myFrame = self.bounds;
    CGContextSetLineWidth(context, _lineWidth);
    CGRectInset(myFrame, 5, 5);
    [_myColor set];
    UIRectFrame(myFrame);
}

@end
