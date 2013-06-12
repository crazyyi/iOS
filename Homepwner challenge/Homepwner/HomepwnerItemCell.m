//
//  HomepwnerItemCell.m
//  Homepwner
//
//  Created by Yi Zeng on 22/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import "HomepwnerItemCell.h"

@implementation HomepwnerItemCell

@synthesize thumbnailView, nameLabel, serialNumberLabel, valueLabel;
@synthesize controller, tableView;

- (IBAction)showImage:(id)sender {
    
    // Get this name of this method, "showImage:"
    NSString *selector = NSStringFromSelector(_cmd);
    
    // Selector is now = "showImage:atIndexPath:"
    selector = [selector stringByAppendingString:@"atIndexPath:"];
    
    // Prepare a selector from this string
    SEL newSelector = NSSelectorFromString(selector);
    
    
    NSIndexPath *indexPath = [[self tableView] indexPathForCell:self];
    
    
    if (indexPath) {
        if ([[self controller] respondsToSelector:newSelector]) {
            [[self controller] performSelector:newSelector withObject:sender withObject:indexPath];
        }
    }
    
}
@end
