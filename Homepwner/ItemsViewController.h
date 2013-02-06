//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Yi Zeng on 4/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

- (UIView *)headerView;
- (IBAction)addNewItem:(id)sender;
- (IBAction)toggleEditingMode:(id)sender;
@end
