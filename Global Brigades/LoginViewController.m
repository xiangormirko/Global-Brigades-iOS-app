//
//  LoginViewController.m
//  Global Brigades
//
//  Created by MIRKO on 2/20/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.usernameField.delegate= self;
    self.passwordField.delegate= self;

    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Hide the tab bar in your other view
    if([segue.identifier isEqualToString:@"showSignUp"]) {
        
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }}

- (IBAction)loginButton:(id)sender {
    NSString *username= [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password= [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if ([username length]==0 || [password length] ==0 )  {
        UIAlertView *alertView= [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter username and password !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alertView show];
    } else {
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (error) {
                UIAlertView *alertView= [[UIAlertView alloc] initWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alertView show];
            } else{
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
            
            
        }];
    }
}

#pragma mark- UITextField delegate methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


@end
