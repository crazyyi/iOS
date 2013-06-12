//
//  SHFriendsListViewController.h
//  SportHere
//
//  Created by Yi Zeng on 6/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHUser.h"
#import "SHSport.h"

@interface SHFriendsListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *friends;
    NSInteger userId;
    NSInteger sportId;
}
@property (weak, nonatomic) IBOutlet UITableView *friendsListView;

@end
