//
//  MapPopover.h
//  SeldenMap
//
//  Created by Corey Zanotti on 10/19/12.
//
//

#import <UIKit/UIKit.h>

@interface MapPopover : UIPopoverController
@property (nonatomic, weak) UIButton *sender;

-(id)initWithContentViewController:(UIViewController *)viewController sender:(UIButton *)senderButton;
@end
