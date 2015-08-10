//
//  UITableView+Additions.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "UITableView+Additions.h"

@implementation UITableView (Additions)

- (id)loadCustomCellWithNibName:(NSString *)nibName
{
    return [self loadCustomCellWithNibName:nibName
                                identifier:nibName];
}

- (id)loadCustomCellWithNibName:(NSString *)nibName identifier:(NSString *)identifier
{
    id (^loadNibFromTopLevelObject)(NSString *) = ^(NSString *nibName) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        id topLevelObject        = [topLevelObjects count]>0 ? topLevelObjects[0] : nil;
        
        return topLevelObject;
    };
    
    UITableViewCell *cell = (UITableViewCell *)[self dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = loadNibFromTopLevelObject(nibName);
    }
    
    return cell;
}

- (void)reloadDataAnimated
{
    [self reloadData];
    
    CATransition *animation = [CATransition animation];
    [animation setType:kCATransitionFade];
    [animation setDuration:0.5];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFillMode:kCAFillModeForwards];
    
    [[self layer] addAnimation:animation
                        forKey:@"reloadAnimation"];
}

- (void)reloadDataWithCompletion:(void (^)(void))completionBlock {
    [self reloadData];
    if (completionBlock) {
        completionBlock();
    }
}


@end
