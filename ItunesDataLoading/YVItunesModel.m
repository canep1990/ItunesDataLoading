//
//  YVItunesModel.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVItunesModel.h"

@implementation YVItunesModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        NSString *artistName = [dict objectForKey:@"artistName"];
        NSString *songName = [dict objectForKey:@"trackName"];
        NSString *urlString = [dict objectForKey:@"artworkUrl60"];
        self.artistName = artistName;
        self.songName = songName;
        self.imageURL = [NSURL URLWithString:urlString];
    }
    return self;
}

@end
