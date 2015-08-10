//
//  ExerciseRequestor.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "ExerciseRequestor.h"
#import "ExerciseAPIClient.h"
#import "Fact.h"

@implementation ExerciseRequestor

#pragma mark - (URI)
static NSString * const kFactsFeedURI = @"facts.json";

#pragma mark - Override Alloc
/*
 This will prevent allocating this static class
 */
+ (id)allocWithZone:(NSZone *)zone
{
    [NSException raise:@"Cannot be instantiated!"
                format:@"Static class '%@' cannot be instantiated!", NSStringFromClass([self class])];
    
    return nil;
}


#pragma mark - (Fact)
#pragma - Fetch Feed

+ (void)fetchFeed:(SuccessBlockWithObject)successBlock
           failed:(FailedBlockWithObject)failedBlock
{
    [[ExerciseAPIClient sharedClient]
     GET:kFactsFeedURI
     parameters:nil
     success:^(NSURLSessionDataTask *task, id responseObject) {
         NSLog(@"Response Log: %@", responseObject);
         
         NSArray *rows = [responseObject valueForKeyPath:@"rows"];
         
         if ([rows isKindOfClass:[NSArray class]] && [rows count]>0)
         {
             NSMutableArray *facts = [NSMutableArray array];
             for (NSDictionary *rawData in rows)
             {
                 Fact *fact = [[Fact alloc] initWithRawJSON:rawData];
                 
                 [facts addObjectIfNotNil:fact];
             }
             
             successBlock(facts);
         }
         else if (failedBlock != nil)
         {
             failedBlock(@"Something went wrong.");
         }
         
     } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failedBlock != nil)
         {
             NSInteger code      = (long)[(NSHTTPURLResponse *)task.response statusCode];
             NSString *errorInfo = [NSString stringWithFormat:@"error code %ld", (long)code];
             failedBlock(errorInfo);
         }
     }];
}

@end
