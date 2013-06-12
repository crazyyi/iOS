//
//  SHAppDelegate.h
//  SportHere
//
//  Created by Yi Zeng on 5/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *databaseName;
    NSString *databasePath;
}
@property (strong, nonatomic) UIWindow *window;

@end
