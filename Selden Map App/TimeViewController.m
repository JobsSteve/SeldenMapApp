//
//  TimeViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 4/24/13.
//
//

#import "TimeViewController.h"

@interface TimeViewController ()

@end

@implementation TimeViewController
@synthesize timelineScrollView = _timelineScrollView, timelinePages = _timelinePages, backgroundImage = _backgroundImage, timeLine = _timeLine, imageView1 = _imageView1, imageView2= _imageView2, delegate = _delegate, mapScrollView = _mapScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithMapView:(MapScrollView *)mapView{
    self = [super init];
    if (self)
    {
        _mapScrollView = mapView;
    }
    return self;
}
- (void)viewDidLoad
{
    [[self view] setFrame:CGRectMake(0, 0, 1024, 768)];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"background" ofType:@"png"];
    UIImage *backgroundImage = [[UIImage alloc]initWithContentsOfFile:path];
    _backgroundImage = [[UIImageView alloc]initWithImage:backgroundImage];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    /*_mapScrollView = [self setUpScrollView];
    [_mapScrollView setUserInteractionEnabled:YES];*/
    //[_mapScrollView setScrollEnabled:YES];
    
    [_backgroundImage setUserInteractionEnabled:NO];
    //[[self view]addSubview:_mapScrollView];
    [[self view] addSubview:_backgroundImage];


    
    
    [self setUpTimeline];
    
    _timeLine = [[TimelineBarViewController alloc]init];
    [[_timeLine view]setFrame:CGRectMake(0, 585, 1024, 183)];
    [[_timeLine view]setUserInteractionEnabled:YES];
    [[self view]addSubview:[_timeLine view]];
    [_timeLine setDelegate:self];
    
    _imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(718, 128, 262, 212)];
    _imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(718, 359, 262, 212)];
    [_imageView1 setImage:[[_timelinePages objectAtIndex:0] image1]];
    [_imageView2 setImage:[[_timelinePages objectAtIndex:1] image2]];
    [[self view]addSubview:_imageView1];
    [[self view]addSubview:_imageView2];
    
    backButton = [[UIButton alloc]initWithFrame:CGRectMake(900, 30, 80, 40)];
    [backButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"close" ofType:@"png"]] forState:UIControlStateNormal];
    
    hitArea = [[UIButton alloc]initWithFrame:CGRectMake(850,20,120,80)];
    [hitArea setBackgroundColor:[UIColor clearColor]];
    
    
    [[self view] addSubview:backButton];
    [[self view] addSubview:hitArea];
    [hitArea addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [hitArea addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
}
-(BOOL)shouldAutorotate{
    return  YES;
}

-(IBAction)touchDown:(id)sender
{
    [backButton setHighlighted:YES];
}
-(IBAction)touchUp:(id)sender
{
    [backButton setHighlighted:NO];
    [_delegate removeTimeline:sender];
}
-(NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice]orientation] == UIInterfaceOrientationPortrait)
    {
        [_delegate removeTimeline:nil];
    }
    return UIInterfaceOrientationMaskLandscapeLeft;
}
-(void)setMapScrollView:(MapScrollView *)mapScrollView
{
    _mapScrollView = mapScrollView;
    [[self view]addSubview:_mapScrollView];
    [_mapScrollView setUserInteractionEnabled:NO];
    [_mapScrollView setZoomScale:.7];
    [self bringUIToFront];
}
-(void)bringUIToFront{
    [[self view]bringSubviewToFront:_backgroundImage];
    [[self view]bringSubviewToFront:_imageView1];
    [[self view]bringSubviewToFront:_imageView2];
    [[self view]bringSubviewToFront:backButton];
    [[self view]bringSubviewToFront:[_timeLine view]];
    [[self view]bringSubviewToFront:_timelineScrollView];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //scroll view did scroll method...
    /*
     We need to fade the images out when the scroll view moves past the halfway point. 
     */
    /*
    int result = (int)[scrollView contentOffset].x % 1024;
    NSLog(@"Content offset mod 1024 = %d", result);
    NSLog(@"scrollview bounds x= %f, y= %f", [scrollView bounds].origin.x, [scrollView bounds].origin.y);

    if (result >102 && result < 740 && [_imageView1 alpha] == 1)
    {
        
        [UIView animateWithDuration:1.0 animations:^{
            [_imageView1 setAlpha:0.0];
            [_imageView2 setAlpha:0.0];
        }];
        
        
        //code to jump to the next or previous page if available...
        //test offset to determine if another page is available
        NSLog(@"content offset = %d", (int)[scrollView contentOffset].x);

        if([scrollView isTracking])
        {
            if ([scrollView contentOffset].x + 1024 < [scrollView contentSize].width)
            {
                
                int newPage = [scrollView contentOffset].x / 1024 + 1;
                int newX;
                if (newPage > currentPage){
                    newX = 1024*currentPage + 1024;//needs to be plus or minus
                } else{
                    newX = 1024*currentPage - 1024;
                    newPage--;
                }
                CGRect bounds = [scrollView bounds];
                [scrollView setScrollEnabled:NO];
                [scrollView setBounds:bounds];
                
                //updating playheads
                currentPage = newPage;
                [self updatePlayhead];
                //[scrollView setContentOffset:[scrollView contentOffset]];
                //[self updateContent];
            [UIView animateWithDuration:1.0 animations:^{
                //[scrollView setContentOffset:CGPointMake(newX, 0) animated:NO];
                [scrollView setBounds:CGRectMake(newX, 0, 1024, 550)];
            } completion:^(BOOL finished) {
                [self scrollCompleted];
            }];
                    }
        }
    }*/
}
-(UIScrollView *)setUpScrollView{
    currentPage = 0;
    CGRect screenRect = CGRectMake(0,0, 1024,768);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"fullsize_map" ofType:@"png"];
    
    UIScrollView *returnView = [[UIScrollView alloc] initWithFrame:screenRect];
    [returnView setMinimumZoomScale:.3];
    [returnView setMaximumZoomScale:.5];
    [returnView setBouncesZoom:NO];
    [returnView setBounces:NO];
    [returnView setContentOffset:CGPointMake(500, 500)];
    [returnView setZoomScale:.3];
    
    UIImage *map = [[UIImage alloc]initWithContentsOfFile:path];
    UIImageView *mapBackground = [[UIImageView alloc]initWithImage:map];
    [returnView addSubview: mapBackground];
    [returnView setContentSize:CGSizeMake(3193, 4928)];
    return returnView;
}

