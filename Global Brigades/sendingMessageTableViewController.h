//
//  sendingMessageTableViewController.h
//  Global Brigades
//
//  Created by MIRKO on 4/6/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface sendingMessageTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSMutableArray *recipients;


- (IBAction)cancel:(id)sender;

- (IBAction)send:(id)sender;

- (void) uploadMessage;


@end
