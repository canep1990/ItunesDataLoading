//
//  YVItunesModel.h
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Custom model class for getting needed data from itunes */
@interface YVItunesModel : NSObject

// Properties for displaying data

@property (strong, nonatomic) NSURL *imageURL;
@property (copy, nonatomic) NSString *songName;
@property (copy, nonatomic) NSString *artistName;

/** Create itune model from dictionary */
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
