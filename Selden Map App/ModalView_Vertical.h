//
//  ModalView_Vertical.h
//  Selden Map App
//
//  Created by Corey Zanotti on 4/17/13.
//
//

#import <UIKit/UIKit.h>
#import "ModalTextView.h"
#import "ACMagnifyingView.h"

@protocol ModalViewDelegate <NSObject>

-(IBAction)presentImagePopover:(id)sender;

@end
@interface ModalView_Vertical : UIView
{
    UIImageView *imageView;

}
@property (strong, retain) ModalTextView *textView;
@property (strong, retain) ModalTextView *subtitleView;
@property (strong, retain) ACMagnifyingView *magnifyiedView;


-(id)initWithHeader:(NSString *)header body:(NSString *)body;
-(bool)isVertical;
@end
