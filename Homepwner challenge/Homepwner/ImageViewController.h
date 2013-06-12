//
//  ImageViewController.h
//  Homepwner
//
//  Created by Yi Zeng on 24/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController
{
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UIScrollView *scrollView;
}

@property (nonatomic, strong) UIImage *image;
@end
