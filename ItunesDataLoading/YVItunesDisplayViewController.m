//
//  YVItunesDisplayViewController.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVItunesDisplayViewController.h"
#import "YVItunesDisplayView.h"
#import "YVItunesSongsLoader.h"
#import <MBProgressHUD/MBProgressHUD.h>

NSUInteger const kDefaultDownloadOffset = 20;

@interface YVItunesDisplayViewController () <YVItunesSongsLoaderDelegate, YVItunesDisplayViewDelegate>

@property (strong, nonatomic) YVItunesSongsLoader *loader;
@property (nonatomic) NSUInteger offsetFactor;

@end

@implementation YVItunesDisplayViewController

- (void)loadView
{
    YVItunesDisplayView *view = [[YVItunesDisplayView alloc] init];
    view.delegate = self;
    self.view = view;
}

- (void)viewDidLoad
{
    self.title = NSLocalizedString(@"Itunes Songs", nil);
    self.loader = [[YVItunesSongsLoader alloc] init];
    self.loader.delegate = self;
    self.offsetFactor = 1;
    [self loadData];
}

- (void)loadData
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSUInteger offset = kDefaultDownloadOffset * self.offsetFactor;
    [self.loader loadSongsWithOffset:offset];
}

#pragma mark - YVItunesDisplayViewDelegate

- (void)needsToLoadMoreData
{
    [self loadData];
}

#pragma mark - YVItunesSongsLoaderDelegate

- (void)didFailToLoadData:(NSString *)error
{
    NSLog(@"error: %@", error);
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)didLoadDataArray:(NSArray *)array
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    self.offsetFactor ++;
    YVItunesDisplayView *view = (YVItunesDisplayView *)self.view;
    [view updateTableViewWithLoadedData:array];
}

@end