//
//  SlidingViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 12/8/12.
//
//

#import "SlidingViewController.h"

@interface SlidingViewController ()

@property (nonatomic, strong) UIView *drawerSnapshot;

@property (nonatomic, unsafe_unretained) CGFloat initialTouchPositionX;
@property (nonatomic, unsafe_unretained) CGFloat initialHoizontalCenter;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) UITapGestureRecognizer *dismissModalGesture;
@property (nonatomic, unsafe_unretained) DrawerSide drawerState;

//ACCESS METHODS
-(UIView *)drawerView;
-(UIView *)baseView;

//PAN GESTURE METHODS
- (void)updateDrawerCenterWithRecognizer:(UIPanGestureRecognizer *)recognizer;
- (void)updateDrawerCenter:(CGFloat)newCenter;

- (BOOL)verifyGesture:(UIGestureRecognizer *)recognizer;

//PROPERTY METHODS
-(CGFloat)drawerCenterAtLeft;
-(CGFloat)drawerCenterAtPreview;
-(CGFloat)drawerCenterAtRight;

@end

@implementation SlidingViewController
@synthesize baseViewController = _baseViewController, drawerViewController = _drawerViewController, drawerLeftPeekAmount =_drawerLeftPeekAmount, drawerPreviewPeekAmount = _drawerPreviewPeekAmount, fullScreenButton = _fullScreenButton, titleViewController = _titleViewController;
@synthesize initialHoizontalCenter = _initialHoizontalCenter, initialTouchPositionX = _initialTouchPositionX, panGesture = _panGesture, tapGesture = _tapGesture, drawerState = _drawerState, dismissModalGesture = _dismissModalGesture, timelineButton = _timelineButton;

/*
 Think about initialization... previous controller had user manually insert view controllers for the top and base views. 
 
 */
-(id)initWithDrawerViewController:(DrawerViewController *)drawerVC BaseViewController:(BaseViewController *)baseVC
{
    self = [super init];
    if (self)
    {
        _drawerViewController = drawerVC;
        _baseViewController = baseVC;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //CREATE NAVIGATION BAR, ADJUST AND ADD VIEWS
   /* _navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 768, 44)];
    UINavigationItem *baseItem = [[UINavigationItem alloc]initWithTitle:@"The Selden Map"];
    [baseItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithTitle:@"FullScreen" style:UIBarButtonItemStylePlain target:self action:@selector(pushModalMap:)]];
    [_navBar pushNavigationItem:baseItem animated:NO];
    
    [[self view] addSubview:_navBar];
    */
        
    //METHOD TO PLACE DRAWERVIEW IN FRAME
    [[_baseViewController view]setFrame:CGRectMake(0, 0, 768, 1024)];
    [[_drawerViewController view]setFrame:CGRectMake(-738,52,768,299)];
    [[self view] addSubview:[_baseViewController view]];
    //[[self view]addSubview:[_drawerViewController view]];
    
    //PLACING FULL SCREEN BUTTON
    
    
    //PLACING FULL SCREEN BUTTON
    /*_timelineButton = [[OBShapedButton alloc]initWithFrame:CGRectMake(5, 900, 64, 36)];
    [_timelineButton setBackgroundImage:fullScreenImage forState:UIControlStateNormal];
    [_timelineButton addTarget:self action:@selector(switchToTimeline:) forControlEvents:UIControlEventTouchUpInside];
    [[self view]addSubview:_timelineButton];*/

    //PLACE TITLE VIEW CONTROLLER
    /*
    _titleViewController = [[TitleViewController alloc]init];
    [[_titleViewController view]setFrame:CGRectMake(260, 5, 164, 36)];
    [[self view] addSubview:[_titleViewController view]];
    [_drawerViewController setTitleView:[_titleViewController titleTextView]];
    */
     
    //SET UP TAP AND PAN GESTURES FOR SPECIFIC AREAS
    /*
    _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(drawerTapped:)];
    _panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(updateDrawerCenterWithRecognizer:)];
    
    [[self drawerView] addGestureRecognizer:_tapGesture];
    [[self drawerView] addGestureRecognizer:_panGesture];
     
     */
    
    //INITIALIZING PROPERTIES
    _drawerLeftPeekAmount = 30.0f;
    _drawerPreviewPeekAmount = 165.0f;
    _drawerState = DrawerLeft;
    
    //SETTING UP SELF AS DELEGATE
    [_drawerViewController.provinceViewController setCurrentDelegate:self];
    
    [[ContentViewController sharedStore]setBaseVC:_baseViewController];
}

//rotation code
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (UIInterfaceOrientationPortrait == toInterfaceOrientation);
}
-(BOOL)shouldAutorotate{
    //make call to method to place timeline view in app.
    //this view can autorotate for now for the sake of the prototype
    
    return YES;
}
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
//ACCESSOR METHODS
-(UIView *)drawerView
{
    return [_drawerViewController view];
}
-(UIView *)baseView
{
    return [_baseViewController view];
}


