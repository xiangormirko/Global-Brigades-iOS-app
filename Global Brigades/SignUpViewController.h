//
//  SignUpViewController.h
//  Global Brigades
//
//  Created by MIRKO on 2/20/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UITextField *password2Field;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *LastNameField;

@property (weak, nonatomic) IBOutlet UITextField *brigadeField;
@property (weak, nonatomic) IBOutlet UITextField *universityField;
- (IBAction)signUpButton:(id)sender;

- (IBAction)dismiss:(id)sender;


@end
