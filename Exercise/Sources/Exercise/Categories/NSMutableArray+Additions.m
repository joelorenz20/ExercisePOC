//
//  NSMutableArray+Additions.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/9/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "NSMutableArray+Additions.h"

@implementation NSMutableArray (Additions)

- (void)addObjectIfNotNil:(id)obj
{
    if (obj)
    {
        [self addObject:obj];
    }
}


@end