-(void)setUpTimeline
{
    _timelineScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 1024, 550)];
    [_timelineScrollView setBackgroundColor:[UIColor clearColor]];
    [_timelineScrollView setScrollEnabled:YES];
    [_timelineScrollView setUserInteractionEnabled:NO];
    [_timelineScrollView setPagingEnabled:YES];
    int sizeOfTimeline = [[[storage sharedStore]allTimelineInstances] count];
    [_timelineScrollView setContentSize:CGSizeMake(1024 * sizeOfTimeline, 550)];
    _timelinePages = [[NSMutableArray alloc]initWithCapacity:sizeOfTimeline];
    [_timelineScrollView setDelegate:self];
    int count = 0;
    for (TimelineInstance *instance in [[storage sharedStore]allTimelineInstances]){
        NSArray *imageArray = [[NSArray alloc]initWithObjects:[instance image1],[instance image2], nil];
        TimelineContentView *contentView_1 = [[TimelineContentView alloc]initWithTitle:[instance title] SubTitle:[instance subtitle] Body:[instance bodyText] Images:imageArray ScrollPoint:CGPointMake([[instance xLocation] floatValue], [[instance yLocation] floatValue])];
        [contentView_1 setFrame:CGRectMake(1024*count, 0, 1024, 550)];
        count++;
        [_timelineScrollView addSubview:contentView_1];
        [_timelinePages addObject:contentView_1];
        
    }
    [[self view] addSubview:_timelineScrollView];
}
-(void)updatePlayhead{
    switch (currentPage) {
        case 0:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(175, 38)];
            break;
        case 1:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(343, 38)];
            break;
        case 2:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(574, 38)];
            break;
        case 3:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(934, 38)];
            break;
            
        default:
            break;
    }
    //update buttons in timeline
    for (int i = 0; i < [[_timeLine timelinePoints]count]; i++)
    {
        UIButton *currentButton = [[_timeLine timelinePoints] objectAtIndex:i];
        if (i == currentPage)
        {
            [currentButton setSelected:YES];
        } else{
            [currentButton setSelected:NO];
        }
    }
}
-(void)scrollCompleted{
    
    [_timelineScrollView setScrollEnabled:YES];
    currentPage = [_timelineScrollView contentOffset].x /1024 ;
    //figure out scroll views current page... pan map to point declared in TimelineContentView
    CGFloat pageWidth = _timelineScrollView.frame.size.width;
    int page = floor((_timelineScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    TimelineContentView *newPage = (TimelineContentView *)[_timelinePages objectAtIndex:page];
    CGPoint pointOnMap = [newPage getPointOnMap];
    //[_delegate updateMapToPoint:pointOnMap withZoom:1];
    [_mapScrollView scrollRectToVisible:CGRectMake(pointOnMap.x, pointOnMap.y, 1024, 768) animated:YES];
    
    
    //update buttons in timeline
    for (int i = 0; i < [[_timeLine timelinePoints]count]; i++)
    {
        UIButton *currentButton = [[_timeLine timelinePoints] objectAtIndex:i];
        if (i == currentPage)
        {
            [currentButton setSelected:YES];
        } else{
            [currentButton setSelected:NO];
        }
    }
    
    //updates maps view currently
    //need to update playhead on timeline
    switch (page) {
        case 0:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(175, 38)];
            break;
        case 1:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(343, 38)];
            break;
        case 2:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(574, 38)];
            break;
        case 3:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(934, 38)];
            break;
            
        default:
            break;
    }
    
    //update uiimageviews... change image and fade back in
    [_imageView1 setImage:[(TimelineContentView *)[_timelinePages objectAtIndex:page] image1]];
    [_imageView2 setImage: [(TimelineContentView *)[_timelinePages objectAtIndex:page] image2]];
    [UIView animateWithDuration:.25 animations:^{
        [_imageView1 setAlpha:1.0];
        [_imageView2 setAlpha:1.0];
    }];
}

