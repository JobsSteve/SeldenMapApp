//
//  FirstTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "FirstTopViewController.h"
#import "ECSlidingViewController.h"

@implementation FirstTopViewController

@synthesize provinceViewController;
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    /*
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
    self.view.layer.shadowOpacity = 0;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
     */
     
    //attempting resize the view
    NSString *path = [[NSBundle mainBundle]pathForResource:@"drawerBackdrop" ofType:@"png"];
    UIImage *backdrop = [[UIImage alloc]initWithContentsOfFile:path];
    UIImageView *backdropView = [[UIImageView alloc]initWithImage:backdrop];
    [self.view addSubview:backdropView];
    self.view.frame = CGRectMake(0,0,768, 299);
    
    
    //SETTING UP THE CONTENT VIEW
    provinceViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ProvinceInformationView"];
    [[provinceViewController view] setFrame:CGRectMake(0, 0, 768, 299)];
    [[self view]addSubview: [provinceViewController view]];
        
    //SETTING UP THE TABBAR
    /*
    tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
    [tabBarController setCurrentState:NoState];
     
    [[tabBarController view] setFrame:CGRectMake(0, 0, 768, 300)];
    [self addChildViewController:tabBarController];
    [[self view] addSubview:[tabBarController view]];
    
    //Setting up the InformationViewController
    informationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InformationViewController"];
    [[informationViewController view] setFrame:CGRectMake(600, 0, 168, 400)];
    [tabBarController setPreviewController:informationViewController];
    [self addChildViewController:informationViewController];
    [[self view] addSubview:[informationViewController view]];
    */
    
    
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[UnderRightViewController class]]) {
        self.slidingViewController.underRightViewController = [[UnderRightViewController alloc]init];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

/*- (IBAction)revealMenu:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}*/
- (IBAction)revealUnderRight:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECLeft];
}

- (void)viewDidUnload {
    //[self setScrollView:nil];
    [super viewDidUnload];
}
@end