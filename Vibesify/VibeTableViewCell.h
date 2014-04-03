//
//  VibeTableViewCell.h
//  Vibesify
//
//  Created by Kiril on 3/29/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VibeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UILabel *areaIconOutlet;
@property (weak, nonatomic) IBOutlet UILabel *areaDistance;
@property (weak, nonatomic) IBOutlet UILabel *attendanceIconOutlet;
@property (weak, nonatomic) IBOutlet UILabel *attedanceNumber;
@property (weak, nonatomic) IBOutlet UILabel *timeIconOutlet;
@property (weak, nonatomic) IBOutlet UILabel *timeCreated;
@property (weak, nonatomic) IBOutlet UIImageView *vibeCategory;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;

@end
