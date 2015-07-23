//
//  YVItunesSongsLoader.m
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVItunesSongsLoader.h"
#import <AFNetworking/AFNetworking.h>
#import "YVItunesModel.h"

@implementation YVItunesSongsLoader

- (void)loadSongsWithOffset:(NSUInteger)offset
{
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=the%20doors&country&limit=20&offset=%d", offset];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *downloadedArray = [[NSMutableArray alloc] init];
        NSDictionary *allData = responseObject;
        NSInteger resultCount = [[allData objectForKey:@"resultCount"] integerValue];
        if (self.delegate)
        {
            if (resultCount > 0)
            {
                NSArray *songsJSON = [allData objectForKey:@"results"];
                for (NSDictionary *jsonObject in songsJSON)
                {
                    YVItunesModel *model = [[YVItunesModel alloc] initWithDictionary:jsonObject];
                    [downloadedArray addObject:model];
                }
                [self.delegate didLoadDataArray:downloadedArray];
            }
            else
            {
                [self.delegate didFailToLoadData:NSLocalizedString(@"No more songs found", nil)];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (self.delegate) [self.delegate didFailToLoadData:error.localizedDescription];
    }];
}

@end
