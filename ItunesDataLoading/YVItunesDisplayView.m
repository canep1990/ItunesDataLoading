//
//  YVItunesDisplayView.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVItunesDisplayView.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "YVTableFooterView.h"

@interface YVItunesDisplayView () <YVTableViewAdapterDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet YVTableViewAdapter *tableAdapter;

@end

@implementation YVItunesDisplayView

- (void)awakeFromNib
{
    self.tableAdapter.delegate = self;
    YVTableFooterView *footerView = [[YVTableFooterView alloc] init];
    [MBProgressHUD showHUDAddedTo:footerView animated:YES];
    self.tableView.tableFooterView = footerView;
    self.tableView.tableFooterView.hidden = YES;
    self.tableView.tableFooterView.alpha = 0.0f;
}

- (void)updateTableViewWithLoadedData:(NSArray *)loadedData
{
    self.tableView.tableFooterView.hidden = YES;
    self.tableView.tableFooterView.alpha = 0.0f;
    self.tableAdapter.loadedItunesModelsArray = loadedData;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)displayLoadingView
{
    self.tableView.tableFooterView.hidden = NO;
    self.tableView.tableFooterView.alpha = 1.0f;
}

- (void)loadMoreData
{
    if (self.delegate)
    {
        [self.delegate needsToLoadMoreData];
    }
}

@end
