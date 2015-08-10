//
//  UITableView+Additions.h
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Additions)

- (id)loadCustomCellWithNibName:(NSString *)nibName;

- (id)loadCustomCellWithNibName:(NSString *)nibName identifier:(NSString *)identifier;

- (void)reloadDataAnimated;

- (void)reloadDataWithCompletion:(void (^)(void))completionBlock;

@end
