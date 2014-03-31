//
//  SignUpViewController.m
//  Vibesify
//
//  Created by Kiril on 3/10/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "SignUpViewController.h"
#import "Utils.h"
#import <Parse/Parse.h>
#import "InitialViewController.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signUpButtonOutlet;
@property (weak, nonatomic) IBOutlet UILabel *termsFirstLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *termsSecondLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *termsThirdLineLabel;
@property (weak, nonatomic) IBOutlet UIButton *termsButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *privacyButtonOutlet;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@end

@implementation SignUpViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.usernameLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [self.passwordLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [self.emailLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [self.termsFirstLineLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    [self.termsSecondLineLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    [self.termsThirdLineLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    
    [Utils setBottomBorderWithHeight:1 andColorOfView:self.usernameTextField borderColor:[Utils colorWithR:0 G:0 B:0 A:1]];
    [Utils setBottomBorderWithHeight:1 andColorOfView:self.passwordTextField borderColor:[Utils colorWithR:0 G:0 B:0 A:1]];
    [Utils setBottomBorderWithHeight:1 andColorOfView:self.emailTextField borderColor:[Utils colorWithR:0 G:0 B:0 A:1]];
    
    [self.signUpButtonOutlet.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [Utils addCustomBackButton:self];
    
    [self.termsButtonOutlet setAttributedTitle:[self addLinksToLabelWithText:@"Terms of Service"] forState:UIControlStateNormal];
    [self.privacyButtonOutlet setAttributedTitle:[self addLinksToLabelWithText:@"Privacy Policy"] forState:UIControlStateNormal];
}

- (NSMutableAttributedString *)addLinksToLabelWithText:(NSString *)text {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributeString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:(NSRange){0,[attributeString length]}];
    [attributeString addAttribute:NSForegroundColorAttributeName value:[Utils colorWithR:114 G:172 B:102 A:1] range:(NSRange){0,[attributeString length]}];
    [attributeString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"OpenSans" size:13] range:(NSRange){0,[attributeString length]}];
    
    return attributeString;
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
- (IBAction)signUpButtonPressed:(id)sender {
    PFUser *user = [PFUser user];
    if([self.usernameTextField.text isEqualToString:@""]){
        [Utils showEmptyFieldValidationAlert:@"Username"];
    } else if ([self.emailTextField.text isEqualToString:@""]){
        [Utils showEmptyFieldValidationAlert:@"Email"];
    } else if ([self.passwordTextField.text isEqualToString:@""]){
        [Utils showEmptyFieldValidationAlert:@"Password"];
    } else {
        
        user.username = self.usernameTextField.text;
        user.password = self.passwordTextField.text;
        user.email = self.emailTextField.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSLog(@"success");
                //navigate to vibes view
            } else {
                NSString *errorString = [error userInfo][@"error"];
                errorString = [NSString stringWithFormat:@"%@%@",[[errorString substringToIndex:1] uppercaseString],[errorString substringFromIndex:1]];
                errorString = [errorString stringByAppendingString:@"."];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];
    }
}
- (IBAction)privacyButtonPressed:(id)sender {

}
- (IBAction)termsButtonPressed:(id)sender {
}

@end
