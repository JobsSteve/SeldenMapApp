//
//  overlayViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 1/6/13.
//
//

#import <UIKit/UIKit.h>
#import "InfoModalViewController.h"
#import "Province.h"
#import "ModalView_Vertical.h"
#import "ACMagnifyingGlass.h"
#import "MagnifyingGlass.h"
#import "ModalImage.h"
#import "ModalTextView.h"
#import "ModalView_Wide.h"

@protocol OverlayViewControllerDelegate

-(IBAction)dismissOverlay:(id)sender;
@end

@interface OverlayViewController : UIViewController <UIScrollViewDelegate, ModalViewDelegate>
{
    bool pageControlUsed;
    UIButton *hitAreaForClose;
    CGPoint presentationOrigin;
    ModalView_Wide *testView;
}
//@property (nonatomic, retain) InfoModalViewController *modalViewController;
@property (nonatomic, retain) ModalTextView *titleText;
@property (nonatomic, retain) ModalTextView *chineseText;
@property (nonatomic, retain) UIScrollView *pageView;
@property (nonatomic, retain) Province *currentProvince;
@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic, retain) id<OverlayViewControllerDelegate> delegate;
@property (nonatomic, retain) MagnifyingGlass
*magGlass;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIPageControl *pageControl;
@property (nonatomic, retain) NSMutableArray *pages;
@property (nonatomic, retain) UIButton *closeButton;
@property (nonatomic, retain) UIViewController *imagePresentedVC;
@property (nonatomic, retain) ModalTextView *imageInfoText;

-(void)dismissOverlayViewController;
-(id)initWithProvince:(Province *)currentProvince;
-(IBAction)changePage;
@end
