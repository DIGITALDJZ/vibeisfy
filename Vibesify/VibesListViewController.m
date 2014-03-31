//
//  VibesListViewController.m
//  Vibesify
//
//  Created by Kiril on 3/29/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "VibesListViewController.h"
#import "Utils.h"
#import "VibeTableViewCell.h"


@interface VibesListViewController ()
{
    CALayer *areaBorderLayer;
    CALayer *friendsBorderLayer;
    UIColor *lightGreenColor;
    UIColor *lightGreyColor;
    UIColor *darkGreyColor;
    UIColor *blackColor;
    UIColor *sortBorderColor;
    UIColor *sortButtonTextColor;
    BOOL isAreaButton;
}

@property (weak, nonatomic) IBOutlet UIButton *areaButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *friendsButtonOutlet;
@property (weak, nonatomic) IBOutlet UILabel *areaIcon;
@property (weak, nonatomic) IBOutlet UILabel *friendsIcon;
@property (weak, nonatomic) IBOutlet UIButton *timeButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *distanceButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *attendanceButtonOutlet;
@property (weak, nonatomic) IBOutlet UILabel *timeBorder;
@property (weak, nonatomic) IBOutlet UILabel *distanceBorder;
@property (weak, nonatomic) IBOutlet UILabel *attendenceBorder;
@property (weak, nonatomic) IBOutlet UITableView *vibesList;

@end
@implementation VibesListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.barTintColor = [Utils colorWithR:17 G:24 B:34 A:1];
    self.navigationController.navigationBar.translucent = YES;

    isAreaButton = YES;
    
    lightGreenColor = [Utils colorWithR:112 G:192 B:102 A:1];
    darkGreyColor = [Utils colorWithR:37 G:44 B:52 A:1];
    lightGreyColor = [Utils colorWithR:133 G:141 B:149 A:1];
    blackColor = [Utils colorWithR:18 G:22 B:26 A:1];
    sortBorderColor = [Utils colorWithR:33 G:40 B:48 A:1];
    sortButtonTextColor = [Utils colorWithR:180 G:186 B:192 A:1];
    
    areaBorderLayer = [Utils getBottomBorderWithHeight:2 andColorOfView:self.areaButtonOutlet borderColor:lightGreenColor];
    friendsBorderLayer = [Utils getBottomBorderWithHeight:2 andColorOfView:self.friendsButtonOutlet borderColor:darkGreyColor];
    
    [self.areaButtonOutlet.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [self.friendsButtonOutlet.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    
    [Utils addFontAwesomeIconToLabel:self.areaIcon withString:@"fa-map-marker" andSize:24 ];
    [Utils addFontAwesomeIconToLabel:self.friendsIcon withString:@"fa-user" andSize:24];
    
    self.areaIcon.textColor = lightGreenColor;
    self.friendsIcon.textColor = lightGreyColor;
    
    self.timeBorder.backgroundColor = lightGreenColor;
    [self.timeButtonOutlet setTitleColor:lightGreenColor forState:UIControlStateNormal];
    
    [self.timeButtonOutlet.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    [self.distanceButtonOutlet.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    [self.attendanceButtonOutlet.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    
    [self setAreaButton:isAreaButton];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleCellIdentifier = @"VibeCell";
    
    VibeTableViewCell *cell = (VibeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleCellIdentifier];
    
    if (cell == nil) {
        cell = [[VibeTableViewCell alloc] init];
    }
    
    cell.description.text = @"asdfafas";
    
    return cell;
}

- (IBAction)timeButtonPressed:(id)sender {
    self.timeBorder.backgroundColor = lightGreenColor;
    [self.timeButtonOutlet setTitleColor:lightGreenColor forState:UIControlStateNormal];
    
    self.distanceBorder.backgroundColor = sortBorderColor;
    [self.distanceButtonOutlet setTitleColor:sortButtonTextColor forState:UIControlStateNormal];
    
    self.attendenceBorder.backgroundColor = sortBorderColor;
    [self.attendanceButtonOutlet setTitleColor:sortButtonTextColor forState:UIControlStateNormal];
}

- (IBAction)distanceButtonPressed:(id)sender {
    self.distanceBorder.backgroundColor = lightGreenColor;
    [self.distanceButtonOutlet setTitleColor:lightGreenColor forState:UIControlStateNormal];
    
    self.timeBorder.backgroundColor = sortBorderColor;
    [self.timeButtonOutlet setTitleColor:sortButtonTextColor forState:UIControlStateNormal];
    
    self.attendenceBorder.backgroundColor = sortBorderColor;
    [self.attendanceButtonOutlet setTitleColor:sortButtonTextColor forState:UIControlStateNormal];
}
- (IBAction)attendenceButtonPressed:(id)sender {
    self.attendenceBorder.backgroundColor = lightGreenColor;
    [self.attendanceButtonOutlet setTitleColor:lightGreenColor forState:UIControlStateNormal];
    
    self.distanceBorder.backgroundColor = sortBorderColor;
    [self.distanceButtonOutlet setTitleColor:sortButtonTextColor forState:UIControlStateNormal];
    
    self.timeBorder.backgroundColor = sortBorderColor;
    [self.timeButtonOutlet setTitleColor:sortButtonTextColor forState:UIControlStateNormal];
}

- (IBAction)newVibeButtonPressed:(id)sender {
}

- (IBAction)areaButtonPressed:(id)sender {
    isAreaButton = YES;
    [self setAreaButton:isAreaButton];
}

- (IBAction)friendsButtonPressed:(id)sender {
    isAreaButton = NO;
    [self setAreaButton:isAreaButton];
}

- (void)changePressedButtonState:(UIButton *)button {
    button.backgroundColor = blackColor;
    button.titleLabel.textColor = lightGreenColor;
}

- (void)resetButtonState:(UIButton *)button {
    button.backgroundColor = darkGreyColor;
    button.titleLabel.textColor = lightGreyColor;
}

- (void)setAreaButton:(BOOL)isAreaButtonPressed {
    if (isAreaButtonPressed) {
        areaBorderLayer.borderColor = [lightGreenColor CGColor];
        friendsBorderLayer.borderColor = [darkGreyColor CGColor];
        [self changePressedButtonState:self.areaButtonOutlet];
        [self resetButtonState:self.friendsButtonOutlet];
        self.areaIcon.textColor = lightGreenColor;
        self.friendsIcon.textColor = lightGreyColor;
    } else {
        friendsBorderLayer.borderColor = [lightGreenColor CGColor];
        areaBorderLayer.borderColor = [darkGreyColor CGColor];
        [self changePressedButtonState:self.friendsButtonOutlet];
        [self resetButtonState:self.areaButtonOutlet];
        self.areaIcon.textColor = lightGreyColor;
        self.friendsIcon.textColor = lightGreenColor;
    }
}

@end
