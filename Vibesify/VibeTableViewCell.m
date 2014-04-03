//
//  VibeTableViewCell.m
//  Vibesify
//
//  Created by Kiril on 3/29/14.
//  Copyright (c) 2014 vibesify. All rights reserved.
//

#import "VibeTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

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
    self.userAvatar.layer.cornerRadius = 20;
    self.vibeCategory.layer.cornerRadius = 20;
    
    self.userAvatar.layer.masksToBounds = YES;
    self.vibeCategory.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
