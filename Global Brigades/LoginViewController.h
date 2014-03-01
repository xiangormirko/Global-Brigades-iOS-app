//
//  LoginViewController.h
//  Global Brigades
//
//  Created by MIRKO on 2/20/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginViewController: UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;


- (IBAction)loginButton:(id)sender;




@end
