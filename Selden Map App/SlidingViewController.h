//
//  SlidingViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 12/8/12.
//
//
/*
    Sliding View Controller is my implementation of the Selden Map App
 
 What it needs to do: The Sliding View Controller manages 2 Views, the DrawerView and the BaseView. The DrawerView is able to slide and anchor from the left side of the screen to the right on UITapGestures and UIPanGestures. The class will not make use of a storyboard. 
 */

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "OBShapedButton.h"
#import "TitleViewController.h"
#import "DrawerViewController.h"
#import "BaseViewController.h"
#import "ProvinceInfoView.h"
#import "AppDelegate.h"

/*
 The original implementation makes use of enumerated types for managing the underView's width, to declare the sides of the screen the drawer can pan to, and to determine what the reset strategy will be.
 */
typedef enum{
    DrawerLeft,
    DrawerPreview,
    DrawerRight
} DrawerSide;

@interface SlidingViewController : UIViewController <ProvinceInfoViewDelegate>

@property (nonatomic, strong) BaseViewController *baseViewController;
@property (nonatomic, strong) DrawerViewController *drawerViewController;
@property (nonatomic, strong) OBShapedButton *fullScreenButton;
@property (nonatomic, strong) OBShapedButton *timelineButton;
@property (nonatomic, strong) TitleViewController *titleViewController;
/*
    Number of points visible on the top view's padding at various DrawerSide states
 */
@property (nonatomic, unsafe_unretained) CGFloat drawerLeftPeekAmount;
@property (nonatomic, unsafe_unretained) CGFloat drawerPreviewPeekAmount;

-(id)initWithDrawerViewController:(UIViewController *)drawerVC BaseViewController:(UIViewController *)baseVC;

-(UIPanGestureRecognizer *)panGesture;

/*
 Methods to anchor the Drawer
 */
-(void)anchorDrawerTo:(DrawerSide)side;
-(void)anchorDrawerTo:(DrawerSide)side animations:(void(^)()) animations onComplete:(void(^)())complete;


@end