//
//  LabelViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 1/28/13.
//
//

#import <UIKit/UIKit.h>
#import "OverlayViewController.h"
#import "Province.h"
#import "OBShapedButton.h"
#import "UIButton+Extensions.h"

@protocol LabelButtonDelegate

-(IBAction)processLabelButtonPress:(id)sender;

@end

@interface LabelViewController : UIViewController
{
    UIButton *hitArea;
}
@property (nonatomic) BOOL buttonState;
@property (nonatomic, retain) UIImageView *background;
@property (nonatomic, retain) UIButton_Extensions *expansion_btn;
@property (strong, nonatomic) NSString *provinceName;
@property (strong, nonatomic) UITextView *titleTextView;
@property (nonatomic, strong) id<LabelButtonDelegate> delegate;

-(void)setCurrentProvince:(Province *)currentProvince;
-(void)animateExpansionButton;
@end
