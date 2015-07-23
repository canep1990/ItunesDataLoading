//
//  YVItunesDisplayView.h
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVBaseView.h"
#import "YVTableViewAdapter.h"

@interface YVItunesDisplayView : YVBaseView

@property (strong, nonatomic) IBOutlet YVTableViewAdapter *tableAdapter;

- (void)updateTableViewWithLoadedData:(NSArray *)loadedData;

@end
