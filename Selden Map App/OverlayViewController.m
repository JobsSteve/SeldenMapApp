//
//  overlayViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 1/6/13.
//
//

#import "OverlayViewController.h"

@interface OverlayViewController ()

@end

@implementation OverlayViewController
@synthesize delegate = _delegate, backgroundView = _backgroundView, currentProvince = _currentProvince, pageView = _pageView, titleText = _titleText, chineseText = _chineseText, pageControl = _pageControl, pages=_pages, closeButton = _closeButton, imageView=_imageView, imagePresentedVC = _imagePresentedVC, imageInfoText = _imageInfoText;

-(id)initWithProvince:(Province *)currentProvince
{
    self = [super init];
    if(self)
    {
        _currentProvince = currentProvince;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 668, 924)];
    [_backgroundView addSubview:[[UIImageView alloc]initWithImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"modalViewBG" ofType:@"png"]]]];
    //[_backgroundView setBackgroundColor:[UIColor blackColor]];
    [_backgroundView setAlpha:0.9f];
    [[self view]addSubview:_backgroundView];
    //UITapGestureRecognizer *tapGestureRecog = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissOverlayViewController)];
    //[_backgroundView addGestureRecognizer:tapGestureRecog];

    /*_modalViewController = [[InfoModalViewController alloc]initWithProvince:_currentProvince];
    [[self view] addSubview:[_modalViewController view]];
    [[_modalViewController closeButton] addTarget:self action:@selector(dismissOverlayViewController:) forControlEvents:UIControlEventTouchUpInside];
     */
    
    
    _titleText = [[ModalTextView alloc]initWithFrame:CGRectMake(36, 25, 600, 100)];
    [_titleText setFontSize:[NSNumber numberWithFloat:45.0]];
    [_titleText setBackgroundColor:[UIColor clearColor]];
    [_titleText setUserInteractionEnabled:NO];
    [_titleText setFontColor:[UIColor whiteColor]];
    [_titleText setText:[_currentProvince name]];
    
    
    _chineseText = [[ModalTextView alloc]initWithFrame:CGRectMake(36, 75, 600, 100)];
    [_chineseText setFontSize:[NSNumber numberWithFloat:35.0]];
    [_chineseText setBackgroundColor:[UIColor clearColor]];
    [_chineseText setUserInteractionEnabled:NO];
    [_chineseText setFontColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
    [_chineseText setText:[_currentProvince chineseName]];
    [[self view]addSubview:_chineseText];
    [[self view]addSubview:_titleText];
    
    _pageView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 130, 668, 750)];
    [_pageView setContentSize:CGSizeMake(668, 900)];
    testView = [[ModalView_Wide alloc]initWithFrame:CGRectMake(0, 0, 668, 924)];
    [_pageView addSubview:testView];
    [[self view] addSubview:_pageView];
    
    //will need code to test if view is wide or long
    /*_imageView = [[UIImageView alloc]initWithImage:[[_currentProvince images] objectAtIndex:0]];
    
    [_imageView setUserInteractionEnabled:YES];
    _imageInfoText = [[ModalTextView alloc]init];
    [self setFrameOfImageandInfo];
    [_imageInfoText setText:[[_currentProvince imageText]objectAtIndex:0]];
    UITapGestureRecognizer *imageTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(presentImagePopover:)];
    [_imageView addGestureRecognizer:imageTapped];*/
    
    //_pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(234, 810, 200, 74)];
   // [_pageControl addTarget:self action:@selector(changePage) forControlEvents:UIControlEventValueChanged];
    
    //attempt to add two views to the scroll view
   // _pageView = [[UIScrollView alloc]initWithFrame:[[self view]frame]];
    ////[self setScrollViewWithPages:[[_currentProvince images]count]];
    //[_pageView setPagingEnabled:YES];
    //[_pageView setDelegate:self];
