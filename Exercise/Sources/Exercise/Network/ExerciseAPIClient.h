//
//  ExerciseAPIClient.h
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface ExerciseAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
