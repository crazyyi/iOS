//
//  DetailViewController.m
//  Homepwner
//
//  Created by Yi Zeng on 8/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import "DetailViewController.h"
#import "BNRItem.h"
#import "CreationDateViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize item;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [nameField setText:[item itemName]];
    [serialNumberField setText:[item serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];
    
    // Create a NSDateFormatter that will turn a date into a simple date string
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    // Use filtered NSDate object to set dateLabel contents
    [dateLabel setText:[dateFormatter stringFromDate:[item dateCreated]]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[self view] endEditing:YES];
    
    [item setItemName:nameField.text];
    [item setSerialNumber:serialNumberField.text];
    [item setValueInDollars:[valueField.text intValue]];
}

- (void)setItem:(BNRItem *)i
{
    item = i;
    
    [[self navigationItem] setTitle:[item itemName]];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [valueField resignFirstResponder];
}

- (IBAction)changeDate:(id)sender {
    CreationDateViewController *cdViewController = [[CreationDateViewController alloc] init];
    
    [cdViewController setItem:item];
    [[self navigationController] pushViewController:cdViewController animated:YES];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // If our device has a camera, we want to take a picture, otherwise, we just pick from photo library
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}
@end
