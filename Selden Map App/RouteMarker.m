//
//  RouteMarker.m
//  Selden Map App
//
//  Created by itgmadmin on 5/19/13.
//
//

#import "RouteMarker.h"

@implementation RouteMarker
@synthesize location = _location, routeName = _routeName;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithLocation:(CGPoint)markerLocation name:(NSString *)name
{
    self = [super init];
    if (self){
        [self setFrame:CGRectMake(0, 0, 102, 125)];
        _location = markerLocation;
        [self setBackgroundImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"route_marker" ofType:@"png"]] forState:UIControlStateNormal];
        _routeName = name;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
