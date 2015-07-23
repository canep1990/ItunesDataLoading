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

/** Protocol. Notifies when to load more data */
@protocol YVItunesDisplayViewDelegate <NSObject>

- (void)needsToLoadMoreData;

@end

/** View class that displays itune songs data */
@interface YVItunesDisplayView : YVBaseView

/** Delegate property */
@property (weak, nonatomic) id <YVItunesDisplayViewDelegate> delegate;

/** Helper method for updating data */
- (void)updateTableViewWithLoadedData:(NSArray *)loadedData;

@end
