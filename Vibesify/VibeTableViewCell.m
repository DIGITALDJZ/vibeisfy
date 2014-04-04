//
//  VibeTableViewCell.m
//  Vibesify
//
//  Created by Kiril on 3/29/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "VibeTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Utils.h"

@implementation VibeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    self.userAvatar.layer.cornerRadius = 22;
    self.vibeCategory.layer.cornerRadius = 22;
    
    self.userAvatar.layer.masksToBounds = YES;
    self.vibeCategory.layer.masksToBounds = YES;
    
    [self.description setFont:[Utils fontWithName:@"OpenSans" andSize:12]];
    [self.areaDistance setFont:[Utils fontWithName:@"OpenSans" andSize:10]];
    [Utils addFontAwesomeIconToLabel:self.areaIconOutlet withString:@"fa-map-marker" andSize:12];
    
    [self.attedanceNumber setFont:[Utils fontWithName:@"OpenSans" andSize:10]];
    [Utils addFontAwesomeIconToLabel:self.attendanceIconOutlet withString:@"fa-user" andSize:12];
    
    [self.timeCreated setFont:[Utils fontWithName:@"OpenSans" andSize:10]];
    [Utils addFontAwesomeIconToLabel:self.timeIconOutlet withString:@"fa-clock-o" andSize:12];
    
    
     
     
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
