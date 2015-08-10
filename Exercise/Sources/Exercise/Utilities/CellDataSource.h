//
//  CellDataSource.h
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CellConfigureBlock)(id cell, NSIndexPath *indexPath, id item);

@interface CellDataSource : NSObject <UITableViewDataSource>

- (id)initWithCellClass:(NSString *)aCellClass
         cellIdentifier:(NSString *)aCellIdentifier
     configureCellBlock:(CellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView addItem:(id)anItem;
- (void)tableView:(UITableView *)tableView addItems:(NSArray *)items;

@end
