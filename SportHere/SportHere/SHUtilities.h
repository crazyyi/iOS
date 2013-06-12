//
//  SHUtilities.h
//  SportHere
//
//  Created by Yi Zeng on 7/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SHGeoPoint;

@interface SHUtilities : NSObject

+ (void)setDatabasePath:(NSString *)dbPath;
+ (NSString *)getDatabasePath;
+ (double)distanceBetweenPoint:(SHGeoPoint *)from andPoint:(SHGeoPoint *)to;
+ (double)deg2rad:(double)degree;
@end
