//
//  AssetTypePicker.m
//  Homepwner
//
//  Created by Yi Zeng on 27/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import "AssetTypePicker.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "AssetTypeEditController.h"
#import "CustomPopoverBackground.h"

@implementation AssetTypePicker
@synthesize item;

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        UINavigationItem *n = [self navigationItem];
        n.title = @"Add";
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewAssetType:)];
        
        [[self navigationItem] setRightBarButtonItem:bbi];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (IBAction)addNewAssetType:(id)sender
{
    if ([addNewAssetTypePopover isPopoverVisible]) {
        [addNewAssetTypePopover dismissPopoverAnimated:YES];
        addNewAssetTypePopover = nil;
        return;
    }
    
    AssetTypeEditController *tec = [[AssetTypeEditController alloc] initForNewAssetType:YES];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tec];
    
    [tec setDismissBlock:^{
        [[self tableView] reloadData];
    }];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        addNewAssetTypePopover = [[UIPopoverController alloc] initWithContentViewController:nav];
        [tec setPopover:addNewAssetTypePopover];
        addNewAssetTypePopover.popoverBackgroundViewClass = [CustomPopoverBackground class];
        [addNewAssetTypePopover setDelegate:self];
        
        [addNewAssetTypePopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        for (UIViewController *c in addNewAssetTypePopover.passthroughViews) {
            NSLog(@"Pass through views %@", c);
        }
        
    } else {
        [self presentViewController:nav animated:YES completion:nil];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allAssetTypes] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)ip
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    NSArray *allAssets = [[BNRItemStore sharedStore] allAssetTypes];
    NSManagedObject *assetType = [allAssets objectAtIndex:[ip row]];
    
    // Use key-value coding to get the asset type's label
    NSString *assetLabel = [assetType valueForKey:@"label"];
    [cell textLabel].text = assetLabel;
    
    // Checkmark the one that is currently selected
    if (assetType == item.assetType) {
        
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)ip
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:ip];
    
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    NSArray *allAssets = [[BNRItemStore sharedStore] allAssetTypes];
    NSManagedObject *assetType = [allAssets objectAtIndex:[ip row]];
    [item setAssetType:assetType];
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog(@"Dismissing Asset type edit popover controller");
    [addNewAssetTypePopover dismissPopoverAnimated:YES];
    addNewAssetTypePopover = nil;
}

@end
