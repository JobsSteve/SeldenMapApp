//
//  FirstTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//
/*
    Edited by Corey Zanotti on 10/8/12
    This class is responsible for managing the Details Menu
 */

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "UnderRightViewController.h"
#import "ProvinceInfoView.h"

@interface FirstTopViewController : UIViewController 

//- (IBAction)revealMenu:(id)sender;

//this view will need to be a subclass of scroll view with accessible methods to populate its subviews with information
//@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (strong, nonatomic) CustomTabBar *tabBarController;
//@property (strong, nonatomic) DrawerPreviewViewController *informationViewController;
//@property (strong, nonatomic) IBOutlet UITabBar *tabBar;
@property (strong, nonatomic) ProvinceInfoView *provinceViewController;


- (IBAction)revealUnderRight:(id)sender;

@end
