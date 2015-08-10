//
//  ExerciseAPIClient.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "ExerciseAPIClient.h"

static NSString * const  kExerciseBaseURL = @"http://guarded-basin-2383.herokuapp.com";

@implementation ExerciseAPIClient

+ (instancetype)sharedClient
{
    static ExerciseAPIClient *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:kExerciseBaseURL];
        _sharedInstance = [[super allocWithZone:nil] initWithBaseURL:baseURL];
        _sharedInstance.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        
        [requestSerializer setValue:@"text/json" forHTTPHeaderField:@"Content-Type"];
        [requestSerializer setValue:@"text/json" forHTTPHeaderField:@"Accept"];
        [requestSerializer setValue:@"" forHTTPHeaderField:@"Accept-Encoding"];
        
        _sharedInstance.requestSerializer = requestSerializer;
        
    });
    
    return _sharedInstance;
}

/**
 -  The reason we override allocWithZone is because alloc calls allocWithZone passing nil as the zone 
    (for the default zone).
 
    To prevent rogue code from allocating and init-ializing another instance we override allocWithZone so
    that the instance passed back is the already initialized singleton. This prevents one from creating a
    second instance.
 */
+ (instancetype)allocWithZone:(NSZone *)zone
{
    return [self sharedClient];
}

@end
