//
//  friendsViewController.m
//  Global Brigades
//
//  Created by MIRKO on 3/13/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import "friendsViewController.h"
#import "editFriendsViewController.h"

@interface friendsViewController ()

@end

@implementation friendsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.friendsRelation= [[PFUser currentUser] objectForKey: @"friendsRelation"];



}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"showEditFriends"]) {
        editFriendsViewController  *viewController= (editFriendsViewController *) segue.destinationViewController ;
        viewController.friends= [NSMutableArray arrayWithArray: self.friends];
    }
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    
    PFQuery *query= [self.friendsRelation query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error %@ %@", error, [error userInfo]);
        }
        else {
            self.friends = objects;
            [self.tableView reloadData];
        }
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user= [self.friends objectAtIndex: indexPath.row];
    cell.textLabel.text= user.username;
    
    return cell;
}
@end
