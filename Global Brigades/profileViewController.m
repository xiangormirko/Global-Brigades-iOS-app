//
//  profileViewController.m
//  Global Brigades
//
//  Created by MIRKO on 3/13/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import "profileViewController.h"

@interface profileViewController ()



@end


@implementation profileViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    PFQuery *query= [PFUser query];
    [query whereKey:@"objectId" equalTo:[[PFUser currentUser] objectId]];
    [query getObjectInBackgroundWithId:[[PFUser currentUser] objectId] block:^(PFObject *userInfo, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", userInfo);
        
        NSString *username= userInfo[@"username"];
        NSString *brigade= userInfo[@"brigade"];
        NSString *chapter= userInfo[@"chapter"];
        
        self.nameLabel.text=username;
        self.brigadeLabel.text=brigade;
        self.chapterLabel.text=chapter;
        
    }];
    
    PFQuery *query1 = [PFQuery queryWithClassName:@"userInfo"];
    [query1 whereKey:@"parent" equalTo:[[PFUser currentUser] objectId]];
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if(objects.count != 0){
        PFObject * object = objects[0];
        self.profileSummary.text=  object[@"summary"];
        }
        else
        {
            self.profileSummary.text=@"Insert your personal summary";
        }
    }];
    

}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    


    
    
    

}

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




#pragma mark- profile summary

- (IBAction)updateProfile:(id)sender {
    

    PFQuery *query1 = [PFQuery queryWithClassName:@"userInfo"];
    [query1 whereKey:@"parent" equalTo:[[PFUser currentUser] objectId]];
    [query1 getFirstObjectInBackgroundWithBlock:^(PFObject *userInfo, NSError *error) {
    
        if(userInfo != nil){
            
            NSString *summary= self.profileSummary.text;
            userInfo[@"summary"]= summary;
            [userInfo saveInBackground];
        }
        else
        {
            NSString *summary= self.profileSummary.text;
            
            PFObject *userInfo= [PFObject objectWithClassName:@"userInfo"];
            
            userInfo[@"summary"]=summary;
            
            userInfo[@"parent"]=[[PFUser currentUser]objectId];
            
            
            [userInfo saveInBackground];
        }
        
        
        
    }];

        



    
}
@end
