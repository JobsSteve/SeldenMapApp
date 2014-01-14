//
//  InfoModalViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 11/29/12.
//
//

#import "InfoModalViewController.h"

@implementation InfoModalViewController
@synthesize pageControl = _pageControl, closeButton = _closeButton, contentScroll = _contentScroll, infoScreen = _infoScreen, pages=_pages,  currentProvince = _currentProvince, imageInfoText = _imageInfoText, chinese_name = _chinese_name;
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
    [[self view]setFrame:CGRectMake(0, 1100, 768, 1024)];
    
    [_contentScroll setPagingEnabled:NO];
    
    [_contentScroll setDelegate:self];
    //CLOSE BUTTON SETUP
    //[_closeWindowButton addTarget:self action:@selector(dismissModalViewController) forControlEvents:UIControlEventTouchUpInside];
    [self setInformationForCurrentProvince];
	// Do any additional setup after loading the view.
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    [[self view]addSubview:_pageControl];
    _pages = [[NSMutableArray alloc]init];
}
-(void)viewDidAppear:(BOOL)animated
{
    //[[self view]setFrame:CGRectMake(20, 20, 748, 1004)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    //[self setTopInfoText:nil];
    [self setPageControl:nil];
    [self setCloseButton:nil];
    [self setContentScroll:nil];
    [super viewDidUnload];
}

-(void)setInformationForCurrentProvince{
    
    if (_currentProvince)
    {
        
        /*
            Algorithm... How to set up a dynamic number of pages for a province.
         1. Province Info: Has images, paragraphs, image descriptions
         2. loop through pages
         5. place page elements in container
         6. enjoy with a cup of coffee. 
         */
        //SETTING UP PROVINCE VIEW
        
        //putting images into scrollview
        /*
         Declare a content View
         place images onto content view at specific locations
         set content size of scroll view
         */
        
        [self setScrollViewWithPages:[[[self currentProvince] images]count]];
        [self drawLabel];
        [_titleView setText:[_currentProvince name]];
        
        //establishing pageControl
        //[_pageControl setNumberOfPages:[[[self currentProvince]images]count]];
        //[_pageControl setCurrentPage:0];
    } else {
        //DEFAULT STATE... SET UP THREE dummy pages FOR SCROLL VIEW
        [_contentScroll setContentSize:CGSizeMake(1704, 724)];
        UIImage *sampleImage1 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"modalViewImage_1" ofType:@"png"]];
        
        NSString *sampleText1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?";
        
        ModalPageViewController *page1 = [[ModalPageViewController alloc]initWithImage:sampleImage1 text:sampleText1 infoText:@"Hello World"];
        [_contentScroll addSubview:[page1 view]];
        
        [_pages addObject:page1];
        
        NSString *sampleText_2 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?";
        
        UIImage *sampleImage2 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"modalViewImage_2" ofType:@"png"]];
        ModalPageViewController *page2 = [[ModalPageViewController alloc]initWithImage:sampleImage2 text:sampleText_2 infoText:@"some text"];
        [[page2 view] setFrame:CGRectMake(568, 0, 568, 425)];
        [_contentScroll addSubview:[page2 view]];
        [_pages addObject:page2];
        
        NSString *sampleText3 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?";
        
        UIImage *sampleImage3 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"modalViewImage_1" ofType:@"png"]];
        ModalPageViewController *page3 = [[ModalPageViewController alloc]initWithImage:sampleImage3 text:sampleText3 infoText:@"someTexty"];
        [[page3 view]setFrame:CGRectMake(1136, 0, 568, 425)];
        [_contentScroll addSubview:[page3 view]];
        
        
    }
    
}
-(void)drawLabel{
    UIFont *font = [UIFont fontWithName:@"Cochin" size:50.0];
    CGPoint point = CGPointMake(0, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 1, 1, 1, .7);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    CGContextSaveGState(context);
    [@"Chinese Text" drawAtPoint:point withFont:font];
}

/*
    Scroll View Set Up Methods
 */
