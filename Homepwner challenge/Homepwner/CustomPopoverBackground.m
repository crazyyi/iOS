//
//  CustomPopoverBackground.m
//  Homepwner
//
//  Created by Yi Zeng on 13/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import "CustomPopoverBackground.h"

@implementation CustomPopoverBackground
@synthesize arrowOffset, arrowDirection;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


+ (UIEdgeInsets)contentViewInsets
{
    return UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0);
}


+ (CGFloat)arrowHeight
{
    return 30.0;
}

+ (CGFloat)arrowBase
{
    return 42.0;
}
@end
