//
//  SHFMDBDataAccess.h
//  SportHere
//
//  Created by Yi Zeng on 7/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHSport.h"
@class SHUser;
@interface SHFMDBDataAccess : NSObject
{
    
}

- (NSMutableArray *)getUsers;
- (NSMutableArray *)getSports;
- (NSMutableArray *)getUsersNearUser:(NSInteger)userId inSport:(NSInteger)sportId;
- (SHUser *)getUserById:(int)userId;
- (BOOL)booleanValueFromInteger:(int)value;
@end
