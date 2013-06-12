//
//  AssetTypeEditController.h
//  Homepwner
//
//  Created by Yi Zeng on 28/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRItem.h"


@interface AssetTypeEditController : UIViewController
{
    
    __weak IBOutlet UITextField *addAssetTypeField;
    __weak UIPopoverController *popover;
}

@property (nonatomic, copy) void (^dismissBlock)(void);
@property (nonatomic, strong) NSManagedObject *assetType;

- (id)initForNewAssetType:(BOOL)isNew;
- (void)setPopover:(UIPopoverController *)pc;
@end
