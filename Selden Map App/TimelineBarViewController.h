//
//  TimelineBarViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 4/25/13.
//
//

#import <UIKit/UIKit.h>
#import "OBShapedButton.h"
@protocol TimelineButtonDelegate <NSObject>

-(IBAction)updateTimelineToPoint:(NSNumber *) page;

@end

@interface TimelineBarViewController : UIViewController
@property (nonatomic, retain) UIImageView *timeline;
@property (nonatomic, retain) OBShapedButton *playHead;
@property (nonatomic, retain) NSMutableArray *timelinePoints;
@property (nonatomic) id<TimelineButtonDelegate> delegate;

-(void)updateTimelineButtonsToPage:(NSInteger *) page;
-(void)updatePlayHeadLocationToPoint: (CGPoint) newPoint;

@end
