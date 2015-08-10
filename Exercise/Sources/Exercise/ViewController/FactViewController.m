//
//  FactViewController.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "FactViewController.h"
#import "AppDelegate.h"
#import "FeedService.h"
#import "CellDataSource.h"
#import "IConfigurableCell.h"
#import "FactCell.h"
#import "M13ProgressHUD.h"
#import "M13ProgressViewRing.h"

@interface FactViewController () <UITableViewDelegate>

@property (weak,    nonatomic) IBOutlet UITableView *tableView;

@property (strong,  nonatomic) FeedService    *service;
@property (strong,  nonatomic) CellDataSource *dataSource;
@property (strong,  nonatomic) M13ProgressHUD *hud;

@end

@implementation FactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Facts";
    
    self.service = FeedService.new;
    [self configureTableView];
    
    [self setHUD];
    [self loadFeed];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - (Configuration)
#pragma mark - TableView
- (void)configureTableView
{
    CellConfigureBlock configureBlock = ^(id<IConfigurableCell> cell, NSIndexPath *indexPath, id item) {
        [cell configureCellWithObject:item
                          atIndexPath:indexPath
                             delegate:nil];
    };
    
    self.dataSource = [[CellDataSource alloc] initWithCellClass:NSStringFromClass([FactCell class])
                                                 cellIdentifier:FactCell_Identifier
                                             configureCellBlock:[configureBlock copy]];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate   = self;
    
    self.tableView.estimatedRowHeight = 90.0;
    self.tableView.rowHeight          = UITableViewAutomaticDimension;
}

#pragma mark - Load Feed
- (void)loadFeed
{
    [self showActivityView];
    @weakify(self);
    [self.service fetchFactFeed:^(NSArray *facts) {
        @strongify(self);
        [self.dataSource tableView:self.tableView
                           addItems:facts];
        
        [self hideActivityView];
    } failed:^(NSString *errorMsg) {
        [self hideActivityView];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                        message:errorMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        
        [alert show];
    }];
}

#pragma mark - (TableView)
#pragma mark - Delegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    [cell setSeparatorInset:UIEdgeInsetsZero];
    
    // Prevent the cell from inheriting the Table View's margin settings
    [cell setPreservesSuperviewLayoutMargins:NO];
    
    // Explictly set your cell's layout margins
    [cell setLayoutMargins:UIEdgeInsetsZero];
}

#pragma mark - Activity View
- (void)setHUD
{
    self.hud = [[M13ProgressHUD alloc] initWithProgressView:[[M13ProgressViewRing alloc] init]];
    [self.hud setIndeterminate:YES];
    self.hud.progressViewSize = CGSizeMake(60.0, 60.0);
    self.hud.animationPoint = CGPointMake([UIScreen mainScreen].bounds.size.width / 2,
                                          [UIScreen mainScreen].bounds.size.height / 2);
    
    [self.view addSubview:self.hud];
}

- (void)showActivityView
{
    self.hud.status = @"Retrieving ...";
    [self.hud show:YES];
}

- (void)hideActivityView
{
    [self.hud dismiss:YES];
    [self.hud performAction:M13ProgressViewActionSuccess animated:YES];
    [self.hud performAction:M13ProgressViewActionNone animated:NO];
}

@end
