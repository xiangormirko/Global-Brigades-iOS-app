//
//  newsfeedViewController.m
//  Global Brigades
//
//  Created by MIRKO on 2/26/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import "newsfeedViewController.h"
#import <Parse/Parse.h>

@interface newsfeedViewController ()

@end

@implementation newsfeedViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    PFUser *currentUser= [PFUser currentUser];
    if(currentUser) {
        NSLog(@"Current user: %@", currentUser.username );
        
    }else{
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Hide the tab bar in your other view
    if([segue.identifier isEqualToString:@"showLogin"]) {
        
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- UITextField delegate methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


@end
