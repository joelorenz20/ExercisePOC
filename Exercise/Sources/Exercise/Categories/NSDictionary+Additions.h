//
//  NSDictionary+Additions.h
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/9/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

- (BOOL)containsKey:(NSString *)key;
- (NSDictionary *)dictionaryByReplacingNullWithEmptyStrings;

@end
