//
//  PortFactory.h
//  SeldenMap
//
//  Created by Corey Zanotti on 8/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/*
 Algorithm for popover
Each button gets an action
 action method determines 
 2 popovers
 1. figure out what popover is active
 2. if sender = presenter dismiss and don't represent
    else dismiss and represent other popover with custom content
 */

/*
 Algirthm for button click
 onButtonPress
 handle popover shaz
 if presenting new information grab information from database based on port name
 call another singleton called portToDatabase which will fetch information and populate the appropriate view
 
 */


/*
    ContentViewController is responsible for managing the scroll view's subview, the map and its content. Its essentially responsible for populating the map with buttons.
 */

#import <Foundation/Foundation.h>
//#import "BaseViewController.h"
#import "DrawerViewController.h"
#import "ProvinceButton.h"

@class BaseViewController;

@interface ContentViewController : UIViewController<ProvinceButtonDelegate>
{
    NSMutableArray *portButtons;
    NSMutableArray *provinceButtons;
    BOOL portsDisplayed;
    BOOL provincesDisplayed;
    BaseViewController *baseVC;
}

//@property (nonatomic, retain) CustomTabBar *tabBarController;
@property (nonatomic, weak) BaseViewController *baseVC;
@property (nonatomic, weak) DrawerViewController *topVC;
@property (nonatomic) BOOL isRetina;
@property (nonatomic, retain) UIImageView *routeImageView;
@property (nonatomic, retain) UIView *mainView;
@property (nonatomic, retain) NSMutableArray *province_btns;

/*
 loadPortsOnView will put all the port buttons into the buttons array and handle the placement of the buttons on the view
 */
-(void)loadPortsOnView;
-(void)removePortsFromView;
-(void)loadProvincesOnView;
-(void)removeProvincesFromView;
-(void)loadRouteImageOnView;

-(void)setMainView:(UIView *)mainView;

+(ContentViewController *)sharedStore;
/*
 portPressed is responsible for populating the overhead controller with the appropriate port content.
 */
-(IBAction)portPressed:(id)sender;
-(IBAction)provincePressed:(id)sender;
-(UIViewController *)createContentViewController;
-(Province *)getInfoForProvinceWithName:(NSString *)provinceName;


@end
