//
//  UITableViewCell+AdditionsForSettingUpTheCell.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "UITableViewCell+AdditionsForSettingUpTheCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation UITableViewCell (AdditionsForSettingUpTheCell)

- (void)configureCell:(YVItunesModel *)model
{
    self.textLabel.text = model.songName;
    self.detailTextLabel.text = model.artistName;
    __weak UITableViewCell *weakCell = self;
    [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:model.imageURL] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
    {
        weakCell.imageView.image = image;
        [weakCell setNeedsLayout];
    } failure:nil];
}

@end
