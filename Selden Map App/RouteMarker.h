//
//  RouteMarker.h
//  Selden Map App
//
//  Created by itgmadmin on 5/19/13.
//
//

#import "OBShapedButton.h"
@protocol RouteMarkerDelegate<NSObject>
-(IBAction)routeMarkerPressed:(id)sender;
@end

@interface RouteMarker : UIButton
{
    UIImage *routeMarkerImage;
}
@property (nonatomic) CGPoint location;
@property (nonatomic, strong) NSString *routeName;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic) CGRect imageFrame;
-(id)initWithLocation:(CGPoint)markerLocation name:(NSString *)name;
@end
