//
//  FeedService.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "FeedService.h"
#import "ExerciseRequestor.h"

@implementation FeedService

- (void)fetchFactFeed:(SuccessBlockWithObject)successBlock
               failed:(FailedBlockWithObject)failedBlock
{
    [ExerciseRequestor fetchFeed:[successBlock copy]
                          failed:[failedBlock copy]];
}

@end
