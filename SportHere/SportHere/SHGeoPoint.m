//
//  SHGeoPoint.m
//  SportHere
//
//  Created by Yi Zeng on 10/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "SHGeoPoint.h"

@implementation SHGeoPoint


- (id)initWithLongitude:(double)dLongitude latitude:(double)dLatitude
{
    self = [super init];
    
    if (self) {
        self.longitude = dLongitude;
        self.latitude = dLatitude;
    }
    
    return self;
}

- (void)setLongitude:(int)value
{
    longitude = value;
}

- (double)longitude
{
    return longitude;
}

- (void)setLatitude:(int)value
{
    latitude = value;
}

- (double)latitude
{
    return latitude;
}
@end
