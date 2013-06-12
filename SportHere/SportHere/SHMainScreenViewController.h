//
//  SHMainScreenViewController.h
//  SportHere
//
//  Created by Yi Zeng on 6/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHMainScreenViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *sportList;
}
@property (weak, nonatomic) IBOutlet UITableView *sportListTableView;

@end
