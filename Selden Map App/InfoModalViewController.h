//
//  InfoModalViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 11/29/12.
//
//
/*
 InfoModalViewController is the view controller of the province information view
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
#import "ModalPageViewController.h"


@interface InfoModalViewController : UIViewController <UIScrollViewDelegate, UITextViewDelegate>
{
    int currentPage;
    BOOL pageControlUsed;
    BOOL imageTextNeedsToAnimate;
    BOOL infoScreenShowing;
}

@property (nonatomic, retain) Province *currentProvince;


//Information Content
@property (weak, nonatomic) IBOutlet UIScrollView *contentScroll;

//Pages
@property(strong, nonatomic) NSMutableArray *pages;
//@property(strong, nonatomic) ModalPageViewController *page1;

@property (strong, nonatomic) IBOutlet UITextView *imageInfoText;
@property (strong, nonatomic) UIPageControl *pageControl;

//Image Content
@property (strong, nonatomic) IBOutlet UITextView *titleView;
@property (weak, nonatomic) IBOutlet UITextView *chinese_name;

@property (strong, nonatomic) IBOutlet UIButton *closeButton;

@property (strong, nonatomic) UIView *infoScreen;


-(id)initWithProvince: (Province *)province;
-(void)setInformationForCurrentProvince;
-(IBAction)changePage:(id)sender;
-(void)animateToNextPage;
-(void)animateImageDescriptionOff;
@end