//
//  SHMainScreenViewController.m
//  SportHere
//
//  Created by Yi Zeng on 6/06/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "SHMainScreenViewController.h"
#import "SHFMDBDataAccess.h"
#import "SHSport.h"
#import "SHFriendsListViewController.h"

@interface SHMainScreenViewController ()

@end

@implementation SHMainScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.sportListTableView.dataSource = self;
    self.sportListTableView.delegate = self;
    SHFMDBDataAccess *fmdb = [[SHFMDBDataAccess alloc] init];
    sportList = [fmdb getSports];
    for (SHSport *sport in sportList) {
        NSLog(@"sport: %@", sport.sportName);
    }
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sportCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sportCell"];
    }
    
    SHSport *sport = [sportList objectAtIndex:[indexPath row]];
    cell.textLabel.text = sport.sportName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHUser *sport = [sportList objectAtIndex:[indexPath row]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:[sport.id integerValue] forKey:@"current_sport"];
    SHFriendsListViewController *friendsListController = [[SHFriendsListViewController alloc] init];
    
    [self.navigationController pushViewController:friendsListController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Sport list has %d sports.", sportList.count);
    return sportList.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Choose a sport";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