//[[self view]addSubview:_pageView];
    
    _closeButton = [[UIButton alloc]initWithFrame:CGRectMake(600, 22, 50, 50)];
    [_closeButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"close" ofType:@"png"]] forState:UIControlStateNormal];
    //[_closeButton addTarget:_delegate action:@selector(dismissOverlay:) forControlEvents:UIControlEventTouchUpInside];
    hitAreaForClose = [[UIButton alloc]initWithFrame:CGRectMake(600, 10, 118, 100)];//previous 640
    [hitAreaForClose addTarget:self action:@selector(closeButtonHitDown:) forControlEvents:UIControlEventTouchDown];
    [hitAreaForClose addTarget:self action:@selector(closeButtonHitUp:) forControlEvents:UIControlEventTouchUpInside];
    [hitAreaForClose setBackgroundColor:[UIColor clearColor]];
    [hitAreaForClose setUserInteractionEnabled:YES];
    
    
    //[[self view]addSubview:_magGlass];
    //[[self view]addSubview:_pageControl];
    //[[self view]addSubview:_imageView];
    [[self view]addSubview:_imageInfoText];
    [[self view]addSubview:_closeButton];
    [[self view]addSubview:hitAreaForClose];
    
    pageControlUsed = false;
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
}
-(IBAction)closeButtonHitDown:(id)sender
{
    [_closeButton setHighlighted:YES];
    NSLog(@"Close Hit");
}
-(IBAction)closeButtonHitUp:(id)sender
{
    [_closeButton setHighlighted:NO];
    [_delegate dismissOverlay:sender];
    NSLog(@"Close Hit");
}
-(void)viewWillDisappear:(BOOL)animated
{
    [UIView animateWithDuration:.5 animations:^{
        [_backgroundView setAlpha:0];
        [_backgroundView setFrame:CGRectMake(0, 1024, 768, 1024)];
        //[[_modalViewController view]setFrame:CGRectMake(25, 22, 719, 980)];
        
    }];
}
-(void)setScrollViewWithPages:(float)numberOfPages
{
    //create scroll view with width
    //create pages for each page
    //place pages into scroll view
    
    
    /*
    int ySize = 850*numberOfPages;
    [_pageView setContentSize:CGSizeMake(588, ySize)];
    [_pageControl setNumberOfPages:numberOfPages];
    
    //_pages = [[NSMutableArray alloc]initWithCapacity:numberOfPages];
    for (int i = 0;i < numberOfPages; i++){
        //need code here to determine if we're going hotdog or hamburger
        if ([[_currentProvince imageOrientationArray] objectAtIndex:i]==[NSNumber numberWithBool:YES])
        {
            ModalView_Vertical *newPage = [[ModalView_Vertical alloc]initWithHeader:[[[self currentProvince]subtitleArray]objectAtIndex:i] body:[[[self currentProvince]paragraphArray]objectAtIndex:i]];
            [newPage setFrame:CGRectMake(0, i*850, 588, 850)];
            [_pageView addSubview:newPage];
            [_pages addObject:newPage];
        } else {
            ModalView_Wide *newPage = [[ModalView_Wide alloc]initWithHeader:[[[self currentProvince]subtitleArray]objectAtIndex:i] body:[[[self currentProvince]paragraphArray]objectAtIndex:i]];
            [newPage setFrame:CGRectMake(i*668, 0, 668, 924)];
            [_pageView addSubview:newPage];
            [_pages addObject:newPage];
        }
        //[_pages addObject:newPage];
    }
    //[_magGlass setViewToMagnify:[_pages objectAtIndex:0]];*/
}


