//
//  InitialSlidingViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/25/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "InitialSlidingViewController.h"

@implementation InitialSlidingViewController
@synthesize navBar;
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait)
        return YES;
    return NO;
}
-(void)viewDidLoad
{
    [[self navItem]setTitle:@"SeldenMap"];
    //[self navBar]setBackgroundImage:<#(UIImage *)#> forBarMetrics:<#(UIBarMetrics)#>
}

- (void)viewDidUnload {
    [self setNavBar:nil];
    [self setNavItem:nil];
    [super viewDidUnload];
}
@end
