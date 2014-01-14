//
//  ModalView_Vertical.h
//  Selden Map App
//
//  Created by Corey Zanotti on 4/17/13.
//
//

#import <UIKit/UIKit.h>
#import "ModalTextView.h"

@interface ModalView_Wide : UIView

@property (strong, retain) ModalTextView *textView;
@property (strong, retain) ModalTextView *subtitleView;
@property (strong, retain) UIImageView *bannerImage;
-(id)initWithHeader: (NSString *)header body:(NSString *)body;
-(bool)isVertical;
@end
