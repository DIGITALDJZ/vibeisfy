//
//  Utils.h
//  Vibesify
//
//  Created by Kiril on 3/10/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;

+ (void)setBottomBorderWithHeight:(int)height andColorOfView:(UIView *)view borderColor:(UIColor *)borderColor;
+ (CALayer *)getBottomBorderWithHeight:(int)height andColorOfView:(UIView *)view borderColor:(UIColor *)borderColor;
+ (void)addCustomBackButton:(UIViewController *)viewController;
+ (void)showEmptyFieldValidationAlert:(NSString *)field;
+ (void)addFontAwesomeIconToLabel:(UILabel *)label withString:(NSString *)icon andSize:(CGFloat)fontSize;
+ (UIFont *)fontWithName:(NSString *)name andSize:(CGFloat)fontSize;


@end
