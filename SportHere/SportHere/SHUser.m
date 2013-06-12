//
//  SHUser.m
//  SportHere
//
//  Created by Yi Zeng on 7/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "SHUser.h"

@implementation SHUser
@synthesize id, username, password, longitude, latitude, lastActiveDate;

- (void)setIsOnline:(BOOL)value
{
    isOnline = value;
}

- (BOOL)isOnline
{
    return isOnline;
}

- (void)setIsActive:(BOOL)value
{
    isActive = value;
}

- (BOOL)isActive
{
    return isActive;
}
@end
