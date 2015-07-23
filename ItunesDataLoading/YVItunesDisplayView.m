//
//  YVItunesDisplayView.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVItunesDisplayView.h"

@interface YVItunesDisplayView ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YVItunesDisplayView

- (void)awakeFromNib
{
    
}

- (void)updateTableViewWithLoadedData:(NSArray *)loadedData
{
    self.tableAdapter.loadedItunesModelsArray = loadedData;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
