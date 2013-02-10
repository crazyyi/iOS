//
//  DetailViewController.h
//  Homepwner
//
//  Created by Yi Zeng on 8/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BNRItem;

@interface DetailViewController : UIViewController
{
    
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    
    __weak IBOutlet UILabel *dateLabel;
}

@property (nonatomic, strong) BNRItem *item;
@end
