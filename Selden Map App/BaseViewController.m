//
//  BaseViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 12/10/12.
//
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize mapView = _mapView, label = _label;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //SCROLL VIEW SETUP
    _mapView = [self setUpScrollView];
    [[self view]addSubview:_mapView];
    
    
    backgroundBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 918, 768, 92)];
    [backgroundBar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"backbar" ofType:@"png"]]];
    [[self view] addSubview:backgroundBar];
	//BUTTON SETTUP
    
    //full screen button
    
    NSString *onPath = [[NSBundle mainBundle]pathForResource:@"prov" ofType:@"png"];
    UIImage *onImage = [[UIImage alloc]initWithContentsOfFile:onPath];
    NSString *offPath = [[NSBundle mainBundle]pathForResource:@"prov_off" ofType:@"png"];
    UIImage *offImage = [[UIImage alloc]initWithContentsOfFile:offPath];
    NSString *backgroundPath = [[NSBundle mainBundle]pathForResource:@"ring" ofType:@"png"];
    UIImage *backgroundImage = [[UIImage alloc]initWithContentsOfFile:backgroundPath];
    provinceButton = [[InterfaceAnimatedButton alloc]initWithButtonImageForUnselected:offImage selected:onImage background:backgroundImage];
    [[self view] addSubview:[provinceButton view]];
    [provinceButton setDelegate:self];
    [[provinceButton view]setFrame:CGRectMake(650, 911, 115, 115)];
    //location: (927,
    
    onPath = [[NSBundle mainBundle]pathForResource:@"port" ofType:@"png"];
    onImage = [[UIImage alloc]initWithContentsOfFile:onPath];
    offPath = [[NSBundle mainBundle]pathForResource:@"port_off" ofType:@"png"];
    offImage = [[UIImage alloc]initWithContentsOfFile:offPath];
    //backgroundPath = [[NSBundle mainBundle]pathForResource:@"port_icon_back" ofType:@"png"];
    backgroundImage = [[UIImage alloc]initWithContentsOfFile:backgroundPath];
    portButton = [[InterfaceAnimatedButton alloc]initWithButtonImageForUnselected:offImage selected:onImage background:backgroundImage];
    [[self view] addSubview:[portButton view]];
    [portButton setDelegate:self];
    [[portButton view]setFrame:CGRectMake(436, 911, 115, 115)];
    
    onPath = [[NSBundle mainBundle]pathForResource:@"route" ofType:@"png"];
    onImage = [[UIImage alloc]initWithContentsOfFile:onPath];
    offPath = [[NSBundle mainBundle]pathForResource:@"route_off" ofType:@"png"];
    offImage = [[UIImage alloc]initWithContentsOfFile:offPath];
    backgroundImage = [[UIImage alloc]initWithContentsOfFile:backgroundPath];
    routeButton = [[InterfaceAnimatedButton alloc]initWithButtonImageForUnselected:offImage selected:onImage background:backgroundImage];
    [[self view] addSubview:[routeButton view]];
    [routeButton setDelegate:self];
    [[routeButton view]setFrame:CGRectMake(542, 911, 115, 115)];
    
    _label = [[LabelViewController alloc]init];
    [_label setDelegate:self];
    [[_label view] setFrame:CGRectMake(305, 60, 218, 90)];
    [[self view] addSubview:[_label view]];
    [[_label view]setAlpha:0];
    [[_label view]layer].anchorPoint = CGPointMake(0, 0);
    
    //[[self view]addSubview:magnifyingView];
    
    //setting the interpolation quality
    //[CGContextRef CGContext
    
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:@"map_fullscreen_black" ofType:@"png"];
    UIImage *mapImage = [[UIImage alloc]initWithContentsOfFile:imagePath];
    fullSizeMap = [[UIImageView alloc]initWithImage:mapImage];
    fullSizeMapScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 768, 1024)];
    [fullSizeMapScroll addSubview:fullSizeMap];
    
    [fullSizeMap setUserInteractionEnabled:NO];
    [fullSizeMapScroll setAlpha:1];
    //[[self view]addSubview: fullSizeMapScroll];

    [fullSizeMapScroll setMaximumZoomScale:1.4];
    [fullSizeMapScroll setMinimumZoomScale:1];
    [fullSizeMapScroll setContentSize:CGSizeMake(768, 1024)];
    [fullSizeMapScroll setScrollEnabled:YES];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissMap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [fullSizeMapScroll addGestureRecognizer:doubleTap];
    [fullSizeMapScroll setDelegate:self];
    [fullSizeMapScroll setFrame:CGRectMake(768, 0, 768, 1024)];
    
    titleScreenScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 768, 1024)];
    [titleScreenScroll setContentSize:CGSizeMake(1536, 768)];
    [titleScreenScroll setPagingEnabled:YES];
    [titleScreenScroll setUserInteractionEnabled:YES];
    [titleScreenScroll addSubview:fullSizeMapScroll];
    [titleScreenScroll setDelegate:self];
    [titleScreenScroll setBackgroundColor:[UIColor blackColor]];
    [titleScreenScroll setMinimumZoomScale:1];
    [titleScreenScroll setMaximumZoomScale:1];
    
    [titleScreenScroll addSubview:[[UIImageView alloc]initWithImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"titlescreen" ofType:@"png"]]]];
    
    timelineButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 15, 125, 125)];
    [timelineButton setBackgroundImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"timeline_btn" ofType:@"png"]] forState:UIControlStateNormal];
    [timelineButton addTarget:self action:@selector(adjustTimeline:) forControlEvents:UIControlEventTouchUpInside];
    timelineLabel = [[UIView alloc]initWithFrame: CGRectMake(0, 0, 491, 78)];
    [timelineLabel addSubview:[[UIImageView alloc]initWithImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"timeline_label" ofType:@"png"]]]];
    [[self view]addSubview:timelineLabel];
    [timelineLabel layer].anchorPoint = CGPointMake(0, 0);
    [timelineLabel setTransform:CGAffineTransformMakeScale(.1, 1)];
    [timelineLabel setFrame:CGRectMake(30, 40, 491, 78)];
    
    silverBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
    [silverBackground setBackgroundColor:[UIColor grayColor]];
    
    [[self view] addSubview:silverBackground];
    [silverBackground setAlpha:0];
    [silverBackground setUserInteractionEnabled:NO];
    
    

    [[self view] addSubview:timelineButton];
    
    [[self view] addSubview:titleScreenScroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
        if ([[UIDevice currentDevice]orientation] == UIInterfaceOrientationLandscapeLeft && !timelineEngaged)
        {
            timelineEngaged = true;
            [self loadTimeline];
            timelinePromptInitiated = false;
            [timelineLabel setTransform:CGAffineTransformMakeScale(.1, 1)];
        }
    return UIInterfaceOrientationMaskPortrait;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
        return UIInterfaceOrientationPortrait;
}

