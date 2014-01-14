//
//  BaseViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 12/10/12.
//
//

#import <UIKit/UIKit.h>
#import "InterfaceAnimatedButton.h"
#import "ContentViewController.h"
#import "LabelViewController.h"
#import "ProvinceButton.h"
#import "ACMagnifyingGlass.h"
#import "ACMagnifyingView.h"
#import "ACLoupe.h"
#import "OverlayViewController.h"
#import "storage.h"
#import "PortButton.h"
#import "MapScrollView.h"
#import "PinchGestureRecognizer.h"
#import "RouteMarker.h"
#import "AppDelegate.h"
#import "TimeViewController.h"
//@class TimeViewController;

@interface BaseViewController : UIViewController <UIScrollViewDelegate, ButtonDelegate, ProvinceButtonDelegate, OverlayViewControllerDelegate, LabelButtonDelegate, PinchDelegate,timelineDelegate>
{
    //UIElements
    InterfaceAnimatedButton *portButton;
    InterfaceAnimatedButton *provinceButton;
    InterfaceAnimatedButton *routeButton;
    UIButton *fullScreenButton;
    UIButton *settingsButton;
    UIImageView *backgroundBar;
    
    
    NSMutableArray *portButtons;
    NSMutableArray *provinceButtons;
    NSMutableArray *routeButtons;
    
    BOOL portsDisplayed;
    BOOL provincesDisplayed;
    BOOL loadingProvinces;
    BOOL loadingPorts;
    BOOL fullScreenMapOn;
    BOOL timelinePromptInitiated;
    BOOL timelineEngaged;
    
    BOOL provinceVisible;
    BOOL routesDisplayed;
    BOOL loadingRoutes;
    
    UIImageView *routeImage;
    
    UIButton *currentButtonOpen;
    
    UIImageView *fullSizeMap;
    UIScrollView *fullSizeMapScroll;
    UIScrollView *titleScreenScroll;
    UIImageView *mapBackground;
    UIImageView *blackOverlay;
    CGFloat increment;
    int zoomOutDelay;
    UIView *contentView;
    UIButton *timelineButton;
    UIView *timelineLabel;
    TimeViewController *timeline;
    
    CGPoint presentationOrigin;
    UIView *silverBackground;
    
    ProvinceButton *testButton;
    ACMagnifyingView *magnifyingView;
    ACLoupe *testLoupe;
    
    UIImageView *currentGraphicsContext;
    OverlayViewController *modalViewController;
    
    Province *currentProvince;
    
    NSMutableArray *port_btns;
}
@property (nonatomic, strong) MapScrollView *mapView;
@property (nonatomic, strong) LabelViewController *label;
-(void)presentProvinceViewController;
-(UIScrollView *)setUpScrollView;
@end
