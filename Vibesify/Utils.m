//
//  Utils.m
//  Vibesify
//
//  Created by Kiril on 3/10/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "Utils.h"
#import "NSString+FontAwesome.h"
#import "UIFont+FontAwesome.h"

static UIViewController* currentController;

@implementation Utils

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [UIColor colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:alpha];
}

+ (void)setBottomBorderWithHeight:(int)height andColorOfView:(UIView *)view borderColor:(UIColor *)borderColor{
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderColor = borderColor.CGColor;
    bottomBorder.borderWidth = height;
    bottomBorder.frame = CGRectMake(0, view.frame.size.height-height, view.frame.size.width, height);
    
    [view.layer addSublayer:bottomBorder];
}

+ (CALayer *)getBottomBorderWithHeight:(int)height andColorOfView:(UIView *)view borderColor:(UIColor *)borderColor{
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderColor = borderColor.CGColor;
    bottomBorder.borderWidth = height;
    bottomBorder.frame = CGRectMake(0, view.frame.size.height-height, view.frame.size.width, height);
    
    [view.layer addSublayer:bottomBorder];
    return bottomBorder;
}

+ (void)addCustomBackButton:(UIViewController *)viewController {
    currentController = [[UIViewController alloc] init];
    currentController = viewController;
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 68.0f, 31.0f)];
    UIImage *backImage = [UIImage imageNamed:@"vibesify_navigation.png"];
    [backButton setBackgroundImage:backImage  forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(navigateBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    viewController.navigationItem.leftBarButtonItem = backButtonItem;
}

+ (void)navigateBack {
    [currentController.navigationController popViewControllerAnimated:YES];
}

+ (void)showEmptyFieldValidationAlert:(NSString *)field{
    NSMutableString *title = [[NSMutableString alloc]initWithString:@"Empty  field!"];
    NSMutableString *message =[[NSMutableString alloc]initWithString:@" field cannot be empty."];
    [title insertString:[field lowercaseString] atIndex:6];
    [message insertString:field atIndex:0];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

+ (void)addFontAwesomeIconToLabel:(UILabel *)label withString:(NSString *)icon andSize:(CGFloat)fontSize{
    label.font = [UIFont fontWithName:kFontAwesomeFamilyName size:fontSize];
    label.text = [NSString fontAwesomeIconStringForIconIdentifier:icon];
}

+ (UIFont *)fontWithName:(NSString *)name andSize:(CGFloat)fontSize{
    return [UIFont fontWithName:name size:fontSize];
}



@end
