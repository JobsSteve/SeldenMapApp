//
//  MapPopover.m
//  SeldenMap
//
//  Created by Corey Zanotti on 10/19/12.
//
//

#import "MapPopover.h"

@implementation MapPopover
@synthesize  sender;
-(id)initWithContentViewController:(UIViewController *)viewController sender:(UIButton *)senderButton
{
    self = [super initWithContentViewController:viewController];
    if (self)
    {
        [self setSender:senderButton];
    }
    return self;
}
@end
