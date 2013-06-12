//
//  SHLoginViewController.m
//  SportHere
//
//  Created by Yi Zeng on 6/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "SHLoginViewController.h"
#import "FMDatabase.h"
#import "SHMainScreenViewController.h"
#import "SHFMDBDataAccess.h"
#import "SHUser.h"

@interface SHLoginViewController ()

@end

@implementation SHLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
        [self.view addGestureRecognizer:gr];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)dismissKeyboard:(id)sender
{
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(id)sender {
    if ([self isCredentialValid]) {
        NSLog(@"Login successful...");
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:[user.id integerValue] forKey:@"user"];
        SHMainScreenViewController *mainScreenVC = [[SHMainScreenViewController alloc] init];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainScreenVC];

        [self presentViewController:navController animated:YES completion:nil];
    }
}

- (BOOL)isCredentialValid
{
    SHFMDBDataAccess *fmdb = [[SHFMDBDataAccess alloc] init];
    NSMutableArray *users = [fmdb getUsers];
    user = [users objectAtIndex:0];
    if ([usernameField.text isEqualToString:user.username] && [passwordField.text isEqualToString:user.password]) {
        return YES;
    }
    
    return NO;
}
@end
