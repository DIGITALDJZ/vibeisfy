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
@property (weak, nonatomic) IBOutlet UIView *publishButtonView;
@property (weak, nonatomic) IBOutlet UILabel *publishButtonLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishButtonIcon;
@property (weak, nonatomic) IBOutlet UIView *cancelButtonView;
@property (weak, nonatomic) IBOutlet UILabel *cancelButtonLabel;
@property (weak, nonatomic) IBOutlet UILabel *cancelButtonIcon;

@end

@implementation NewVIbeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.descriptionTextView.delegate = self;
    isDescriptionEdited = NO;
    
    self.descriptionTextView.font = [Utils fontWithName:@"OpenSans" andSize:13];
    [self.vibeTextLabel setFont: [Utils fontWithName:@"OpenSans" andSize:13]];
    
    [self.publishButtonLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [Utils addFontAwesomeIconToLabel:self.publishButtonIcon withString:@"fa-plus" andSize:20];
    
    [self.cancelButtonLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [Utils addFontAwesomeIconToLabel:self.cancelButtonIcon withString:@"fa-times" andSize:20];
    
    UITapGestureRecognizer * publishButtonTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(publishButtonPressed:)];
    [self.publishButtonView addGestureRecognizer:publishButtonTap];
    
    UITapGestureRecognizer * cancelButtonTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelButtonPressed:)];
    [self.cancelButtonView addGestureRecognizer:cancelButtonTap];


    
    
    
    [self addBottomButtonBorders];
    
    
    
    
    
    
}

- (void)cancelButtonPressed:(UITapGestureRecognizer *)recognizer{
    NSLog(@"cancel button pressed");
}

- (void)publishButtonPressed:(UITapGestureRecognizer *)recognizer{
    NSLog(@"publish button pressed");
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

- (void)addBottomButtonBorders{
    CALayer *rightBorder = [CALayer layer];
    rightBorder.borderColor = [UIColor blackColor].CGColor;
    rightBorder.borderWidth = 1;
    rightBorder.frame = CGRectMake(self.publishButtonView.frame.size.width-1, self.publishButtonView.frame.size.height-47, 1,47);
    
    CALayer *leftBorder = [CALayer layer];
    leftBorder.borderColor = [Utils colorWithR:46 G:52 B:60 A:1].CGColor;
    leftBorder.borderWidth = 1;
    leftBorder.frame = CGRectMake(self.cancelButtonView.frame.size.width-160, self.cancelButtonView.frame.size.height-47, 1, 47);
    
    [self.publishButtonView.layer addSublayer:rightBorder];
    [self.cancelButtonView.layer addSublayer:leftBorder];
}

@end
