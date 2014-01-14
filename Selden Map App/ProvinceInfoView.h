//
//  ProvinceInfoView.h
//  Selden Map App
//
//  Created by Corey Zanotti on 11/29/12.
//
//
/*
    ProvinceInfoViewController is the view controller of the province information view
 Functionality: Populate fields with information on Province click
 Fields: Description Scroll View 
                    Text View
        Image Scroll View
            Image Content View
                Image
                Image
                Image
            Image Text
            Image Text
            Image Text
        Province Top Text
        
 */

#import <UIKit/UIKit.h>
#import <QuartzCore/CoreAnimation.h>
#import "ProvinceInformation.h"
#import "Province.h"
#import "OBShapedButton.h"
#import "InfoModalViewController.h"
#import "OverlayViewController.h"

@protocol ProvinceInfoViewDelegate <NSObject>

-(void)updateScrollViewLocationTo:(CGPoint)location;
-(void)updateProvinceNameTo:(NSString *)provinceName;

@end

@interface ProvinceInfoView : UIViewController <UIScrollViewDelegate, OverlayViewControllerDelegate>
{
    int currentPage;
    BOOL pageControlUsed;
    BOOL imageTextNeedsToAnimate;
}

//CURRENT PROVINCE AND DELEGATE
@property (nonatomic, retain) Province *currentProvince;
@property (nonatomic, retain) id <ProvinceInfoViewDelegate> currentDelegate;



@property (strong, nonatomic) UITextView *topInfoText;

//TITLEIMAGEVIEW
@property (strong, nonatomic) UITextView *provinceTitleView;

//Information Content
@property (strong, nonatomic) UITextView *descriptionText;
@property (strong, nonatomic) UITextView *imageInfoText;

//Preview Panel
@property (strong, nonatomic) UITextView *latinTranslation;
@property (strong, nonatomic) UITextView *chinesePronunciation;
@property (strong, nonatomic)  UIImageView *provinceThumbnailImage;
@property (strong, nonatomic)  UIImageView *thumbnail;
@property (strong, nonatomic)  UIScrollView *imageScrollView;
@property (strong, nonatomic)  UIPageControl *pageControl;
@property (strong, nonatomic) UIButton *expansionButton;
@property (strong, nonatomic) UIButton *gotoButton;
//modal VC
@property (strong, nonatomic) InfoModalViewController *modalVC;
@property (strong, nonatomic) OverlayViewController *modalViewController;

-(id)initWithProvince: (Province *)province;
-(void)setInformationForCurrentProvince;
-(IBAction)changePage:(id)sender;
-(void)animateToNextPage;
-(void)animateImageDescriptionOff;
-(IBAction)presentProvinceModalViewController;
@end
