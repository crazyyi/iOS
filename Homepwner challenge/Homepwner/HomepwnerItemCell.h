//
//  HomepwnerItemCell.h
//  Homepwner
//
//  Created by Yi Zeng on 22/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomepwnerCellBase.h"

@interface HomepwnerItemCell : HomepwnerCellBase

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) id controller;
@property (weak, nonatomic) UITableView *tableView;
- (IBAction)showImage:(id)sender;
@end
