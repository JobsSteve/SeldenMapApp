//
//  TimeViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 4/24/13.
//
//

#import <UIKit/UIKit.h>
#import "TimelineContentView.h"
#import "TimelineBarViewController.h"
#import "storage.h"
#import "MapScrollView.h"

@protocol timelineDelegate <NSObject>

//-(void)updateMapToPoint:(CGPoint)point withZoom:(CGFloat)zoomValue;
-(IBAction)removeTimeline:(id)sender;

@end

@interface TimeViewController : UIViewController <UIScrollViewDelegate, TimelineButtonDelegate>
{
    int currentPage;
    UIButton *backButton;
    UIButton *hitArea;
}
@property (nonatomic, strong) MapScrollView *mapScrollView;
@property (nonatomic, strong) UIScrollView *timelineScrollView;
@property (nonatomic, strong) NSMutableArray *timelinePages;
@property (nonatomic, strong) UIImageView *backgroundImage;
@property (nonatomic, strong) TimelineBarViewController *timeLine;
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic) id<timelineDelegate> delegate;

-(id)initWithMapView:(MapScrollView *)mapView;
@end
