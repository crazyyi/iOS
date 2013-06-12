//
//  SHLoginViewController.h
//  SportHere
//
//  Created by Yi Zeng on 6/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
#import "SHUser.h"

@interface SHLoginViewController : UIViewController
{
    __weak IBOutlet UITextField *usernameField;    
    __weak IBOutlet UITextField *passwordField;
    FMDatabase *db;
    SHUser *user;
}
- (IBAction)loginButtonPressed:(id)sender;
@end
