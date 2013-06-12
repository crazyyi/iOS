//
//  SHRegisterAccountViewController.h
//  SportHere
//
//  Created by Yi Zeng on 6/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHRegisterAccountViewController : UIViewController
{
    
    __weak IBOutlet UITextField *usernameField;
    
    __weak IBOutlet UITextField *passwordField;
    __weak IBOutlet UITextField *emailField;
    __weak IBOutlet UITextField *cityField;
}
- (IBAction)registerButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;
@end