-(MapScrollView *)setUpScrollView
{
    //establishing the scroll view
    CGRect screenRect = CGRectMake(0,0, 768, 1024);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"fullsize_map_downsized" ofType:@"png"];
    
    MapScrollView *returnView = [[MapScrollView alloc] initWithFrame:screenRect];
    [returnView setMinimumZoomScale:.3];
    [returnView setMaximumZoomScale:1];
    [returnView setDelegate:self];
    [returnView setBounces:NO];
    [returnView setContentOffset:CGPointMake(500, 500)];
    //[returnView setZoomScale:.3];
    

    
    mapBackground = [[UIImageView alloc]initWithImage:[[UIImage alloc]initWithContentsOfFile:path]];
    
        
    contentView = [[UIView alloc]init];
    [contentView setFrame:[mapBackground bounds]];
    [contentView addSubview:mapBackground];
    [returnView addSubview: contentView];
    [returnView setContentSize:CGSizeMake(3193, 4928)];
    [returnView setZoomScale:.6];
    [returnView setBouncesZoom:YES];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoomIntoMap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [returnView addGestureRecognizer:doubleTap];

    return returnView;
    
    
}//Animation Delegate Method
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
}
//SCROLLVIEW DELEGATE METHODS

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView == _mapView)
        return contentView;
    else 
        return fullSizeMap;
}

-(IBAction)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!(scrollView == fullSizeMapScroll))
        [self updateForScroll];
}


