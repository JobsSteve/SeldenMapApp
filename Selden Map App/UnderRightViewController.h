//
//  UnderRightViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "FirstTopViewController.h"
#import "InterfaceAnimatedButton.h"

/*
    UnderRightViewController is responsible for dealing with the interface buttons and the map scrollview, which all are part of its subview. 
 */
@interface UnderRightViewController : UIViewController <UIScrollViewDelegate, ButtonDelegate>
{
    UIView *contentView;
    UIToolbar *interface;
    InterfaceAnimatedButton *portButton;
    InterfaceAnimatedButton *provinceButton;
}

@property (nonatomic, strong) UIScrollView *mapView;
/*
 What Map VC needs to do...
 needs to handle the scroll delegation of tasks and instantiate the port and province views appropriately
 */
-(UIScrollView *)setUpScrollView;
-(void)displayPorts;
-(void)displayProvinces;

@end
