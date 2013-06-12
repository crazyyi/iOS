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
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIPopoverControllerDelegate>
{
    
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIToolbar *toolbar;
    __weak IBOutlet UIButton *assetTypeButton;
    
    UIPopoverController *imagePickerPopover;
    UIPopoverController *assetTypePickerPopover;
}
- (IBAction)changeDate:(id)sender;
- (IBAction)backgroundTapped:(id)sender;
- (IBAction)showAssetTypePicker:(UIButton *)sender;


- (IBAction)takePicture:(id)sender;
- (id)initForNewItem:(BOOL)isNew;

@property (nonatomic, copy) void (^dismissBlock)(void);
@property (nonatomic, strong) BNRItem *item;
@end
