//
//  NewVIbeViewController.m
//  Vibesify
//
//  Created by Kiril on 4/2/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "NewVIbeViewController.h"
#import "Utils.h"
#import <Parse/Parse.h>

@interface NewVIbeViewController ()
{
    BOOL isDescriptionEdited;
}
@property (weak, nonatomic) IBOutlet UILabel *vibeTextLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *vibeDescriptionTextLengthLabel;

@end

@implementation NewVIbeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.descriptionTextView.delegate = self;
    isDescriptionEdited = NO;
    
    self.descriptionTextView.font = [Utils fontWithName:@"OpenSans" andSize:13];
    [self.vibeTextLabel setFont: [Utils fontWithName:@"OpenSans" andSize:13]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void) textViewDidBeginEditing:(UITextField *)textView{
    //detect which text view is edited
    if(!isDescriptionEdited){
        self.descriptionTextView.text = nil;
        self.vibeDescriptionTextLengthLabel.text = [NSString stringWithFormat:@"%d", 160];
        isDescriptionEdited = YES;
    }
}

- (void)textViewDidEndEditing:(UITextField *)textView{
    [Utils setBottomBorderWithHeight:1 andColorOfView:textView borderColor:[Utils colorWithR:0 G:0 B:0 A:1]];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    int textLength = textView.text.length + (text.length - range.length);
    int remaining = 160 - textLength;
    self.vibeDescriptionTextLengthLabel.text = [NSString stringWithFormat:@"%d", remaining];
    return  textLength<= 159;
}

- (IBAction)submit:(id)sender {
    for (int i=0; i<300; i++) {
        PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
        gameScore[@"score"] = @1337;
        gameScore[@"playerName"] = @"Sean Plott";
        gameScore[@"cheatMode"] = @NO;
        [gameScore saveInBackground];
    }
}



@end