//SCROLL VOEW DELEGATE METHODS
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //update magnifying glasses location
    //update view to magnify
    
    if (!pageControlUsed)
    {
        int result = (int)[scrollView contentOffset].x % 768;
        int page = (_pageView.contentOffset.x + 768)/768 ;
        NSLog(@"Curent offset mod 768 = %d", result);
        NSLog(@"Curent offset / 768 = %d", page);
        NSLog(@"content offset = %f", [scrollView contentOffset].x);
        if (result >200 && result < 600)
        {
            if (([scrollView contentOffset].x + 1024) < [scrollView contentSize].width)
            {
                
                int newX;
                if (page > _pageControl.currentPage){
                    newX = 768*_pageControl.currentPage + 768;//needs to be plus or minus
                } else{
                    newX = 768*_pageControl.currentPage - 768;
                    page --;
                }
                //CGFloat pageWidth = _pageView.frame.size.width;
                //int page = floor((_pageView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
                if([scrollView isTracking])
                {
                    _pageControl.currentPage = page;
                    CGRect bounds = [scrollView bounds];
                    [scrollView setScrollEnabled:NO];
                    [scrollView setBounds:bounds];
                    [UIView animateWithDuration:.25 animations:^{
                        [scrollView setContentOffset:CGPointMake(newX, 0) animated:NO];
                        [_imageView setAlpha:0.0];
                        [_imageInfoText setAlpha:0.0];
                        [scrollView setBounds:CGRectMake(newX, 0, 768, 1024)];
                    } completion:^(BOOL finished) {
                        [self scrollCompleted];
                    }];
                }
            }

        }
    }
    //test the offset determine if its between moving boundaries
    //then we animate and automatically move
    
}
-(void)setFrameOfImageandInfo{
    if ([[_currentProvince imageOrientationArray]objectAtIndex:_pageControl.currentPage] == [NSNumber numberWithBool:YES])
    {
        [_imageView setFrame:CGRectMake(350, 155, 273, 420)];
        _imageInfoText = [[ModalTextView alloc]initWithFrame:CGRectMake(350,615, 273, 420)];
        //[[self view] addSubview:_imageInfoText];
        //_imageInfoText = [[ModalTextView alloc]initWithFrame:CGRectMake(40, 904, 688, 100)];
    }
    else{
        [_imageView setFrame:CGRectMake(40, 500, 588, 300)];
        _imageInfoText = [[ModalTextView alloc]initWithFrame:CGRectMake(40, 784, 588, 300)];
        //[[self view] addSubview:_imageInfoText];
    }
    [_imageInfoText setFontColor:[UIColor whiteColor]];
    [_imageInfoText setFontSize:[NSNumber numberWithInt:18]];
}
-(void)scrollCompleted{
    [_pageView setScrollEnabled:YES];
    [self setFrameOfImageandInfo];
    [_imageView setImage:[[_currentProvince images]objectAtIndex:_pageControl.currentPage]];
    [_imageInfoText setText:[[_currentProvince imageText]objectAtIndex:_pageControl.currentPage]];
    
    [UIView animateWithDuration:1.0 animations:^{
        [_imageView setAlpha:1.0];
        [_imageInfoText setAlpha:1.0];
    }];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (pageControlUsed)
    {
        [UIView animateWithDuration:1.0 animations:^{
            [_imageView setAlpha:0];
            [_imageInfoText setAlpha:0];
        } completion:^(BOOL finished) {
            [self scrollCompleted];
        }];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
    int page = [scrollView contentOffset].x / 768;
    if ([_pageControl currentPage] != page)
    {
        [UIView animateWithDuration:1.0 animations:^{
            [_imageView setAlpha:0.0];
            [_imageInfoText setAlpha:0.0];
        } completion:^(BOOL finished) {
            [self scrollCompleted];
        }];
        [_pageControl setCurrentPage:page];
    }
}

//ModalViewDelegate Method
-(IBAction)presentImagePopover:(id)sender{
    //declare new view controller
    //set image from current page as a subview
    //present view controller
    
    _imagePresentedVC = [[UIViewController alloc]initWithNibName:nil bundle:nil];
    [self presentViewController:_imagePresentedVC animated:YES completion:nil];
}
- (IBAction)changePage {
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = _pageView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = _pageView.frame.size;
    [_pageView scrollRectToVisible:frame animated:YES];
    pageControlUsed = YES;
}
@end
