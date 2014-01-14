//
//  RumexCustomTabBar.h
//  
//
//  Created by Oliver Farago on 19/06/2010.
//  Copyright 2010 Rumex IT All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ports.h"
#import "Provinces.h"
#import "ProvinceInformation.h"
#import "storage.h"
#import "ProvinceInfoView.h"
#import "DrawerPreviewViewController.h"


typedef enum{
    PortState,
    ProvinceState,
    RouteState,
    NoState
} defaultState;

@interface CustomTabBar : UITabBarController {
	UIButton *btn1;
	UIButton *btn2;
	UIButton *btn3;
	UIButton *btn4;
	UIButton *btn5;
	UIButton *btn6;
	UIButton *btn7;
}

@property (nonatomic, retain) UIButton *btn1;
@property (nonatomic, retain) UIButton *btn2;
@property (nonatomic, retain) UIButton *btn3;
@property (nonatomic, retain) UIButton *btn4;
@property (nonatomic, retain) UIButton *btn5;
@property (nonatomic, retain) UIButton *btn6;
@property (nonatomic, retain) UIButton *btn7;

@property (nonatomic) defaultState currentState;
@property (nonatomic, retain) NSString *currentObject;

@property (nonatomic, weak) DrawerPreviewViewController *previewController;

-(id)initWithState:(defaultState)startingState;//code to initialize tab bar controller to specific state
//need code to update tab bar controller on new port or province press
-(void)switchStateTo:(defaultState)newState animated:(BOOL)shouldAnimate fromSender:(NSString *)senderName;
-(void)loadDataFromPortWithName:(NSString *)name;
-(void)loadDataFromProvinceWithName:(NSString *)name;
-(void) hideTabBar;
-(void) selectTab:(int)tabID;

-(void) hideNewTabBar;
//-(void) ShowNewTabBar;

@end
