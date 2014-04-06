//
//  sendingMessageTableViewController.m
//  Global Brigades
//
//  Created by MIRKO on 4/6/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import "sendingMessageTableViewController.h"

@interface sendingMessageTableViewController ()

@end

@implementation sendingMessageTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.friendsRelation= [[PFUser currentUser] objectForKey: @"friendsRelation"];
    
    self.recipients= [[NSMutableArray alloc] init];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // how many rows.
    return [self.friends count];
}

//display data in cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user= [self.friends objectAtIndex: indexPath.row];
    cell.textLabel.text= user.username;
    
    if ([self.recipients containsObject: user.objectId]){
        cell.accessoryType= UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType= UITableViewCellAccessoryNone;
    } 
    
    
    return cell;
}


// What happens when you click on a cell
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    UITableViewCell *cell = [ self.tableView cellForRowAtIndexPath:indexPath];
    PFUser *user= [self.friends objectAtIndex:indexPath.row];
    
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.recipients addObject: user.objectId];
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone ;
        [self.recipients removeObject:user.objectId];
        
    }
    NSLog(@"%@", self.recipients);
}

#pragma mark - IBActions

// cancel button methods

- (IBAction)cancel:(id)sender {
    
    [self.recipients removeAllObjects];
    [self.navigationController popViewControllerAnimated:YES];
}

// send button methods

- (IBAction)send:(id)sender {
    
    [self uploadMessage];
    [self.navigationController popViewControllerAnimated:YES];
    

}

#pragma mark - Helper Methords

- (void) uploadMessage  {
    

    PFObject *message = [PFObject objectWithClassName:@"Messages"];
    [message setObject:self.recipients forKey:@"recipients"];
    [message setObject:[[PFUser currentUser] objectId] forKey:@"senderId"];
    [message setObject:[[PFUser currentUser] username] forKey:@"senderName"];
    [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error){
            UIAlertView *alertView= [[UIAlertView alloc] initWithTitle:@"An error occured" message:@"Please try sending your message again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        } else {
            [self.recipients removeAllObjects];
            
        }
        
    }];
}
@end