-(IBAction)scrollViewDidZoom:(UIScrollView *)scrollView
{

    //The following code is responsible for adding and removing a metaview of the map depending on the scrollViews' zoom values
    //Case 1: The meta view of the map is up
    if (scrollView == fullSizeMapScroll)
    {
        /*
         Algorithm:
            Determine the zoom value of the metaview
            If the zoom value is past the threshold, readjust fullSizeMap's location and animate the removal of the metaview
         */
        if ([scrollView zoomScale]> 1.3)
        {
            [self updateMapLocationToPoint:[[fullSizeMapScroll pinchGestureRecognizer] locationInView:fullSizeMap]];
            [titleScreenScroll setUserInteractionEnabled:NO];
            [UIView animateWithDuration:.5 animations:^{
                [titleScreenScroll setAlpha:0];
            } completion:^(BOOL finished) {
                [fullSizeMapScroll setZoomScale:1];
                [titleScreenScroll removeFromSuperview];
            }];
            fullScreenMapOn = NO;
        }
    }
    //Case 2: The main map is up
    else {
        /*
            Algorithm:
                If the zoom value is past the threshold, push the metaview of the map
         */
        if ([_mapView zoomScale] < .3)
        {
            if ([[_mapView pinchGesture] scale] < .16)
            {
                [self pushModalMap];
            }
        }
    }
}
/*
    updateMapLocationToPoint will grab the user's touch gesture location and scroll the map view accordingly
 */
-(void)updateMapLocationToPoint:(CGPoint)touchPoint
{
    NSInteger quadrant;
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    if (touchPoint.x < 256)
    {
        if (touchPoint.y < 342)
        {
            quadrant = 1;
        } else if (touchPoint.y < 684){
            quadrant = 3;
            offsetY = 500;
        } else {
            quadrant = 5;
            offsetY = 1063;
        }
    } else if (touchPoint.x < 512){
        offsetX = 270;
        if (touchPoint.y < 342)
        {
            quadrant = 2;
        } else if (touchPoint.y < 684){
            quadrant = 4;
            offsetY = 500;
        } else {
            quadrant = 6;
            offsetY = 1063;
        }
    } else{
        offsetX = 545;
        if (touchPoint.y < 342)
        {
            quadrant = 2;
        } else if (touchPoint.y < 684){
            quadrant = 4;
            offsetY = 500;
        } else {
            quadrant = 6;
            offsetY = 1063;
        }
        
    }
    [_mapView setZoomScale:[_mapView minimumZoomScale]];
    [_mapView setContentOffset:CGPointMake(offsetX, offsetY)];
}


-(IBAction)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"The end is nigh");
    [_label setButtonState:YES];
   // NSLog(@"contentOffset x= %f y = %f", [_mapView contentOffset].x,[_mapView contentOffset].y);
}


//BUTTON DELEGATE METHODS
-(void)provincePressedWithName:(NSString *)provinceName
{
    //go to content view controller
    //grab province info
    //put in label view controller and overlay view controller
    
}

-(IBAction)expandOrCloseMap:(id)sender
{
    if (fullScreenMapOn)
    {
        [self dismissMap:nil];
        
    } else
    {
        [self pushModalMap];
    }
}
//Interface Methods
-(void)pushModalMap
{
    [[self view] addSubview:titleScreenScroll];
    [titleScreenScroll setUserInteractionEnabled:YES];
    [UIView animateWithDuration:.5 animations:^{
        [titleScreenScroll setAlpha:1.0];
    }];    fullScreenMapOn = YES;
}

-(IBAction)dismissMap:(UITapGestureRecognizer *)sender{
    [self updateMapLocationToPoint:[sender locationInView:fullSizeMap]];
    [titleScreenScroll setUserInteractionEnabled:NO];
    [UIView animateWithDuration:.5 animations:^{
        [titleScreenScroll setAlpha:0];
    } completion:^(BOOL finished) {
        [fullSizeMapScroll setZoomScale:1];
        [titleScreenScroll removeFromSuperview];
    }];
    fullScreenMapOn = NO;
}
-(void)respondToPanGestureWithTouches:(NSSet *)touches event:(UIEvent *)event{
    [_mapView touchesBegan:touches withEvent:event];
}

