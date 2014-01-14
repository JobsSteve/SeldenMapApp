//
//  ProvinceInfoView.m
//  Selden Map App
//
//  Created by Corey Zanotti on 11/29/12.
//
//

#import "ProvinceInfoView.h"

@interface ProvinceInfoView ()

@end

@implementation ProvinceInfoView
@synthesize imageScrollView = _imageScrollView, imageInfoText = _imageInfoText, topInfoText = _topInfoText, descriptionText = _descriptionText, latinTranslation = _latinTranslation,chinesePronunciation = _chinesePronunciation, provinceThumbnailImage = _provinceThumbnailImage, thumbnail = _thumbnail, pageControl = _pageControl, expansionButton = _expansionButton, modalVC = _modalVC, provinceTitleView = _provinceTitleView, gotoButton = _gotoButton, currentDelegate = _currentDelegate, modalViewController = _modalViewController, currentProvince = _currentProvince;
-(id)initWithProvince:(Province *)province
{
    self = [super init];
    if (self)
    {
        [self setCurrentProvince:province];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //_topInfoText = [[UITextView alloc]initWithFrame:CGRectMake(26, 12, 473, 36)];
    //[_topInfoText setBackgroundColor:[UIColor clearColor]];
    //[_topInfoText setEditable:NO];
    //[[self view] addSubview:_topInfoText];
    
    /*_descriptionText = [[UITextView alloc]initWithFrame:CGRectMake(32, 35, 180, 250)];
    [_descriptionText setBackgroundColor:[UIColor clearColor]];
    [_descriptionText setEditable:NO];
    [_descriptionText setScrollEnabled:YES];
    [[self view] addSubview:_descriptionText];
    
    [self setThumbnail:[[UIImageView alloc]initWithFrame:CGRectMake(610, 122, 150, 140)]];
    [[self view] addSubview:_thumbnail];
    
    [self setImageScrollView:[[UIScrollView alloc]initWithFrame:CGRectMake(290, 62, 250, 150)]];
    [_imageScrollView setContentSize: CGSizeMake(750, 150)];
    [_imageScrollView setPagingEnabled:YES];
    [_imageScrollView setDelegate:self];
    [[self view] addSubview:_imageScrollView];
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(397, 204, 38, 36)];
    [[self view] addSubview:_pageControl];
    
    _imageInfoText = [[UITextView alloc]initWithFrame:CGRectMake(312, 233, 208, 29)];
    [_imageInfoText setEditable:NO];
    [_imageInfoText setBackgroundColor:[UIColor clearColor]];
    [[self view] addSubview:_imageInfoText];
    
    //_provinceThumbnailImage = [[UIImageView alloc]initWithFrame:CGRectMake(597, 122, 150, 140)];
    //[[self view]addSubview:_provinceThumbnailImage];
    */
    
    _chinesePronunciation = [[UITextView alloc]initWithFrame:CGRectMake(603, 35, 155, 25)];
    [_chinesePronunciation setBackgroundColor:[UIColor clearColor]];
    [_chinesePronunciation setEditable:NO];
    [_chinesePronunciation setScrollEnabled:YES];
    [[self view] addSubview:_chinesePronunciation];
    
    _latinTranslation = [[UITextView alloc]initWithFrame:CGRectMake(603, 75, 155, 250)];
    [_latinTranslation setBackgroundColor:[UIColor clearColor]];
    [_latinTranslation setEditable:NO];
    [_latinTranslation setScrollEnabled:YES];
    [[self view] addSubview:_latinTranslation];

    _expansionButton = [[UIButton alloc]initWithFrame:CGRectMake(613, 250, 64 , 36)];
    [_expansionButton setUserInteractionEnabled:YES];
    [[self view]addSubview:_expansionButton];
    UIImage *expansionImage = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fullscreen_button" ofType:@"png"]];
    [_expansionButton setImage:expansionImage forState:UIControlStateNormal];
    [_expansionButton addTarget:self action:@selector(presentProvinceModalViewController) forControlEvents:UIControlEventTouchUpInside];
    
    /*
    _gotoButton = [[UIButton alloc]initWithFrame:CGRectMake(610, 122, 150, 140)];
    [[self view]addSubview:_gotoButton];
    [_gotoButton setShowsTouchWhenHighlighted:YES];
    [_gotoButton addTarget:self action:@selector(gotoProvince) forControlEvents:UIControlEventTouchUpInside];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    //[self setTopInfoText:nil];
    [self setImageScrollView:nil];
    [self setDescriptionText:nil];
    [self setImageInfoText:nil];
    [self setLatinTranslation:nil];
    [self setChinesePronunciation:nil];
    [self setProvinceThumbnailImage:nil];
    [self setDescriptionText:nil];
    [self setTopInfoText:nil];
    [self setPageControl:nil];
    [super viewDidUnload];
}

-(void)setInformationForCurrentProvince{
    //SETTING UP PROVINCE VIEW
    
    //update Mandarin Text
    
    [_currentDelegate updateScrollViewLocationTo:_currentProvince.location];
    [_currentDelegate updateProvinceNameTo:[_currentProvince name]];
}

-(IBAction)changePage:(id)sender{
    //get new page number
    //move scrollView to proper page
    currentPage = [_pageControl currentPage];
    CGRect frame = [_imageScrollView frame];
    frame.origin.x = frame.size.width * currentPage;
    [_imageScrollView scrollRectToVisible:frame animated:YES];
    pageControlUsed = YES;
    [self animateToNextPage];
}


//MODAL VIEW CONTROLLER METHODS
-(void)presentProvinceModalViewController
{
    _modalViewController = [[OverlayViewController alloc]initWithProvince:_currentProvince];
    [_modalViewController setDelegate:self];
    [self presentModalViewController:_modalViewController animated:NO];
}

-(void)dismissOverlay{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//SCROLL VIEW DELEGATE METHODS
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (pageControlUsed)
    {
        return;
    }
    if (imageTextNeedsToAnimate)
    {
        imageTextNeedsToAnimate = false;
    }
    CGFloat pageWidth = [_imageScrollView frame].size.width;
    
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
    [self animateToNextPage];
    imageTextNeedsToAnimate = true;
}

//ANIMATION METHODS
-(void)animateImageDescriptionOff
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];

    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:.30f];
    _imageInfoText.alpha=0;
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    [UIView commitAnimations];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    /*
     change the imageInfoText
     commit new animations
     */
    _imageInfoText.text = [[_currentProvince imageText]objectAtIndex:[_pageControl currentPage]];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:.30f];
    _imageInfoText.alpha=1;
    [UIView commitAnimations];
}
-(void)animateToNextPage
{
    /*
     Algorithm:
        Animate current text off screen
        Animate new text on screen
     */
    [self animateImageDescriptionOff];
}
@end
