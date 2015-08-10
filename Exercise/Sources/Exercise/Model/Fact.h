//
//  Fact.h
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/9/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fact : NSObject

@property (copy, nonatomic, readonly)                       NSString *title;
@property (copy, nonatomic, readonly)                       NSString *factDescription;
@property (copy, nonatomic, readonly, getter=storagePath)   NSString *storage_path;

@property (strong, nonatomic) UIImage *image;


- (id)initWithRawJSON:(NSDictionary *)dictInfo;

- (NSURLRequest *)imageURLRequest;
- (BOOL)sourcePathIsValidForDownload;

@end
