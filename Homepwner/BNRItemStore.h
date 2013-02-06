//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Yi Zeng on 4/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
}



+ (BNRItemStore *)sharedStore;

- (void)removeItem:(BNRItem *)p;
- (NSArray *)allItems;
- (BNRItem *)createItem;
- (void)moveItemIndex:(int)from toIndex:(int)to;
@end
