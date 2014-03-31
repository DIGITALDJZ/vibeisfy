//
//  InitialViewController.m
//  Vibesify
//
//  Created by Kiril on 3/5/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "InitialViewController.h"
#import <Parse/Parse.h>

@interface InitialViewController ()
@end

@implementation InitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([PFUser currentUser])
    {
        //navigate to the init screen as user is logged in
        NSLog(@"User already logged in");
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

@end
