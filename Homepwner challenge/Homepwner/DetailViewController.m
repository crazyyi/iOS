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
#import "BNRImageStore.h"
#import "BNRItemStore.h"
#import "CustomPopoverBackground.h"
#import "AssetTypePicker.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize item;
@synthesize dismissBlock;

- (id)initForNewItem:(BOOL)isNew
{
    self = [super initWithNibName:@"DetailViewController" bundle:nil];
    
    if (self) {
        if (isNew) {
            UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
            
            [[self navigationItem] setRightBarButtonItem:doneItem];
            
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            [[self navigationItem] setLeftBarButtonItem:cancelItem];
        }
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initForNewItem:" userInfo:nil];
    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *clr = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        clr = [UIColor colorWithRed:0.875 green:0.88 blue:0.91 alpha:1];
    } else {
        clr = [UIColor groupTableViewBackgroundColor];
    }
    
    
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    // Add a new BarButtonItem to the toolbar
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonSystemItemAction target:self action:@selector(doClear)];
    NSMutableArray *barButtonItems = [toolbar.items mutableCopy];
    
    [barButtonItems addObject:buttonItem];
    toolbar.items = barButtonItems;
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
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:[item dateCreated]];
    [dateLabel setText:[dateFormatter stringFromDate:date]];
    
    [self setItemImage];
    
    NSString *typeLabel = [[item assetType] valueForKey:@"label"];
    
    if (!typeLabel)
        typeLabel = @"None";
    
    [assetTypeButton setTitle:[NSString stringWithFormat:@"Type: %@", typeLabel] forState:UIControlStateNormal];
    
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskLandscape | UIInterfaceOrientationMaskPortrait;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (void)setItemImage
{
    NSString *imageKey = [item imageKey];
    
    if (imageKey) {
        // Get image for image key from image store
        UIImage *imageToDisplay = [[BNRImageStore sharedStore] imageForKey:imageKey];
        
        // Use that image to put on the screen in imageView
        [imageView setImage:imageToDisplay];
    } else {
        // Clear the imageView
        [imageView setImage:nil];
    }
}

- (void)doClear
{
    [item setImageKey:nil];
    [self setItemImage];
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


- (IBAction)changeDate:(id)sender {
    CreationDateViewController *cdViewController = [[CreationDateViewController alloc] init];
    
    [cdViewController setItem:item];
    [[self navigationController] pushViewController:cdViewController animated:YES];
}

- (IBAction)backgroundTapped:(id)sender {
    [[self view] endEditing:YES];
}

- (IBAction)showAssetTypePicker:(UIButton *)sender {
    
    if ([assetTypePickerPopover isPopoverVisible]) {
        // If the popover is already up, get rid of it
        [assetTypePickerPopover dismissPopoverAnimated:YES];
        assetTypePickerPopover = nil;
        return;
    }
    [[self view] endEditing:YES];
    
    AssetTypePicker *assetTypePicker = [[AssetTypePicker alloc] init];
    [assetTypePicker setItem:item];
    
    [[self navigationController] pushViewController:assetTypePicker animated:YES];
}

- (IBAction)takePicture:(id)sender {
    
    if ([imagePickerPopover isPopoverVisible]) {
        // If the popover is already up, get rid of it
        [imagePickerPopover dismissPopoverAnimated:YES];
        imagePickerPopover = nil;
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.allowsEditing = YES;
    
    // If our device has a camera, we want to take a picture, otherwise, we just pick from photo library
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    // Place image picker on the screen
    // Check for iPad device before instantiating the popover controller
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        // Create a new popover controller that will display the imagePicker
        imagePickerPopover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        imagePickerPopover.popoverBackgroundViewClass = [CustomPopoverBackground class];
        [imagePickerPopover setDelegate:self];
        
        // Display the popover controller; sender is the camera bar button item
        [imagePickerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSString *oldKey = [item imageKey];
    
    // Did the item already have an image?
    if (oldKey) {
        //Delete the old image
        [[BNRImageStore sharedStore] deleteImageForKey:oldKey];
    }
    
    // Get picked image from info dictionary
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    
    [item setThumbnailDataFromImage:image];
    
    // Create a NSUUID object
    NSUUID *uuid = [NSUUID UUID];
    
    NSString *key = [uuid UUIDString];
    
    [item setImageKey:key];
    
    // Store image in the BNRImageStore with this key
    [[BNRImageStore sharedStore] setImage:image forKey:[item imageKey]];
    
    // Put that image onto the screen in our image view
    [imageView setImage:image];
    
    // Take image picker off the screen
    // you must call this dismiss method
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        //If on the phone, the image picker is presented modally. Dismiss it.
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        // If on the pad, the image picker is in the popover. Dismiss the popover.
        [imagePickerPopover dismissPopoverAnimated:YES];
        imagePickerPopover = nil;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog(@"User dismissed popover");
    imagePickerPopover = nil;
}

- (void)save:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}

- (void)cancel:(id)sender
{
    // If the user cancelled, then remove the BNRItem from the store
    [[BNRItemStore sharedStore] removeItem:item];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}

@end
