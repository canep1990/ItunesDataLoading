//
//  YVTableViewAdapter.h
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@protocol YVTableViewAdapterDelegate <NSObject>

- (void)displayLoadingView;

- (void)loadMoreData;

@end

@interface YVTableViewAdapter : NSObject

@property (weak, nonatomic) id <YVTableViewAdapterDelegate> delegate;

@property (copy, nonatomic) NSArray *loadedItunesModelsArray;

@end
