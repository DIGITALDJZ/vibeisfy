//
//  ResetPasswordViewController.m
//  Vibesify
//
//  Created by Kiril on 3/18/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "Utils.h"
#import <Parse/Parse.h>

@interface ResetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIButton *resetPasswordButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.emailTextField.delegate = self;
    
	[self.emailLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [self.resetPasswordButton.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    
    [Utils setBottomBorderWithHeight:1 andColorOfView:self.emailTextField borderColor:[Utils colorWithR:0 G:0 B:0 A:1]];
    
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

- (IBAction)resetPasswordButtonPressed:(id)sender {
    [PFUser requestPasswordResetForEmailInBackground:self.emailTextField.text block:^(BOOL succeeded, NSError *error) {
        if(succeeded){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Email sent!" message:@"Reset password email was sent to your email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        if(error){
            NSInteger errorCode = [[error.userInfo valueForKey:@"code"] integerValue];
            if(errorCode == 125){
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid email!" message:@"You have entered invalid email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            } else if (errorCode == 205){
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No user found!" message:@"We were not able to find a user associated with this email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }
    }];

}

@end
