//
//  AssetTypePicker.h
//  Homepwner
//
//  Created by Yi Zeng on 27/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AssetTypeEditController.h"

@class BNRItem;

@interface AssetTypePicker : UITableViewController
<UIPopoverControllerDelegate, UINavigationControllerDelegate>
{
    UIPopoverController *addNewAssetTypePopover;
}

@property (nonatomic, strong) BNRItem *item;
- (IBAction)addNewAssetType:(id)sender;
@end
