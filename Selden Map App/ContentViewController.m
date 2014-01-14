//
//  PortFactory.m
//  SeldenMap
//
//  Created by Corey Zanotti on 8/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContentViewController.h"
#import "Ports.h"
#import "PortButton.h"
#import "ProvinceButton.h"
#import "storage.h"
#import "BaseViewController.h"

/*
 Port factory is a singleton that creates an array of data regarding the ports on the map
 */
@implementation ContentViewController
@synthesize routeImageView, isRetina, topVC, baseVC = _baseVC, province_btns = _province_btns, mainView = _mainView;

-(id)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

+(ContentViewController *)sharedStore
{
    static ContentViewController *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[ContentViewController alloc]init];
    return sharedStore;
}



-(UIViewController *)createContentViewController;
{
    return [[UIViewController alloc]init];
}
-(void)loadPortsOnView{

}
-(void)removePortsFromView
{
    
}
-(void)loadProvincesOnView{
    if (!provinceButtons)
    {
        _province_btns = [[NSMutableArray alloc]init];
        for (Province *province in [[storage sharedStore] allProvinces])
        {
            ProvinceButton *button = [[ProvinceButton alloc]initWithLocation:[province location] type:[NSNumber numberWithInt:1]];
            [button setProvinceName:[province name]];
            [button setDelegate:_baseVC];
            //[button addTarget:self action:@selector(provincePressed:) forControlEvents:UIControlEventTouchUpInside];
            [_province_btns addObject:button];
            //declare a button press listener 
        }
    }
    for (ProvinceButton *province in _province_btns)
    {
        //[province setAlpha:0.0];
        [_mainView addSubview:province];
        CGPoint newLocation = [[self view] convertPoint:CGPointMake(province.location.x, province.location.y) toView:_mainView];
        [province setFrame:CGRectMake(newLocation.x, newLocation.y-50, 102, 102)];
        [UIView animateWithDuration:.2 animations:^{
            [province setAlpha:.5];
            [province setFrame:CGRectMake(newLocation.x, newLocation.y+15, 102, 102)];
        }
                         completion:^(BOOL finished){
                             [UIView animateWithDuration:.1 animations:^{
                                 [province setAlpha:1.0];
                                 [province setFrame:CGRectMake(newLocation.x, newLocation.y, 102, 102)];
                             }];
                         }];
    }
    provincesDisplayed = !provincesDisplayed;
}
-(void)removeProvincesFromView
{
    for (ProvinceButton *province in _province_btns)
    {
        [UIView animateWithDuration:.7 animations:^{
            [province setAlpha:.0];
            [province setFrame:CGRectMake(province.location.x, province.location.y-20, 106, 106)];
        }
                         completion:^(BOOL finished){
                             [province removeFromSuperview];
                         }];
    }
}
-(void)loadRouteImageOnView
{
    //grab image
    //animate onto self.view
    if (!routeImageView){
       // UIImage *routeImage = [[UIImage alloc]initWithContentsOfFile:@"routeImage.png"];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"routeImage" ofType:@"png"];
        UIImage *routeImage = [[UIImage alloc]initWithContentsOfFile:path];
        routeImageView = [[UIImageView alloc]initWithImage:routeImage];
        //[self.view addSubview:routeImageView];
        routeImageView.alpha = 0.0;
    }
    if (![[self.view subviews]containsObject:routeImageView])
    {
        [self.view addSubview:routeImageView];
        routeImageView.alpha = 0.0;
        [UIView animateWithDuration:2.0 animations:^{
            routeImageView.alpha = 1.0;
        }];
    } else {
        [routeImageView removeFromSuperview];
    }
}

//Delegate Method

-(IBAction)portPressed:(id)sender{
}
-(IBAction)provincePressed:(id)sender{
    
    //ProvinceInfoView *infoViewController = [topVC provinceViewController];
    
    //[infoViewController setCurrentProvince:prov];
    //[infoViewController setInformationForCurrentProvince];
    
    [[[_baseVC label] view]setAlpha:0];
    //need code to grab button information from storage
}





@end
