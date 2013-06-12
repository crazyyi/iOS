//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Yi Zeng on 12/02/13.
//  Copyright (c) 2013 Yi Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject
{
    NSMutableDictionary *dictionary;
}

+ (BNRImageStore *)sharedStore;

- (NSString *)imagePathForKey:(NSString *)key;
- (void)setImage:(UIImage *)i forKey:(NSString *)s;
- (UIImage *)imageForKey:(NSString *)s;
- (void)deleteImageForKey:(NSString *)s;
@end