-(IBAction)zoomIntoMap:(UITapGestureRecognizer *)sender{
    //get tap point
    //convert tap point to map coordinates
    //animate removal of fullsize map and zoom into scrollview at a certain location
    //[_mapView setZoomScale:<#(float)#>]
    CGFloat zoomScale;
    if (([_mapView zoomScale] + .35) >= [_mapView maximumZoomScale])
    {
        zoomScale = [_mapView maximumZoomScale];
    } else {
        zoomScale = [_mapView zoomScale] + .35;
    }
    
    CGRect zoomRect = [self zoomRectForScrollView:_mapView withScale:zoomScale withCenter:[sender locationInView:mapBackground]];
    [_mapView zoomToRect:zoomRect animated:YES];
    /*
    [_mapView scrollRectToVisible:CGRectMake(0, 0, 768, 1024) animated:NO];
    [UIView animateWithDuration:1.0 animations:^{
        [fullSizeMap setAlpha:0.0];
    } completion:^(BOOL finished) {
        [fullSizeMap removeFromSuperview];
    }];
    */
    
}
-(CGRect)zoomRectForScrollView:(UIScrollView *)scrollView withScale:(float)scale withCenter:(CGPoint)center{
    
    CGRect zoomRect;
    
    zoomRect.size.height = scrollView.frame.size.height / scale;
    zoomRect.size.width = scrollView.frame.size.width / scale;
    
    zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}
-(IBAction)dismissModalMap:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    //[_dismissModalGesture removeTarget:self action:@selector(dismissModalMap:)];
}



//USER INTERFACE METHODS

-(void)userInterfaceButtonPressed:(InterfaceAnimatedButton *)button
{
    BOOL buttonState = [(InterfaceAnimatedButton *)button buttonState];
    
    
    if ((InterfaceAnimatedButton *)button == portButton)
    {
        if (buttonState){
            [self loadPortsOnView];
        }
        else{
            [self removePortsFromView];
        }
    }
    else if ((InterfaceAnimatedButton *)button == provinceButton)
    {
        if (buttonState){
            [self loadProvincesOnView];
        }
        else{
            [self removeProvincesFromView];
        }
    }
    else{
        //Code to load routes
        if (buttonState)
        {
            [self loadRoutesOnView];
        } else {
            [self removeRoutesFromView];
        }
    }
}

-(void)animateProvince:(ProvinceButton *)province{
    
    CGPoint newLocation = [mapBackground convertPoint:CGPointMake(province.location.x, province.location.y) toView:[self view]];
    [province setFrame:CGRectMake(newLocation.x,newLocation.y -500, 102, 102)];
    //int count = 1;
    [[self view]addSubview:province];
    [UIView animateWithDuration:.2 animations:^{
        [province setAlpha:.5];
        [province setFrame:CGRectMake(province.frame.origin.x, province.frame.origin.y+515, 102, 102)];
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:.1 animations:^{
                             [province setAlpha:1.0];
                             [province setFrame:CGRectMake(province.frame.origin.x, province.frame.origin.y -15, 102, 102)];
                         }];
                     }];
    
}
-(void)animateRoute:(RouteMarker *)province{
    
    CGPoint newLocation = [mapBackground convertPoint:CGPointMake(province.location.x, province.location.y) toView:[self view]];
    [province setFrame:CGRectMake(newLocation.x - 51,newLocation.y -500, 102, 125)];
    //int count = 1;
    [[self view]addSubview:province];
    [UIView animateWithDuration:.2 animations:^{
        [province setAlpha:.5];
        [province setFrame:CGRectMake(province.frame.origin.x, province.frame.origin.y+515-125, 102, 125)];
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:.1 animations:^{
                             [province setAlpha:1.0];
                             [province setFrame:CGRectMake(province.frame.origin.x, province.frame.origin.y -15, 102, 125)];
                         }];
                     }];
    
}


