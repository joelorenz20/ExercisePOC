//
//  CellDataSource.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "CellDataSource.h"
#import "IConfigurableCell.h"

@interface CellDataSource ()

@property (strong,  nonatomic) NSMutableArray *dataSource;
@property (copy,    nonatomic) NSString *cellIdentifier;
@property (copy,    nonatomic) NSString *cellClass;
@property (copy,    nonatomic) CellConfigureBlock  configureBlock;

@end

@implementation CellDataSource

- (id)initWithCellClass:(NSString *)aCellClass
         cellIdentifier:(NSString *)aCellIdentifier
          configureCellBlock:(CellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self != nil)
    {
        _dataSource     = [[NSMutableArray alloc] init];
        _cellIdentifier = aCellIdentifier;
        _cellClass      = aCellClass;
        _configureBlock = aConfigureCellBlock;
    }
    
    return self;
}

#pragma mark - Functionalities
- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataSource[indexPath.row];
}

- (void)tableView:(UITableView *)tableView addItem:(id)anItem
{
    [self.dataSource addObject:anItem];
    
    NSInteger   index       = [self.dataSource indexOfObject:anItem];
    NSIndexPath *indexPath  = [NSIndexPath indexPathForItem:index inSection:0];
    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}

- (void)tableView:(UITableView *)tableView addItems:(NSArray *)items
{
    [self.dataSource addObjectsFromArray:items];
    
    [tableView reloadDataAnimated];
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView loadCustomCellWithNibName:self.cellClass
                                                      identifier:self.cellIdentifier];
    self.configureBlock(cell, indexPath, self.dataSource[indexPath.row]);
    
    return cell;
}

@end
