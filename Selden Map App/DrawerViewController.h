//
//  DrawerViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 12/13/12.
//
//

#import <UIKit/UIKit.h>
#import "ProvinceInfoView.h"

@interface DrawerViewController : UIViewController
@property (nonatomic, retain) ProvinceInfoView *provinceViewController;
-(void)setTitleView:(UITextView *) provinceTitleView;
@end
