//
//  ViewController.m
//  Vibesify
//
//  Created by Kiril on 2/25/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController ()
- (IBAction)facebookLogin:(id)sender;
- (IBAction)logoutFacebook:(id)sender;
- (IBAction)twitterLogin:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]])
    {
        //navigate to the init screen as user is logged in
    } else {
        if (!FBSession.activeSession.isOpen) {
            // if the session is closed, then we open it here, and establish a handler for state changes
            [FBSession openActiveSessionWithReadPermissions:nil
                                               allowLoginUI:YES
                                          completionHandler:^(FBSession *session,
                                                              FBSessionState state,
                                                              NSError *error) {
                                              if (error) {
                                                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                                      message:error.localizedDescription
                                                                                                     delegate:nil
                                                                                            cancelButtonTitle:@"OK"
                                                                                            otherButtonTitles:nil];
                                                  [alertView show];
                                              } else if (session.isOpen) {
                                                  FBRequest *request = [FBRequest requestForMe];
                                                  [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                                      if (!error) {
                                                          
                                                          //successfully retrieved data so we can parse and show it in console
                                                          NSDictionary *userData = (NSDictionary *)result;
                                                          
                                                          //NSString *facebookID = userData[@"id"];
                                                          NSString *name = userData[@"name"];
                                                          NSString *location = userData[@"location"][@"name"];
                                                          NSString *gender = userData[@"gender"];
                                                          NSString *birthday = userData[@"birthday"];
                                                          NSString *relationship = userData[@"relationship_status"];
                                                          
                                                          //NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
                                                          
                                                          NSLog(@"%@",name);
                                                          NSLog(@"%@",gender);
                                                          NSLog(@"%@",location);
                                                          NSLog(@"%@",birthday);
                                                          NSLog(@"%@",relationship);
                                                      } else if ([error.userInfo[FBErrorParsedJSONResponseKey][@"body"][@"error"][@"type"] isEqualToString:@"OAuthException"]) {                                                           NSLog(@"The facebook session was invalidated");
                                                          //we need to login the user here by pressing the login button programatically
                                                      } else {
                                                          NSLog(@"Some other error: %@", error);
                                                      }
                                                  }];
                                              }
                                          }];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facebookLogin:(id)sender {
    // The permissions requested from the user
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils initializeFacebook];
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }	
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
        } else {
            NSLog(@"User with facebook logged in!");
        }
    }];
}

- (IBAction)logoutFacebook:(id)sender {
    [PFUser logOut];
    NSLog(@"User logged out");
}

- (IBAction)twitterLogin:(id)sender {
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        NSLog(@"%@",error);
        if (!user) {
            NSLog(@"%@", user);
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
            return;
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in with Twitter!");
        } else {
            NSLog(@"User logged in with Twitter!");
        }     
    }];
}
@end
