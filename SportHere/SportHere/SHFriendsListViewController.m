//
//  SHFriendsListViewController.m
//  SportHere
//
//  Created by Yi Zeng on 6/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "SHFriendsListViewController.h"
#import "SHFMDBDataAccess.h"
#import "SHUtilities.h"
#import "SHGeoPoint.h"

@interface SHFriendsListViewController ()

@end

@implementation SHFriendsListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.friendsListView.dataSource = self;
    self.friendsListView.delegate = self;
    
    SHFMDBDataAccess *fmdb = [[SHFMDBDataAccess alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    userId = [defaults integerForKey:@"user"];
    sportId = [defaults integerForKey:@"current_sport"];
    NSLog(@"User = %d, sport = %d", userId, sportId);
    friends = [fmdb getUsersNearUser:userId inSport:sportId];
    for (SHUser *user in friends) {
        NSLog(@"Friend's name = %@", user.username);
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"friendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    
    SHUser *friend = [friends objectAtIndex:[indexPath row]];
    NSLog(@"friend's name is %@", friend.username);
    cell.textLabel.text = friend.username;
    SHFMDBDataAccess *fmdb = [[SHFMDBDataAccess alloc] init];
    SHUser *user = [fmdb getUserById:userId];
    SHGeoPoint *userPoint = [[SHGeoPoint alloc] initWithLongitude:[user.longitude integerValue] latitude:[user.latitude integerValue]];
    SHGeoPoint *friendPoint = [[SHGeoPoint alloc] initWithLongitude:[friend.longitude integerValue] latitude:[friend.latitude integerValue]];
    NSString *distanceString = [NSString stringWithFormat:@"%f",[SHUtilities distanceBetweenPoint:userPoint andPoint:friendPoint]];
    NSString *distanceUnit = @" km";
    cell.detailTextLabel.text =  [distanceString stringByAppendingString:distanceUnit];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Friends' count: %d", friends.count);
    return friends.count;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
