//
//  SHUtilities.m
//  SportHere
//
//  Created by Yi Zeng on 7/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "SHUtilities.h"
#import "SHGeoPoint.h"

@implementation SHUtilities
static NSString *databasePath;

+ (void)setDatabasePath:(NSString *)dbPath
{
    databasePath = dbPath;
}

+ (NSString *)getDatabasePath
{
    return databasePath;
}

+ (double)distanceBetweenPoint:(SHGeoPoint *)from andPoint:(SHGeoPoint *)to
{
//    var R = 6371; // Radius of the earth in km
//    var dLat = deg2rad(lat2-lat1);  // deg2rad below
//    var dLon = deg2rad(lon2-lon1);
//    var a =
//    Math.sin(dLat/2) * Math.sin(dLat/2) +
//    Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
//    Math.sin(dLon/2) * Math.sin(dLon/2)
//    ;
//    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
//    var d = R * c; // Distance in km
//    return d;
    
    int R = 6371;
    double dLatitude = [self deg2rad:to.latitude - from.latitude];
    double dLongitude = [self deg2rad:to.longitude - from.longitude];
    double a = sin(dLatitude / 2) * sin(dLatitude / 2) +
    cos([self deg2rad:from.latitude]) * cos([self deg2rad:to.latitude]) *
    sin(dLongitude / 2) * sin(dLongitude / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = R * c; // Distance in km
    return distance;
}

+ (double)deg2rad:(double)degree
{
    return degree * (M_PI / 180);
}
@end
