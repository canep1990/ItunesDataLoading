//
//  YVItunesSongsLoader.h
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Protocol. Notifies the receiver about the loading process */
@protocol YVItunesSongsLoaderDelegate <NSObject>

- (void)didLoadDataArray:(NSArray *)array;
- (void)didFailToLoadData:(NSString *)error;

@end

/** Class for loading itunes songs */
@interface YVItunesSongsLoader : NSObject

/** Delegate property */
@property (weak, nonatomic) id <YVItunesSongsLoaderDelegate> delegate;

/** 
 Method for downloading the data
 @param offset Offset for loading different songs
 */
- (void)loadSongsWithOffset:(NSUInteger)offset;

@end