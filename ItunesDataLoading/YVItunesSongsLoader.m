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

@interface YVItunesSongsLoader()

@property (nonatomic) BOOL loading;

@end

@implementation YVItunesSongsLoader

- (void)loadSongsWithOffset:(NSUInteger)offset
{
    if (!self.loading)
    {
        self.loading = YES;
        NSString *urlString = [[NSString stringWithFormat:@"https://itunes.apple.com/search?term=thedoors&country&limit=20&offset=%lu", (unsigned long)offset] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
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
                    self.loading = NO;
                    [self.delegate didLoadDataArray:downloadedArray];
                }
                else
                {
                    self.loading = NO;
                    [self.delegate didFailToLoadData:NSLocalizedString(@"No more songs found", nil)];
                }
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            self.loading = NO;
            if (self.delegate) [self.delegate didFailToLoadData:error.localizedDescription];
        }];
    }
}

@end
