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

/** Value for default download offset */
NSUInteger const kDefaultDownloadOffset = 20;
static NSString * const kDefaultMessageTitle = @"Ошибка";

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
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(kDefaultMessageTitle, nil) message:error preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(kDefaultMessageTitle, nil) message:error delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
        [alert show];
    }
}

- (void)didLoadDataArray:(NSArray *)array
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    self.offsetFactor ++;
    YVItunesDisplayView *view = (YVItunesDisplayView *)self.view;
    [view updateTableViewWithLoadedData:array];
}

@end