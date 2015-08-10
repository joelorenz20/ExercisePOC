//
//  IConfigurableCell.h
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IConfigurableCell <NSObject>

@property (strong, nonatomic) NSIndexPath *indexPath;

- (void)configureCellWithObject:(id)object
                    atIndexPath:(NSIndexPath *)indexPath
                       delegate:(id)delegate;

@optional
- (void)setCellDelegate:(id)delegate;

@end
