//
//  FeedService.h
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedService : NSObject

- (void)fetchFactFeed:(SuccessBlockWithObject)successBlock
               failed:(FailedBlockWithObject)failedBlock;

@end
