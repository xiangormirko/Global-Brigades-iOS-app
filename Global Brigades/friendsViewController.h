//
//  friendsViewController.h
//  Global Brigades
//
//  Created by MIRKO on 3/13/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface friendsViewController : UITableViewController

@property (nonatomic, strong) PFRelation *friendsRelation;

@property (nonatomic, strong) NSArray *friends;

@end