-(void)bringUIToFront{
    [[self view]bringSubviewToFront:[_label view]];
    if (provincesDisplayed)
    {
        for (ProvinceButton *button in provinceButtons)
        {
            [[self view]bringSubviewToFront:button];
        }
    }
    if (portsDisplayed)
    {
        for (ProvinceButton *button in portButtons)
        {
            [[self view]bringSubviewToFront:button];
        }
    }
    if (routesDisplayed)
    {
        for (RouteMarker *button in routeButtons)
        {
            [[self view]bringSubviewToFront:button];
        }
    }
    [[self view]bringSubviewToFront:backgroundBar];
    [[self view]bringSubviewToFront:[portButton view]];
    [[self view]bringSubviewToFront:[provinceButton view]];
    [[self view]bringSubviewToFront:[routeButton view]];
    [[self view]bringSubviewToFront:fullScreenButton];
    [[self view]bringSubviewToFront:settingsButton];
    [[self view]bringSubviewToFront:timelineLabel];
    [[self view]bringSubviewToFront:timelineButton];
}
-(void)loadProvincesOnView{
    //[[self view].layer removeAllAnimations];
    loadingProvinces = YES;
    [_mapView setZoomScale:[_mapView minimumZoomScale] animated:YES];
    [_mapView setContentOffset:CGPointMake(0, 119) animated:YES];
    
    if (!provinceButtons)
    {
        provinceButtons = [[NSMutableArray alloc]init];
        for (Province *province in [[storage sharedStore] allProvinces])
        {
            ProvinceButton *button = [[ProvinceButton alloc]initWithLocation:[province location] type:[NSNumber numberWithInt:2]];
            [button setProvinceName:[province name]];
            [button setDelegate:self];
            //[button addTarget:self action:@selector(provincePressed:) forControlEvents:UIControlEventTouchUpInside];
            [provinceButtons addObject:button];
            //declare a button press listener
        }
    }
    float animationDelay = 0;
    int count = 1;
    for (ProvinceButton *province in provinceButtons)
    {
        [province setAlpha:0.0];
        
        [[self view] addSubview:province];
        
        [self performSelector:@selector(animateProvince:) withObject:province afterDelay:.2 + animationDelay];
        animationDelay +=.03;
        count++;
        if (count == provinceButtons.count)
        {
            //finished animating, switch boolean
            loadingProvinces = NO;
        };
    }
    provincesDisplayed = YES;
    [self performSelector:@selector(bringUIToFront) withObject:nil afterDelay:1];
}

-(void)removeProvincesFromView
{
    provincesDisplayed = NO;
    provinceVisible = NO;
    for (ProvinceButton *province in provinceButtons)
    {
        [UIView animateWithDuration:.3 animations:^{
            //[province setAlpha:.0];
            
            if (currentButtonOpen == province)
            {
                [[_label view] setAlpha:0.0];
                [[_label view] setFrame:CGRectMake([[_label view] frame].origin.x, [[_label view] frame].origin.y-10, 106, 106)];
                currentButtonOpen = nil;
            }
            [province setFrame:CGRectMake([province frame].origin.x, [province frame].origin.y-10, 106, 106)];
            [province setAlpha:0.0];
        }
                         completion:^(BOOL finished){
                             if (!loadingProvinces)
                             {
                                 [province removeFromSuperview];
                             }
                         }];
    }
}
-(void)loadPortsOnView{
    loadingPorts = YES;
    
    [_mapView setZoomScale:[_mapView minimumZoomScale] animated:YES];
    [_mapView setContentOffset:CGPointMake(545, 315) animated:YES];
    
    //[[self view].layer removeAllAnimations];
    if (!portButtons)
    {
        portButtons = [[NSMutableArray alloc]init];
        for (Ports *port in [[storage sharedStore] allPorts]){
            ProvinceButton *newButton = [[ProvinceButton alloc]initWithLocation:[port location] type:[NSNumber numberWithInt:1]];
            [newButton setProvinceName:[port name]];
            [newButton setDelegate:self];
            [portButtons addObject:newButton];
        }
    }
    int count = 1;
    float animationDelay = 0;
    for (ProvinceButton *button in portButtons)
    {
        [[self view] addSubview:button];
        [button setAlpha:0];
        [self performSelector:@selector(animateProvince:) withObject:button afterDelay:.2 + animationDelay];
        animationDelay +=.03;
        count++;
        if (count == portButtons.count)
        {
            //finished animating, switch boolean
            loadingPorts = NO;
        };
    }
    [self performSelector:@selector(bringUIToFront) withObject:nil afterDelay:1];
    portsDisplayed = YES;
}
-(void)removePortsFromView
{
    portsDisplayed = NO;
    for (ProvinceButton *port in portButtons)
    {
        
        [UIView animateWithDuration:.3 animations:^{
            //[province setAlpha:.0];
            if (currentButtonOpen == port)
            {
                [[_label view] setAlpha:0.0];
                [[_label view] setFrame:CGRectMake([[_label view] frame].origin.x, [[_label view] frame].origin.y-10, 106, 106)];
                currentButtonOpen = nil;
            }
            [port setFrame:CGRectMake([port frame].origin.x, [port frame].origin.y-10, 106, 106)];
            [port setAlpha:0];
        }
                         completion:^(BOOL finished){
                             if (!loadingPorts)
                             {
                                 [port removeFromSuperview];
                             }
                         }];
    }
}

