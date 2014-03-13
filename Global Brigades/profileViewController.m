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

@end
