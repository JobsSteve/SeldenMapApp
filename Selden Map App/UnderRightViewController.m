//
//  UnderRightViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "UnderRightViewController.h"
#import "ProvinceButton.h"
#import "Provinces.h"
#import "ProvinceButton.h"
#import "ContentViewController.h"
#import "storage.h"
#import "OBShapedButton.h"
#import "PortButton.h"
#import "CustomTabBar.h"

@interface UnderRightViewController()
@property (nonatomic, unsafe_unretained) CGFloat anchorLeftAmount;
@property (nonatomic, unsafe_unretained) CGFloat previewLeftAmount;
@end

@implementation UnderRightViewController
@synthesize anchorLeftAmount, mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.anchorLeftAmount = 30.0f;
    self.previewLeftAmount = 168.0f;
    [self.slidingViewController setAnchorLeftPeekAmount:self.anchorLeftAmount];
    [self.slidingViewController setPreviewLeftPeekAmount:self.previewLeftAmount];
    self.slidingViewController.underRightWidthLayout = ECVariableRevealWidth;
    [self.slidingViewController anchorTopViewTo:ECLeft animations:nil onComplete:nil];
    
    
    //putting map into view
    //declare a scroll view
    //load the map onto the scroll view
    //set bounds
    //add as subview of self.view
    //enjoy
    mapView = [self setUpScrollView];
    [[self view] addSubview:mapView];
    
    //setting up the toolbar and navigation bar OLD METHOD OUTDATED 12/6
    /*
    NSString *backgroundPath = [[NSBundle mainBundle]pathForResource:@"switches_background" ofType:@"png"];
    UIImage *toolbarBackground = [[UIImage alloc]initWithContentsOfFile:backgroundPath];
    UIImageView *toolBar = [[UIImageView alloc]initWithImage:toolbarBackground];
    
    NSString *routePath = [[NSBundle mainBundle]pathForResource:@"switches_routes_off" ofType:@"png"];
    UIImage *routeImage = [[UIImage alloc]initWithContentsOfFile:routePath];
    NSString *routeSelectedPath = [[NSBundle mainBundle]pathForResource:@"switches_routes_on" ofType:@"png"];
    UIImage *routeImageSelected = [[UIImage alloc]initWithContentsOfFile:routeSelectedPath];
    //UIImageView *route = [[UIImageView alloc]initWithImage:toolbarBackground];

    [toolBar setFrame: CGRectMake(487, 881, 282, 100)];
    OBShapedButton *provinceButton = [[OBShapedButton alloc] initWithFrame:CGRectMake(591, 892, 79, 79)];
    OBShapedButton *port_btn = [[OBShapedButton alloc] initWithFrame:CGRectMake(499, 892, 79, 79)];
    OBShapedButton *route_btn = [[OBShapedButton alloc] initWithFrame:CGRectMake(681, 892, 79, 79)];
    [port_btn setImage:[PortButton buttonImage] forState:(UIControlStateNormal)];
    [port_btn setImage:[PortButton buttonPressedImage] forState:(UIControlStateSelected)];
    [port_btn addTarget:self action:@selector(displayPorts:) forControlEvents:UIControlEventTouchUpInside];
    [provinceButton setBackgroundImage:[ProvinceButton buttonImage] forState:(UIControlStateNormal)];
    [provinceButton setBackgroundImage:[ProvinceButton buttonPressedImage] forState:(UIControlStateSelected)];
    //[provinceButton setSelected:YES];
    [provinceButton addTarget:self action:@selector(displayProvinces:) forControlEvents:UIControlEventTouchUpInside];
    [route_btn setImage:routeImage forState:(UIControlStateNormal)];
    [route_btn setImage:routeImageSelected forState:(UIControlStateSelected)];
    
    [route_btn addTarget:self action:@selector(displayRoutes:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:toolBar];
    [[self view] addSubview:port_btn];
    [[self view] addSubview:provinceButton];
    [[self view] addSubview:route_btn];
    */
    
    
    //new method to set up buttons
    /*
     Algorithm for Setup:
        Grab Image Path
        Make New Images
        Declare Button
        Add Button to self.view
        Place button
     */
    
    NSString *backgroundPath = [[NSBundle mainBundle]pathForResource:@"switches_background" ofType:@"png"];
    UIImage *toolbarBackground = [[UIImage alloc]initWithContentsOfFile:backgroundPath];
    provinceButton = [[InterfaceAnimatedButton alloc]initWithButtonImageForUnselected:toolbarBackground selected:nil];
    [[self view] addSubview:[provinceButton view]];
    [provinceButton setDelegate:self];
    [[provinceButton view]setFrame:CGRectMake(440, 864, 312, 218)];
    
    portButton = nil;
    
    //Setup the Drawer
    FirstTopViewController *topController = (FirstTopViewController *)self.slidingViewController.topViewController;
    [[ContentViewController sharedStore]setTopVC:topController];
}

-(UIScrollView *)setUpScrollView
{
    //establishing the scroll view
    CGRect screenRect = CGRectMake(0,0, 768, 1024);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"fullsize_map" ofType:@"png"];
    
    UIScrollView *returnView = [[UIScrollView alloc] initWithFrame:screenRect];
    [returnView setMinimumZoomScale:.3];
    [returnView setMaximumZoomScale:1];
    [returnView setDelegate:self];
    [returnView setBouncesZoom:NO];
    [returnView setBounces:NO];
    [returnView setContentOffset:CGPointMake(500, 500)];
    [returnView setZoomScale:.3];
    
    UIImage *map = [[UIImage alloc]initWithContentsOfFile:path];
    UIImageView *mapBackground = [[UIImageView alloc]initWithImage:map];
    
    contentView = [[ContentViewController sharedStore]view];
    [contentView setFrame:[mapBackground bounds]];
    [contentView addSubview:mapBackground];
    [returnView addSubview: contentView];
    [returnView setContentSize:CGSizeMake(3193, 4928)];
    return returnView;
}


/*
    Delegate Methods
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[ContentViewController sharedStore]adjustPopoverOnScroll];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [[mapView subviews] objectAtIndex:0];
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    //adjust the position of the callout
}

-(void)processButtonPressWithButton:(InterfaceAnimatedButton *)button
{
    BOOL buttonState = [(InterfaceAnimatedButton *)button buttonState];
    
    if ((InterfaceAnimatedButton *)button == portButton)
    {
    }
    else if ((InterfaceAnimatedButton *)button == provinceButton)
    {
        if (buttonState)
            [[ContentViewController sharedStore]loadProvincesOnView];
        else
            [[ContentViewController sharedStore]removeProvincesFromView];
    }
}

-(void)displayProvinces{
    //add province subview to scroll view
    [[ContentViewController sharedStore]loadProvincesOnView];
    
}

-(void)displayPorts{
    
    /*THEORETICAL ALGORITHM!!!!!!
     1. Access Singleton
     1a. Singleton queries database for ports
     1b. Singleton returns array of all port information needed to display the ports
     2. Create Port buttons from array data (done in port helper class)
     2a. Create Custom button class from data
     Think what data is needed to create the buttons?
     -buttons need to be connected to a popover view still
     2b. return buttons in an array
     3. Add buttons to content view
     3a. Place button onto content view from xlocation and ylocation values
     */
    //one call to port helper class?
    [[ContentViewController sharedStore]loadPortsOnView];
}

/*-(IBAction)displayRoutes:(id)sender{
    [(UIButton *)sender setSelected:![(UIButton *)sender isSelected]];
    [[ContentViewController sharedStore]loadRouteImageOnView];
}*/


@end