-(void)setScrollViewWithPages:(float)numberOfPages
{
    //create scroll view with width
    //create pages for each page
    //place pages into scroll view
    int xSize = 768*numberOfPages;
    [_contentScroll setContentSize:CGSizeMake(xSize, 1024)];
    
    _pages = [[NSMutableArray alloc]initWithCapacity:numberOfPages];
    for (int i = 0;i < numberOfPages; i++){
        ModalPageViewController *newPage = [[ModalPageViewController alloc]initWithImage:[[[self currentProvince]images]objectAtIndex:i] text:[[[self currentProvince]paragraphArray]objectAtIndex:i] infoText:[[[self currentProvince]imageText]objectAtIndex:i]];
        [[newPage view]setFrame:CGRectMake(i*500, 0, 768, 1024)];
        [_contentScroll addSubview:[newPage view]];
        [_pages addObject:newPage];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    for (int i = 0; i < [_pages count]; i++)
    {
        ModalPageViewController *page = (ModalPageViewController *)[_pages objectAtIndex:i];
        [[page view] touchesBegan:touches withEvent:event];
    }
}
-(IBAction)changePage:(id)sender{
    //get new page number
    //move scrollView to proper page
    currentPage = [_pageControl currentPage];
    CGRect frame = [_contentScroll frame];
    frame.origin.x = frame.size.width * currentPage;
    [_contentScroll scrollRectToVisible:frame animated:YES];
    pageControlUsed = YES;
    [self animateToNextPage];
}

-(IBAction)showInfo:(id)sender
{
    NSLog(@"showTimeBaby");
    UIButton *sender_btn = (UIButton *)sender;
    CGPoint origin = sender_btn.frame.origin;
    if (infoScreenShowing)
    {
        infoScreenShowing = NO;
        [UIView animateWithDuration:.5 animations:^(void){
            [sender_btn setFrame:CGRectMake(origin.x, origin.y + 25, sender_btn.frame.size.width, sender_btn.frame.size.height)];
            [_infoScreen setAlpha:0];
        } completion:^(BOOL finished) {
        }];
    } else{
        //code to animate view onto screen and off of screen.

        [_infoScreen setFrame:CGRectMake(origin.x-538, 400, 568, 25)];
        [_infoScreen setBackgroundColor:[UIColor blackColor]];
        //[_contentScroll addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showInfo:)]];
        [UIView animateWithDuration:.5 animations:^(void) {
            [sender_btn setFrame:CGRectMake(origin.x, origin.y - 25, sender_btn.frame.size.width, sender_btn.frame.size.height)];
            [_infoScreen setAlpha:1];
        }];
        infoScreenShowing = YES;
    }
}

//CLOSE WINDOW METHOD
-(void)dismissModalViewController{

}

//SCROLL VIEW DELEGATE METHODS
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    /*if (_descriptionText == scrollView)
    {
        //CODE TO FLIP VIEW AFTER RANGE TEST
        NSLog (@"Selected Range location:%d length: %d",[_descriptionText selectedRange].location, [_descriptionText selectedRange].length);
        return;
    }
    if (pageControlUsed)
    {
        return;
    }
    if (imageTextNeedsToAnimate)
    {
        imageTextNeedsToAnimate = false;
    }
    CGFloat pageWidth = [_contentScroll frame].size.width;
    
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page; */
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    /*pageControlUsed = NO;
    [self animateToNextPage];
    imageTextNeedsToAnimate = true;*/
}
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

-(void)loadDataFromProvinceWithName:(NSString *)name
{
    /*
     //fetch ProvinceInformation from CoreData
     ProvinceInformation *provinceInfo = [self fetchProvinceInfoFromProvinceWithName:name];
     NSLog(@"ProvinceInformation Description is %@",[provinceInfo provinceDescription]);
     //code to load the provinceInformation onto the necessary views
     [self setUpProvinceViewsWithProvinceInfo:provinceInfo];
     */
}


//code to populate fields
-(void)setUpProvinceViewsWithProvinceInfo:(ProvinceInformation *)info
{
    /*
     ProvinceInfoView *infoView = (ProvinceInfoView *)[[self viewControllers] objectAtIndex:3];
     [infoView description].text = info.provinceDescription;
     //repeat for objects at Indexes 4 and 5
     [previewController nameField].text = [info aboutProvince].name;
     NSString *path = [[NSBundle mainBundle]pathForResource:@"previewImage" ofType:@"png"];
     [previewController imageField].image = [[UIImage alloc]initWithContentsOfFile:path];
     */
}

//code to grab information from core data
-(ProvinceInformation *)fetchProvinceInfoFromProvinceWithName:(NSString *)name
{
    /*
     // 1 - Decide what Entity you want
     NSString *entityName = @"ProvinceInformation";
     
     NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
     
     // 2 - Request that Entity
     NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
     
     // 3 - Filter it if you want
     request.predicate = [NSPredicate predicateWithFormat:@"aboutProvince.name = %@",name];
     
     // 4 - Sort it if you want
     request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"aboutProvince.name"                                    ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
     // 5 - Fetch it
     NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
     managedObjectContext:[[storage sharedStore]managedObjectContext]
     sectionNameKeyPath:nil
     cacheName:nil];
     [fetchedResultsController performFetch:nil];
     
     return [[fetchedResultsController fetchedObjects]objectAtIndex:0];
     */
    return nil;
}
@end

