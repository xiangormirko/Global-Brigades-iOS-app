//
//  composeMessageViewController.h
//  Global Brigades
//
//  Created by MIRKO on 4/9/14.
//  Copyright (c) 2014 Xiangormirko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class composeMessageViewController;

@protocol composeMessageViewControllerDelegate <NSObject>

-(void) passMessage: (composeMessageViewController *) contorller didFinishWithItem: (NSString*) item;

@end

@interface composeMessageViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *message;

@property (strong, nonatomic) NSString *messageText;



- (IBAction)recipients:(id)sender;

@property (weak, nonatomic) id<composeMessageViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;

@end
