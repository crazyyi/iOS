//
//  SHFMDBDataAccess.m
//  SportHere
//
//  Created by Yi Zeng on 7/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "SHFMDBDataAccess.h"
#import "FMDatabase.h"
#import "SHUtilities.h"
#import "SHUser.h"
#import "SHSport.h"

@implementation SHFMDBDataAccess
- (NSMutableArray *)getUsers
{
    NSMutableArray *users = [[NSMutableArray alloc] init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[SHUtilities getDatabasePath]];
    
    if (![db open]) {
        return NULL;
    }
    
    FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM user"];
    
    while ([resultSet next]) {
        SHUser *user = [[SHUser alloc] init];
        user.id = [NSNumber numberWithInt:[resultSet intForColumn:@"id"]];
        user.username = [resultSet stringForColumn:@"username"];
        user.password = [resultSet stringForColumn:@"password"];
        user.longitude = [NSNumber numberWithDouble:[resultSet doubleForColumn:@"longitude"]];
        user.latitude = [NSNumber numberWithDouble:[resultSet doubleForColumn:@"latitude"]];
        [users addObject:user];
    }
    
    [db close];
    
    return users;
}

- (NSMutableArray *)getSports
{
    NSMutableArray *sports = [[NSMutableArray alloc] init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[SHUtilities getDatabasePath]];
    
    if (![db open]) {
        return NULL;
    }
    
    @try {

        
        FMResultSet *resultSet = [db executeQuery:@"SELECT sports.id, sport_name FROM sports"];
        
        while ([resultSet next]) {
            SHSport *sport = [[SHSport alloc] init];
            
            sport.id = [NSNumber numberWithInt:[resultSet intForColumn:@"id"]];
            sport.sportName = [resultSet stringForColumn:@"sport_name"];
            [sports addObject:sport];
        }
        
        [db close];
    }
    @catch (NSException *exception) {
        NSLog(@"Getting exception %@ and the cause is %@", exception.name, exception.reason);
    }
    @finally {
        return sports;
    }

}

- (NSMutableArray *)getUsersNearUser:(NSInteger)userId inSport:(NSInteger)sportId
{
    NSMutableArray *users = [[NSMutableArray alloc] init];
    
    @try {
        FMDatabase *db = [FMDatabase databaseWithPath:[SHUtilities getDatabasePath]];
        
        if (![db open]) {
            return NULL;
        }
        
        FMResultSet *resultSet = [db executeQueryWithFormat:@"select username, isOnline, longitude, latitude from user join user_sports as us on user.id = us.userid join sports on us.sportid = sports.id where user.id <> %d and sports.id = %d", userId, sportId];
        
        while ([resultSet next]) {
            SHUser *user = [[SHUser alloc] init];
            user.username = [resultSet stringForColumn:@"username"];
            [user setIsOnline:[self booleanValueFromInteger:[resultSet intForColumn:@"isOnline"]]];
            user.longitude = [NSNumber numberWithDouble:[resultSet doubleForColumn:@"longitude"]];
            user.latitude = [NSNumber numberWithDouble:[resultSet doubleForColumn:@"latitude"]];
            NSLog(@"Friends' name is %@", user.username);
            [users addObject:user];
        }
        [db close];
    } @catch (NSException *exception) {
        NSLog(@"Getting exception %@ and the cause is %@", exception.name, exception.reason);
    } @finally {
        return users;
    }

}

- (SHUser *)getUserById:(int)userId
{
    SHUser *user = [[SHUser alloc] init];
    @try {
        FMDatabase *db = [FMDatabase databaseWithPath:[SHUtilities getDatabasePath]];
        if (![db open]) {
            return NULL;
        }
        
        FMResultSet *resultSet = [db executeQueryWithFormat:@"select username, longitude, latitude from user where user.id = %d", userId];
        
        while ([resultSet next]) {
            user.username = [resultSet stringForColumn:@"username"];
            user.longitude = [NSNumber numberWithDouble:[resultSet doubleForColumn:@"longitude"]];
            user.latitude = [NSNumber numberWithDouble:[resultSet doubleForColumn:@"latitude"]];
            
        }
        [db close];
        
    }
    @catch (NSException *exception) {
        NSLog(@"Getting exception %@ and the cause is %@", exception.name, exception.reason);
    }
    @finally {
        return user;
    }
}

- (BOOL)booleanValueFromInteger:(int)value
{
    if (value == 0)
        return NO;
    else
        return YES;
}
@end