//Gesture Methods
-(void)drawerTapped:(UITapGestureRecognizer *)recognizer
{
    //Tap Algorithm... when from either fully compressed or preview  expands out. When tapped from expanded, returns to previous state
    if (_drawerState == DrawerLeft)
    {
        if ([self verifyGesture:recognizer])
        {
            //title needs to animate here
            [self anchorDrawerTo:DrawerPreview];
        }
    } else
    {
        if ([self verifyGesture:recognizer])
        {
            [self anchorDrawerTo:DrawerLeft];
        }
    }
}

-(BOOL)verifyGesture:(UIGestureRecognizer *)recognizer {
    CGPoint gestLocation = [recognizer locationInView:[self drawerView]];
    if (gestLocation.x >= 768 - _drawerPreviewPeekAmount)
    {
        return true;
    }
    return false;
}

-(void)updateDrawerCenterWithRecognizer:(UIPanGestureRecognizer *)recognizer
{
    if (![self verifyGesture:recognizer])
    {
        return;
    }
    CGPoint currentTouchPoint = [recognizer locationInView:self.view];
    CGFloat currentTouchPositionX = currentTouchPoint.x;
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        _initialTouchPositionX = currentTouchPositionX;
        _initialHoizontalCenter = self.drawerView.center.x;
    } else
    {
        CGFloat panAmount = _initialTouchPositionX - currentTouchPositionX;
        CGFloat newCenterPosition = _initialHoizontalCenter - panAmount;
        if (recognizer.state == UIGestureRecognizerStateChanged)
        {
        //find pan amount, new center position, update drawer center
        //aka find the change in touch location
        
            [self updateDrawerCenter:newCenterPosition];
        } else if ((recognizer.state == UIGestureRecognizerStateEnded) || (recognizer.state == UIGestureRecognizerStateCancelled))
        {
            //grab velocity
            //code to complete animation
            CGPoint currentVelocity = [recognizer velocityInView:self.view];
            CGFloat currentVelocityX = currentVelocity.x;
            /*
             //think about this
            //we have the magnitude of the velocity
            //we need to test this value to determine which direction to throw the drawer
             */
            //when do we want to push the drawer to the right
            //when velocity is over 100 and the horizontal center is greater than the preview center
            if (currentVelocityX > 100)//going right
            {
                [_titleViewController animateTitle:YES];
                if (!(newCenterPosition >= self.drawerCenterAtPreview))
                {
                    [self anchorDrawerTo:DrawerPreview];
                }
                //when do we want to push the drawer to its previous state... when the velocity is either negative and greater than 100
            }
            else if (currentVelocityX < -100)//going left
            {
                if (newCenterPosition < self.drawerCenterAtPreview)
                {
                    [self anchorDrawerTo:DrawerLeft];
                } else {
                    [self anchorDrawerTo:DrawerPreview];
                }
            }
            else {
                [self anchorDrawerTo:_drawerState];
            }
        }
    }
}

