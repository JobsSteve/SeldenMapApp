//
//  InitialSlidingViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/25/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//
/*
    This class subclasses ECSSlidingViewController, implementing a custom presentation of the standard ECSSlidingViewController
 */

#import "ECSlidingViewController.h"

@interface InitialSlidingViewController : ECSlidingViewController
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UINavigationItem *navItem;


@end
