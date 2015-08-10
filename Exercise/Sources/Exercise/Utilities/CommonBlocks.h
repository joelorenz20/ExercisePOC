//
//  CommonBlocks.h
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/9/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

//-----> Client Request Blocks
typedef void(^ClientRequestSuccessBlock)(id results);
typedef void(^InvalidRequestBlock)(id errorInfo);
typedef void(^ClientRequestErrorBlock)(NSError *error);

//-----> Common used bloks
typedef void(^SuccessBlock)(void);
typedef void(^InvalidBlock)(id);
typedef void(^FailedBlock)(void);

typedef void(^SuccessBlockWithObject)(id obj);
typedef void(^FailedBlockWithObject)(id obj);

typedef void(^CompleteBlock)(void);

