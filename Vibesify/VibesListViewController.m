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
    UIColor *lightGreenColor;
    UIColor *lightGreyColor;
    UIColor *darkGreyColor;
    UIColor *blackColor;
    UIColor *sortBorderColor;
    UIColor *sortButtonTextColor;
}
@property (weak, nonatomic) IBOutlet UIView *areaButtonView;
@property (weak, nonatomic) IBOutlet UIView *friendsButtonView;
@property (weak, nonatomic) IBOutlet UIButton *createVibeButton;

@property (weak, nonatomic) IBOutlet UILabel *areaButtonLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaIconLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaBorderLabel;


@property (weak, nonatomic) IBOutlet UILabel *friendsButtonLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendsIconLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendsBorderLabel;

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
    
    lightGreenColor = [Utils colorWithR:112 G:192 B:102 A:1];
    darkGreyColor = [Utils colorWithR:37 G:44 B:52 A:1];
    lightGreyColor = [Utils colorWithR:133 G:141 B:149 A:1];
    blackColor = [Utils colorWithR:18 G:22 B:26 A:1];
    sortBorderColor = [Utils colorWithR:33 G:40 B:48 A:1];
    sortButtonTextColor = [Utils colorWithR:180 G:186 B:192 A:1];
    
    
    [self.areaButtonLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [Utils addFontAwesomeIconToLabel:self.areaIconLabel withString:@"fa-map-marker" andSize:20];
    
    [self.friendsButtonLabel setFont:[Utils fontWithName:@"OpenSans" andSize:14]];
    [Utils addFontAwesomeIconToLabel:self.friendsIconLabel withString:@"fa-user" andSize:20];
    
    
    self.timeBorder.backgroundColor = lightGreenColor;
    [self.timeButtonOutlet setTitleColor:lightGreenColor forState:UIControlStateNormal];
    
    [self.timeButtonOutlet.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    [self.distanceButtonOutlet.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    [self.attendanceButtonOutlet.titleLabel setFont:[Utils fontWithName:@"OpenSans" andSize:13]];
    
    UITapGestureRecognizer * areaButtonTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(areaButtonPressed:)];
    [self.areaButtonView addGestureRecognizer:areaButtonTap];
    
    UITapGestureRecognizer * friendsButtonTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(friendsButtonPressed:)];
    [self.friendsButtonView addGestureRecognizer:friendsButtonTap];
    
    [self.view bringSubviewToFront:_areaButtonView];
    [self.view bringSubviewToFront:_friendsButtonView];
    [self.view bringSubviewToFront:_createVibeButton];

    [self areaButtonPressed:nil];
    
}

- (void)areaButtonPressed:(UITapGestureRecognizer *)recognizer{
    self.areaButtonView.backgroundColor = blackColor;
    self.areaButtonLabel.textColor = lightGreenColor;
    self.areaIconLabel.textColor = lightGreenColor;
    self.areaBorderLabel.backgroundColor = lightGreenColor;
    
    self.friendsButtonView.backgroundColor = darkGreyColor;
    self.friendsButtonLabel.textColor = lightGreyColor;
    self.friendsIconLabel.textColor = lightGreyColor;
    self.friendsBorderLabel.backgroundColor = darkGreyColor;
}

- (void)friendsButtonPressed:(UITapGestureRecognizer *)recognizer{
    self.friendsButtonView.backgroundColor = blackColor;
    self.friendsButtonLabel.textColor = lightGreenColor;
    self.friendsIconLabel.textColor = lightGreenColor;
    self.friendsBorderLabel.backgroundColor = lightGreenColor;
    
    self.areaButtonView.backgroundColor = darkGreyColor;
    self.areaButtonLabel.textColor = lightGreyColor;
    self.areaIconLabel.textColor = lightGreyColor;
    self.areaBorderLabel.backgroundColor = darkGreyColor;
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
    
    cell.description.text = @"Test text for two lines appearance for description in tableViewCell label";
    
    return cell;
}

- (IBAction)createNewVibeButtonPressed:(id)sender {
    NSLog(@"test");
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

@end
