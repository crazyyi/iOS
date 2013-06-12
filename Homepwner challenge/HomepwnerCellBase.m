//
//  HomepwnerCellBase.m
//  Homepwner
//
//  Created by Yi Zeng on 25/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import "HomepwnerCellBase.h"

@implementation HomepwnerCellBase

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
