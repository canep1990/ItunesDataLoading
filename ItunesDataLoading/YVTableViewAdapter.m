//
//  YVTableViewAdapter.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVTableViewAdapter.h"

static NSString *const kTableViewReuseIdentifier = @"ReuseIdentifier";

@interface YVTableViewAdapter () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *displayArray;

@end

@implementation YVTableViewAdapter

- (instancetype)init
{
    if (self = [super init])
    {
        self.displayArray = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark -  Table view delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRowsToReturn = 0;
    if (self.displayArray)
    {
        numberOfRowsToReturn = self.displayArray.count;
    }
    return numberOfRowsToReturn;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewReuseIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kTableViewReuseIdentifier];
    }
    return cell;
}

@end
