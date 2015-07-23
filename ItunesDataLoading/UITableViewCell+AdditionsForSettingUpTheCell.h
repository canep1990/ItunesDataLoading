//
//  UITableViewCell+AdditionsForSettingUpTheCell.h
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVItunesModel.h"

@interface UITableViewCell (AdditionsForSettingUpTheCell)

- (void)configureCell:(YVItunesModel *)model;

@end
