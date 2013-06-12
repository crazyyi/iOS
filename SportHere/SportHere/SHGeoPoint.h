//
//  SHGeoPoint.h
//  SportHere
//
//  Created by Yi Zeng on 10/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHGeoPoint : NSObject
{
    double longitude;
    double latitude;
}

- (id)initWithLongitude:(double)longitude latitude:(double)latitude;
- (void)setLongitude:(int)value;
- (double)longitude;
- (void)setLatitude:(int)value;
- (double)latitude;
@end