-(void)anchorDrawerTo:(DrawerSide)side
{
    [self anchorDrawerTo:side animations:nil onComplete:nil];
}


-(void)anchorDrawerTo:(DrawerSide)side animations:(void(^)()) animations onComplete:(void (^)())complete
{
    /*
     Algorithm
        commit animations to anchor view to necessary position
        commit completion animations
     */
    _drawerState = side;
    
    CGFloat newCenter = self.drawerView.center.x;
    
    if (side == DrawerLeft){
        newCenter = self.drawerCenterAtLeft;
        [_titleViewController animateTitle:NO];
    }
    else if (side == DrawerPreview){
        newCenter = self.drawerCenterAtPreview;
        [_titleViewController animateTitle:YES];
    }
    else
        newCenter = self.drawerCenterAtRight;
    
    [UIView animateWithDuration:.25f animations:^{
        if (animations){
            animations();
        }
        [self updateDrawerCenter:newCenter];
    } completion:^(BOOL finished){
        if (complete)
            complete();
        //code to potentially add snapshot?
        
    }];
}

- (void)updateDrawerCenter:(CGFloat)newCenter
{
    CGPoint center = self.drawerView.center;
    if (!(newCenter > self.drawerCenterAtPreview))
    {
        center.x = newCenter;
    } else
        center.x = self.drawerCenterAtPreview;
    self.drawerView.layer.position = center;
}


//PROPERTY METHODS
- (CGFloat)drawerCenterAtLeft
{
    return -self.drawerCenterAtRight + self.drawerLeftPeekAmount;
}

-(CGFloat)drawerCenterAtPreview
{
    return -self.drawerCenterAtRight + self.drawerPreviewPeekAmount;
}

- (CGFloat)drawerCenterAtRight
{
    return 768/2;
}

//NAV BAR METHODS
-(IBAction)pushModalMap:(id)sender
{
    //method will present the full screen version of the map
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:@"map_fullscreen" ofType:@"png"];
    UIImage *mapImage = [[UIImage alloc]initWithContentsOfFile:imagePath];
    UIImageView *mapImageView = [[UIImageView alloc]initWithImage:mapImage];
    UIViewController *modalVC = [[UIViewController alloc]init];
    [[modalVC view]addSubview:mapImageView];
    
    //setting up map
    UIImage *fullScreenImage = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fullscreen_button" ofType:@"png"]];
   OBShapedButton *modalDismissButton= [[OBShapedButton alloc]initWithFrame:CGRectMake(5, 983, 64, 36)];
    [modalDismissButton setBackgroundImage:fullScreenImage forState:UIControlStateNormal];
    [modalDismissButton addTarget:self action:@selector(dismissModalMap:) forControlEvents:UIControlEventTouchUpInside];
    [[modalVC view]addSubview:modalDismissButton];
    [modalVC setModalPresentationStyle:UIModalPresentationFullScreen];
    [modalVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    
    [self presentViewController:modalVC animated:YES completion:nil];
}

-(IBAction)dismissModalMap:(id)sender
{
    [self dismissModalViewControllerAnimated:(YES)];
    [_dismissModalGesture removeTarget:self action:@selector(dismissModalMap:)];
}
-(IBAction)switchToTimeline:(id)sender{
    //AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    //[mainDelegate switchToTimeline];
}

//PROVINCE INFO VIEW DELEGATE METHODS
-(void)updateScrollViewLocationTo:(CGPoint)location{
    [_baseViewController.mapView setZoomScale:1.0 animated:YES];
    [_baseViewController.mapView scrollRectToVisible:CGRectMake(location.x-376+53, location.y-512+53, 768, 1024) animated:YES];
    //PIGGY BACKING ONTO THIS METHOD...
    [self anchorDrawerTo:DrawerPreview];
}
-(void)updateProvinceNameTo:(NSString *)provinceName
{
    [_titleViewController.titleTextView setText:provinceName];
}









@end
