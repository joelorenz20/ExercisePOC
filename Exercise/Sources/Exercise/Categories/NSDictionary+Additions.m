//
//  NSDictionary+Additions.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/9/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (BOOL)containsKey:(NSString *)key
{
    BOOL retVal = 0;
    NSArray *allKeys = [self allKeys];
    retVal = [allKeys containsObject:key];
    return retVal;
}

- (NSDictionary *)dictionaryByReplacingNullWithEmptyStrings
{
    const NSMutableDictionary *replaced = [self mutableCopy];
    const NSString *emptyStr = @"";
    for(NSString *key in self)
    {
        const id object = [self valueForKey:key];
        if(object == [NSNull null])
        {
            [replaced setValue:emptyStr
                        forKey:key];
        }
    }
    
    return [replaced copy];
}

@end
