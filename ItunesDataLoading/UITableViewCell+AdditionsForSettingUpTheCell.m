//
//  UITableViewCell+AdditionsForSettingUpTheCell.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "UITableViewCell+AdditionsForSettingUpTheCell.h"

@implementation UITableViewCell (AdditionsForSettingUpTheCell)

- (void)configureCell:(YVItunesModel *)model
{
    self.textLabel.text = model.songName;
    self.detailTextLabel.text = model.artistName;
}

@end
