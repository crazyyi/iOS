//
//  CreationDateViewController.m
//  Homepwner
//
//  Created by Yi Zeng on 11/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import "CreationDateViewController.h"
#import "BNRItem.h"

@interface CreationDateViewController ()

@end

@implementation CreationDateViewController
@synthesize item;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:[self.item dateCreated]];
    [datePicker setDate:date];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[self view] endEditing:YES];
    
    item.dateCreated = [[datePicker date] timeIntervalSinceReferenceDate];
}
@end
