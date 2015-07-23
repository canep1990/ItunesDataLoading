//
//  YVItunesSongsLoader.h
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YVItunesSongsLoaderDelegate <NSObject>

- (void)didLoadDataArray:(NSArray *)array;
- (void)didFailToLoadData:(NSString *)error;

@end

@interface YVItunesSongsLoader : NSObject

@property (weak, nonatomic) id <YVItunesSongsLoaderDelegate> delegate;

- (void)loadSongsWithOffset:(NSUInteger)offset;

@end