//
//  CreationDateViewController.h
//  Homepwner
//
//  Created by Yi Zeng on 11/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BNRItem;

@interface CreationDateViewController : UIViewController
{
    __weak IBOutlet UIDatePicker *datePicker;
}

@property (nonatomic, strong) BNRItem *item;
@end
