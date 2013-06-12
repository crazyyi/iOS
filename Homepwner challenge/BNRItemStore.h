//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Yi Zeng on 4/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BNRItem;

@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
    NSMutableArray *allAssetTypes;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}



+ (BNRItemStore *)sharedStore;

- (void)removeItem:(BNRItem *)p;
- (NSArray *)allItems;
- (BNRItem *)createItem;
- (void)moveItemIndex:(int)from toIndex:(int)to;
- (NSString *)itemArchivePath;
- (BOOL)saveChanges;
- (void)loadAllItems;
- (NSMutableArray *)allAssetTypes;
- (NSManagedObjectContext *)managedObjectContext;
@end
