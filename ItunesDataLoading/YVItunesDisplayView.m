//
//  YVItunesDisplayView.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVItunesDisplayView.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <SVPullToRefresh/SVPullToRefresh.h>

@interface YVItunesDisplayView ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet YVTableViewAdapter *tableAdapter;

@end

@implementation YVItunesDisplayView

- (void)awakeFromNib
{
    __weak YVItunesDisplayView *weakSelf = self;
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadMoreData];
    }];
}

- (void)updateTableViewWithLoadedData:(NSArray *)loadedData
{
    self.tableAdapter.loadedItunesModelsArray = loadedData;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView.infiniteScrollingView stopAnimating];
}

- (void)loadMoreData
{
    if (self.delegate)
    {
        [self.delegate needsToLoadMoreData];
    }
}

@end
