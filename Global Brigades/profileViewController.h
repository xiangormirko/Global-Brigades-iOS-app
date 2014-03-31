//
//  profileViewController.h
//  Global Brigades
//
//  Created by MIRKO on 3/13/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface profileViewController : UIViewController


@property (nonatomic, strong) NSArray *name;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *brigadeLabel;

@property (weak, nonatomic) IBOutlet UILabel *chapterLabel;


@property (weak, nonatomic) IBOutlet UITextView *profileSummary;

@property (nonatomic, copy) NSString *hello;



- (IBAction)updateProfile:(id)sender;




@end
