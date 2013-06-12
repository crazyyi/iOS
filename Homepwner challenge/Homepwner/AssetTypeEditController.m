//
//  AssetTypeEditController.m
//  Homepwner
//
//  Created by Yi Zeng on 28/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import "AssetTypeEditController.h"
#import "BNRItemStore.h"

@interface AssetTypeEditController ()

@end

@implementation AssetTypeEditController
@synthesize assetType;
@synthesize dismissBlock;

- (id)initForNewAssetType:(BOOL)isNew
{
    self = [super initWithNibName:@"AssetTypeEditController" bundle:nil];
    
    if (self) {
        if (isNew) {
            UIBarButtonItem *bbiSave = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAssetType:)];
            
            [[self navigationItem] setRightBarButtonItem:bbiSave];
            
            UIBarButtonItem *bbiCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            
            [[self navigationItem] setLeftBarButtonItem:bbiCancel];
        }
        
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initForNewItem:" userInfo:nil];
    return nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[self view] endEditing:YES];
}

- (void)setPopover:(UIPopoverController *)pc
{
    popover = pc;
}

- (void)saveAssetType:(id)sender
{
    assetType = [NSEntityDescription insertNewObjectForEntityForName:@"BNRAssetType" inManagedObjectContext:[[BNRItemStore sharedStore] managedObjectContext]];
    [assetType setValue:addAssetTypeField.text forKey:@"label"];
    [[[BNRItemStore sharedStore] allAssetTypes] addObject:assetType];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        if (popover != nil)
        {
            [popover dismissPopoverAnimated:YES];
        } else {
            NSLog(@"Nothing to dismiss.");
        }
    } else {
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
    }
    
}

- (void)cancel:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}

@end
