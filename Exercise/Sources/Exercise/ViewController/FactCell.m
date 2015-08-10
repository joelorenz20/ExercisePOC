//
//  FactCell.m
//  Exercise
//
//  Created by Joe Lorenz Florentino on 8/8/15.
//  Copyright (c) 2015 Joe Lorenz Florentino. All rights reserved.
//

#import "FactCell.h"
#import "Fact.h"

NSString * const FactCell_Identifier = @"FactCell_Identifier";

@interface FactCell ()

@property (weak, nonatomic) IBOutlet UIImageView *factImgView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *factDescription;

@end

@implementation FactCell

@synthesize indexPath;

- (void)awakeFromNib
{
    // Initialization code
}


- (void)configureCellWithObject:(Fact *)fact
                    atIndexPath:(NSIndexPath *)indexPath
                       delegate:(id)delegate
{
    RAC(self.title, text)           = [[RACObserve(fact, title)
                                        takeUntil:self.rac_prepareForReuseSignal]
                                        distinctUntilChanged];
    
    RAC(self.factDescription, text) = [[RACObserve(fact, factDescription)
                                        takeUntil:self.rac_prepareForReuseSignal]
                                        distinctUntilChanged];
    
    RAC(self.factImgView, image)    = [RACObserve(fact, image)
                                       takeUntil:self.rac_prepareForReuseSignal];
    
    [self loadImage:fact];
}

- (void)loadImage:(Fact *)fact
{
    if (fact.image == nil)
    {
        if ([fact sourcePathIsValidForDownload])
        {
            [[self factImgView]
             setImageWithURLRequest:[fact imageURLRequest]
             placeholderImage:[UIImage imageNamed:@"placeholder"]
             success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                 if (image != nil)
                 {
                     fact.image = image;
                 }
             } failure:nil];
        }
        else
        {
            self.factImgView.image = [UIImage imageNamed:@"noImage"];
        }
    }
}

@end
