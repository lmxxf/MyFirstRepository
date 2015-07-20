//
//  MyDrawFrameRectViewClass.h
//  InterfaceBuilderDesignableTest
//
//  Created by Seth Jin on 15/7/20.
//  Copyright (c) 2015年 Gintong. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface MyDrawFrameRectViewClass : UIView

@property (nonatomic, retain) IBInspectable UIColor *myColor;
@property (nonatomic) IBInspectable CGFloat lineWidth;

@end
