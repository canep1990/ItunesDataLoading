//
//  YVItunesDisplayViewController.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVItunesDisplayViewController.h"
#import "YVItunesDisplayView.h"

@interface YVItunesDisplayViewController ()

@end

@implementation YVItunesDisplayViewController

- (void)loadView
{
    YVItunesDisplayView *view = [[YVItunesDisplayView alloc] init];
    self.view = view;
}

- (void)viewDidLoad
{
    self.title = NSLocalizedString(@"Itunes Songs", nil);
}

@end