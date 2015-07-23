//
//  YVItunesModel.h
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YVItunesModel : NSObject

@property (strong, nonatomic) NSURL *imageURL;
@property (copy, nonatomic) NSString *songName;
@property (copy, nonatomic) NSString *artistName;

@end
