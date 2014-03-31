//
//  SignInViewController.m
//  Vibesify
//
//  Created by Kiril on 3/9/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "SignInViewController.h"
#import "Utils.h"
#import <Parse/Parse.h>

@interface SignInViewController ()

@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *password;
@property (weak, nonatomic) IBOutlet UILabel *orLabel;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordButton;

@end

@implementation SignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    self.navigationController.navigationBar.barTintColor = [Utils colorWithR:17 G:24 B:34 A:1];
    self.navigationController.navigationBar.translucent = YES;
    
	[self.username setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [self.password setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [self.orLabel setFont:[Utils fontWithName:@"OpenSans-Italic" andSize:16]];
    [self.signInButton.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [self.forgotPasswordButton.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    
    [Utils setBottomBorderWithHeight:1 andColorOfView:self.usernameTextField borderColor:[Utils colorWithR:0 G:0 B:0 A:1]];
    [Utils setBottomBorderWithHeight:1 andColorOfView:self.passwordTextField borderColor:[Utils colorWithR:0 G:0 B:0 A:1]];
    
    [self.signUpButton setTitleTextAttributes:@{
                                         NSFontAttributeName: [Utils fontWithName:@"OpenSans" andSize:14],
                                         NSForegroundColorAttributeName: [UIColor colorWithRed:192 green:198 blue:204 alpha:1]
                                         } forState:UIControlStateNormal];
    
    [Utils addCustomBackButton:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void) textFieldDidBeginEditing:(UITextField *)textField{
    [Utils setBottomBorderWithHeight:1 andColorOfView:textField borderColor:[Utils colorWithR:112 G:192 B:102 A:1]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [Utils setBottomBorderWithHeight:1 andColorOfView:textField borderColor:[Utils colorWithR:0 G:0 B:0 A:1]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)signInButtonPressed:(id)sender {
    
    [self performSegueWithIdentifier:@"VibesList" sender:self];
//    if([self.usernameTextField.text isEqualToString:@""]){
//        [Utils showEmptyFieldValidationAlert:@"Username"];
//    } else if ([self.passwordTextField.text isEqualToString:@""]){
//        [Utils showEmptyFieldValidationAlert:@"Password"];
//    } else{
//        [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text
//                                    block:^(PFUser *user, NSError *error) {
//                                        if (user) {
//                                            NSLog(@"success");
//                                        } else {
//                                            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!" message:@"Invalid login credentials" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                                            [alert show];
//                                        }
//                                    }];
//    }
}
- (IBAction)facebookButtonPressed:(id)sender {
    NSArray *permissionsArray = @[ @"user_birthday", @"user_location"];
    
    [PFFacebookUtils initializeFacebook];
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            if (!error) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!" message:@"Facebook login request cancelled" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            } else {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!" message:@"Unable to process your facebook login request" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        } else if (user.isNew) {
          //navigate to tutorial view its new user
            NSLog(@"User with facebook signed up and logged in!");
        } else {
            //navigate to initial view user already registered before/returning user
            NSLog(@"User with facebook logged in!");
        }
    }];

}
- (IBAction)twitterButtonPressed:(id)sender {
    NSLog(@"Twitter");
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Erro!" message:@"Unable to process your twitter login request" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            return;
        } else if (user.isNew) {
            //navigate to tutorial view as it is a new user
            NSLog(@"User signed up and logged in with Twitter!");
        } else {
            //navigate to inital view as the user is already registered with us
            NSLog(@"User logged in with Twitter!");
        }     
    }];
}

@end