-(void)loadRoutesOnView{
    loadingRoutes = YES;
    if (!routeButtons)
    {
        routeButtons = [[NSMutableArray alloc]init];
        RouteMarker *routeButton1 = [[RouteMarker alloc]initWithLocation:CGPointMake(996, 3578) name:@"Main Route to Nagasaki"];
        [[routeButton1 layer] setAnchorPoint:CGPointMake(51, 122)];
        [routeButton1 setImageFrame:CGRectMake(710, 1289, 3198, 3198)];
        [routeButton1 setImageName:@"route_1"];
        [routeButton1 addTarget:self action:@selector(processRouteButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [routeButtons addObject:routeButton1];
        
        RouteMarker *routeButton2 = [[RouteMarker alloc]initWithLocation:CGPointMake(50, 2935) name:@"Route from Yellow River"];
        [[routeButton2 layer] setAnchorPoint:CGPointMake(51, 122)];
        [routeButton2 setImageFrame:CGRectMake(5, 2965, 2119, 3331)];
        [routeButton2 setImageName:@"route_2"];
        [routeButton2 addTarget:self action:@selector(processRouteButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [routeButtons addObject:routeButton2];
    }
    int count = 1;
    float animationDelay = 0;
    for (RouteMarker *button in routeButtons)
    {
        [[self view] addSubview:button];
        [button setAlpha:0];
        [self performSelector:@selector(animateRoute:) withObject:button afterDelay:.2 + animationDelay];
        animationDelay +=.03;
        count++;
        if (count == routeButtons.count)
        {
            //finished animating, switch boolean
            loadingRoutes = NO;
        };
    }
    [self performSelector:@selector(bringUIToFront) withObject:nil afterDelay:1];
    routesDisplayed = YES;
    //[mapBackground setImage:routesImage];
    //[contentView addSubview:routes];
}
-(void)removeRoutesFromView{
    routesDisplayed = NO;
    for (RouteMarker *route in routeButtons)
    {  
        [UIView animateWithDuration:.3 animations:^{
            //[province setAlpha:.0];
            if (currentButtonOpen == route)
            {
                [[_label view] setAlpha:0.0];
                [[_label view] setFrame:CGRectMake([[_label view] frame].origin.x, [[_label view] frame].origin.y-10, 106, 106)];
                currentButtonOpen = nil;
            }
            [route setAlpha:0];
        }
                         completion:^(BOOL finished){
                             if (!loadingRoutes)
                             {
                                 [route removeFromSuperview];
                             }
                         }];
    }
    /*[UIView animateWithDuration:1.0 animations:^{
        [routes setAlpha:0.0];
    } completion:^(BOOL finished) {
        [routes removeFromSuperview];
        [contentView addSubview:mapBackground];
    }];*/
    //[mapBackground setImage:mapImage];
}
-(IBAction)processRouteButtonPress:(id)sender
{
    RouteMarker *markerPressed = (RouteMarker *)sender;
    if (markerPressed == currentButtonOpen)
    {
        [self closeButtonLabel];
        currentButtonOpen = nil;
        [UIView animateWithDuration:.5 animations:^{
            [routeImage setAlpha:0];
        }];
    }
    else{
        [_label setProvinceName:[markerPressed routeName]];
        
        currentButtonOpen=markerPressed;
        [self changeLabelLocation];
        
        if (!routeImage){
            routeImage = [[UIImageView alloc]initWithImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[markerPressed imageName] ofType:@"png"]]];
            [routeImage setFrame:[markerPressed imageFrame]];
            [routeImage setAlpha:0];
            [contentView addSubview:routeImage];
            [UIView animateWithDuration:.5 animations:^{
                [routeImage setAlpha:1];
            }];
        } else{
            [UIView animateWithDuration:.5 animations:^{
                [routeImage setAlpha:0];
            } completion:^(BOOL finished) {
                [routeImage setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[markerPressed imageName] ofType:@"png"]]];
                [routeImage setFrame:[markerPressed imageFrame]];
                [UIView animateWithDuration:.5 animations:^{
                    [routeImage setAlpha:1];
                }];
            }];
        }
    }
}
-(IBAction)adjustTimeline:(id)sender
{
    //animate timeline label to reveal prompt
    if (!timelinePromptInitiated)
    {
    [UIView animateWithDuration:.25 animations:^{
        //[timelineLabel setFrame:CGRectMake(30, 40, 491, 78)];
        [timelineLabel setTransform:CGAffineTransformMakeScale(1, 1)];
        //close after certain amount of time
        [self performSelector:@selector(adjustTimeline:) withObject:nil afterDelay:2];
    }];
    } else {
        [UIView animateWithDuration:.25 animations:^{
            //[timelineLabel setFrame:CGRectMake(-430, 40, 491, 78)];
            [timelineLabel setTransform:CGAffineTransformMakeScale(.1, 1)];
        }];
    }
    timelinePromptInitiated = !timelinePromptInitiated;
    //[self loadTimeline];
}
-(void)loadTimeline{
    /*
     Order of operations
     create timeline
     present timeline
     give timeline map
     */
    timeline = [[TimeViewController alloc]init];
    [timeline setDelegate:self];
    [timeline setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    [self presentViewController:timeline animated:YES completion:^{
        [_mapView removeFromSuperview];
        [_mapView setFrame:CGRectMake(0, 0, 1024, 768)];
        [timeline setMapScrollView:_mapView];
        //[[timeline mapScrollView] setZoomScale:1];
        _mapView = nil;
    }];
    
    
    //[[self view] addSubview:[timeline view]];
    //[timeline setMapScrollView:_mapView];
    
    //force change in orientation
    //UIViewController *vc = [[UIViewController alloc]init];
    //[self dismissViewControllerAnimated:NO completion:nil];
    //[[self view] bringSubviewToFront:timelineButton];
    //[((AppDelegate *)[UIApplication sharedApplication].delegate).window setRootViewController:timeline];
    
    //
    //[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
        //To load timeline
    /*
     -Animate onto screen 
     */
}
-(IBAction)removeTimeline:(id)sender{
    //grab map from timeline
    //give map back
    //remove timeline
    _mapView = [timeline mapScrollView];
    [_mapView setUserInteractionEnabled:YES];
    [[timeline mapScrollView]removeFromSuperview];
    [_mapView setFrame:CGRectMake(0, 0, 768, 1024)];
    [_mapView setZoomScale:.3];
    [timeline setMapScrollView:nil];
    [[self view] addSubview:_mapView];
    [self bringUIToFront];
    [self dismissViewControllerAnimated:YES completion:nil];
    timelineEngaged = false;
}
-(void)provincePressed:(id)sender{
    //[self provincePressedWithName:[(ProvinceButton *)sender provinceName]];
    if (currentButtonOpen != sender)
    {
        currentButtonOpen = sender;
        currentProvince = [self getInfoForProvinceWithName:[(ProvinceButton *)sender provinceName]];
        [_label setProvinceName:[(ProvinceButton *)sender provinceName]];
        [self changeLabelLocation];
    }
    else{
        [self closeButtonLabel];
    }
}
//INTERFACE UPDATE METHODS
-(void)updateForScroll{
    CGPoint newLocation;
    if(provincesDisplayed)
    {
        for (ProvinceButton *province in provinceButtons)
        {
            newLocation = [[[_mapView subviews]objectAtIndex:0] convertPoint:CGPointMake(province.location.x, province.location.y) toView:[self view]];
            [province setFrame:CGRectMake(newLocation.x, newLocation.y, 102, 102)];
        }
    }
    if (portsDisplayed)
    {
        for (ProvinceButton *port in portButtons)
        {
            newLocation = [[[_mapView subviews]objectAtIndex:0] convertPoint:CGPointMake(port.location.x, port.location.y) toView:[self view]];
            [port setFrame:CGRectMake(newLocation.x, newLocation.y, 102, 102)];
        }
    }
    if (routesDisplayed)
    {
        for (RouteMarker *route in routeButtons)
        {
            newLocation = [[[_mapView subviews]objectAtIndex:0] convertPoint:CGPointMake(route.location.x, route.location.y) toView:[self view]];
            [route setFrame:CGRectMake(newLocation.x-51, newLocation.y-125, 102, 125)];
        }
    }
    [[[_label view] layer]setFrame:CGRectMake(currentButtonOpen.frame.origin.x + 30, currentButtonOpen.frame.origin.y + 5 ,218,90)];
}

-(void)changeLabelLocation{
    if ([[_label expansion_btn]alpha]!= 0)
        [_label animateExpansionButton];
    [UIView animateWithDuration:.1 animations:^{
        [[_label view]setTransform:CGAffineTransformMakeScale(.11, 1)];
        [[_label view]setAlpha:0];
    } completion:^(BOOL finished) {
        [[[_label view] layer]setFrame:CGRectMake(currentButtonOpen.frame.origin.x, currentButtonOpen.frame.origin.y+5 ,0,0)];
        [UIView animateWithDuration:.1 animations:^{
            [[_label view]setTransform:CGAffineTransformMakeScale(1, 1)];
            [[_label view]setAlpha:1];
            [[[_label view] layer]setFrame:CGRectMake(currentButtonOpen.frame.origin.x + 30, currentButtonOpen.frame.origin.y+5 ,218,90)];
        } completion:^(BOOL finished) {
            [_label animateExpansionButton];
        }];
    }];
}
-(void)closeButtonLabel{
    [_label animateExpansionButton];
    [UIView animateWithDuration:.2 animations:^{
        [[_label view]setTransform:CGAffineTransformMakeScale(.11, 1)];
        [[_label view]setAlpha:0];
    }];
    currentButtonOpen = nil;
}
-(void)animateFromLocation{
}

//HELPER METHODS
-(Province *)getInfoForProvinceWithName:(NSString *)provinceName
{
    Province *returnProvince;
    for(Province *prov in [[storage sharedStore] allProvinces])
    {
        if ([prov name] == provinceName)
        {
            returnProvince = prov;
            return returnProvince;
        }
    }
    return nil;
}


//MODAL VIEW CONTROLLER METHODS
-(IBAction)processLabelButtonPress:(id)sender{
    UIButton *buttonPressed = (UIButton *)sender;
    CGPoint newLocation = [[buttonPressed superview] convertPoint:[buttonPressed frame].origin toView:[self view]];
    [self presentProvinceModalViewControllerFromPoint:newLocation];
}
-(void)presentProvinceModalViewControllerFromPoint:(CGPoint)point
{
    
    presentationOrigin = point;
    [_mapView setUserInteractionEnabled:NO];
    modalViewController = [[OverlayViewController alloc]initWithProvince:currentProvince];
    [[[modalViewController view] layer] setAnchorPoint:CGPointMake(0, 0)];
    [modalViewController setDelegate:self];
    //this sucks...
    //[self presentViewController:modalViewController animated:NO completion:nil];
    [modalViewController setCurrentProvince:currentProvince];
    [[modalViewController view] setAlpha:0.0];
    [[self view] addSubview:[modalViewController view]]; 
    [[modalViewController view]setFrame:CGRectMake(point.x,point.y, 668, 924)];
    [[modalViewController view] setTransform:CGAffineTransformMakeScale(.1, .1)];
    
    [[self view]bringSubviewToFront:silverBackground];
    [[self view]bringSubviewToFront:[modalViewController view]];
    
    [UIView animateWithDuration:.5 animations:^{
        [[modalViewController view] setAlpha:1];
        [[modalViewController view] setFrame:CGRectMake(50, 50, 668, 924)];
        [[modalViewController view]setTransform:CGAffineTransformMakeScale(1, 1)];
        
        [silverBackground setAlpha:.8];
        //[[_modalViewController view]setFrame:CGRectMake(25, 22, 719, 980)];
        
    }];
    //[self presentModalViewController:_modalViewController animated:NO];
}

-(IBAction)dismissOverlay:(id)sender{
    //[self dismissViewControllerAnimated:YES completion:nil];
    [_mapView setUserInteractionEnabled:YES];
    [UIView animateWithDuration:.5 animations:^{
        [[modalViewController view] setAlpha:0];
        [[modalViewController view] setFrame:CGRectMake(presentationOrigin.x, presentationOrigin.y, 668, 924)];
        [[modalViewController view] setTransform:CGAffineTransformMakeScale(.1, .1)];
        [silverBackground setAlpha:0];
    } completion:^(BOOL finished) {
    [[modalViewController view] removeFromSuperview];
    }];
}
@end
