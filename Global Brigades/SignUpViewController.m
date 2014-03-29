//
//  SignUpViewController.m
//  Global Brigades
//
//  Created by MIRKO on 2/20/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.usernameField.delegate=self;
    self.passwordField.delegate=self;
    self.password2Field.delegate=self;
    self.emailField.delegate=self;
    self.firstNameField.delegate=self;
    self.LastNameField.delegate=self;
    self.brigadeField.delegate=self;
    self.universityField.delegate=self;


}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}






- (IBAction)signUpButton:(id)sender {
    NSString *username= [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password= [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password2= [self.password2Field.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email= [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *firstn= self.firstNameField.text ;
    NSString *lastn= self.LastNameField.text;
    NSString *brigade= self.brigadeField.text;
    NSString *university= self.universityField.text;
    
    if ([username length]==0 || [password length] ==0 || [email length]==0 || [firstn length]==0 || [lastn length]==0 || [brigade length]==0 || [password2 length]==0 || [university length]==0 )  {
        UIAlertView *alertView= [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter all fields!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alertView show];
    } else {
        PFUser *newUser= [PFUser user];
        newUser.username= username;
        newUser.password=password;
        newUser.email=email;
        
        
        [newUser setObject:firstn forKey:@"firstname"];
        [newUser setObject:lastn  forKey:@"lastname"];
        [newUser setObject:brigade forKey:@"brigade"];
        
        [newUser setObject:university forKey:@"university"];
        
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                UIAlertView *alertView= [[UIAlertView alloc] initWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alertView show];
            }
            else{
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
        
    }

}

- (IBAction)dismiss:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark- UITextField delegate methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end


