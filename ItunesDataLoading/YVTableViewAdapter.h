//
//  YVTableViewAdapter.h
//  ItunesDataLoading
//
//  Created by Юрий Воскресенский on 23.07.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

/** Adapter class for table view */
@interface YVTableViewAdapter : NSObject

/** Property for newly loaded array */
@property (copy, nonatomic) NSArray *loadedItunesModelsArray;

@end