-(IBAction)updateTimelineToPoint:(NSNumber *) page
{
    //The following code will adjust the timeline in the app when the user presses a button on the timeline
    /*
     Algorithm:
        move scroll view
        move map
        updaate images
     */
    [_timelineScrollView scrollRectToVisible:CGRectMake(1024*[page integerValue], 0, 1024, 550) animated:YES];
    
    TimelineContentView *newPage = (TimelineContentView *)[_timelinePages objectAtIndex:[page integerValue]];
    //need to update playhead on timeline
    switch ([page integerValue]) {
        case 0:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(175, 38)];
            break;
        case 1:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(343, 38)];
            break;
        case 2:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(574, 38)];
            break;
        case 3:
            [_timeLine updatePlayHeadLocationToPoint:CGPointMake(934, 38)];
            break;
            
        default:
            break;
    }
    //each timeline entry has a corresponding location in the map
    //the following code grabs the point on the map that corresponds to the new timeline position
    CGPoint pointOnMap = [newPage getPointOnMap];
    [_mapScrollView scrollRectToVisible:CGRectMake(pointOnMap.x, pointOnMap.y, 1024, 768) animated:YES];
    
    [UIView animateWithDuration:.25 animations:^{
        [_imageView1 setAlpha:0.0];
        [_imageView2 setAlpha:0.0];
    } completion:^(BOOL finished) {
        //readjust the images on the timeline
        [_imageView1 setImage:[(TimelineContentView *)[_timelinePages objectAtIndex:[page integerValue]] image1]];
        [_imageView2 setImage: [(TimelineContentView *)[_timelinePages objectAtIndex:[page integerValue]] image2]];
    
        [UIView animateWithDuration:.25 animations:^{
            [_imageView1 setAlpha:1.0];
            [_imageView2 setAlpha:1.0];
        }];
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollCompleted];
    
}
//how to establish when the scroll view pages...
/*
 User swipes, view is let go... scrollViewDidStopDecelerating will tell us when the scroll view settles... 
 when that is called, we want to update the images, and update the maps location in the background
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)changeMode:(id)sender{
   // [(AppDelegate *)[[UIApplication sharedApplication]delegate] switchToMapMode];
}

@end
