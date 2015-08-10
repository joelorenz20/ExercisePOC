//
//  Fact.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/9/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "Fact.h"

@implementation Fact

- (id)initWithRawJSON:(NSDictionary *)dictInfo
{
    if ([dictInfo isKindOfClass:[NSDictionary class]])
    {
        if (dictInfo != nil && [dictInfo count] > 0)
        {
            self = [super init];
            if (self != nil)
            {
                NSDictionary *info = [dictInfo dictionaryByReplacingNullWithEmptyStrings];
                
                if ([info containsKey:@"title"])
                {
                    _title = info[@"title"];
                }
                if ([info containsKey:@"description"])
                {
                    _factDescription = [info objectForKey:@"description"];
                }
                if ([info containsKey:@"imageHref"])
                {
                    _storage_path = [info objectForKey:@"imageHref"];
                }
                
                _image = nil;
            }
            
            return self;
        }
    }
    
    return nil;
}

- (NSURLRequest *)imageURLRequest
{
    return [NSURLRequest requestWithURL:[NSURL URLWithString:self.storagePath]];
}

- (BOOL)sourcePathIsValidForDownload
{
    return !([self.storagePath length] == 0);
}

@end
