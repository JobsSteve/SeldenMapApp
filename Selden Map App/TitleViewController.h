//
//  TitleViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 1/3/13.
//
//
/*
 This class needs to have code to fade the title in and out and to set the text. 
 */

#import <UIKit/UIKit.h>
#import "Province.h"

@interface TitleViewController : UIViewController

@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UITextView *titleTextView;
@property (nonatomic, strong) Province *currentProvince;
-(void)animateTitle:(BOOL)state;
-(UITextView *)titleTextView;
@end
