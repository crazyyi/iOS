//
//  SHUser.h
//  SportHere
//
//  Created by Yi Zeng on 7/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHUser : NSObject
{
    BOOL isOnline;
    BOOL isActive;
}

- (void)setIsOnline:(BOOL)value;
- (BOOL)isOnline;
- (void)setIsActive:(BOOL)value;
- (BOOL)isActive;

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSDate *lastActiveDate;
@end
