//
//  extraListViewController.m
//  Global Brigades
//
//  Created by MIRKO on 2/28/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import "extraListViewController.h"
#import <Parse/Parse.h>

@interface extraListViewController ()

@end

@implementation extraListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Hide the tab bar in your other view
    if([segue.identifier isEqualToString:@"showLogin2"]) {
        
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }}



- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin2" sender: self ];
    
}
@end
