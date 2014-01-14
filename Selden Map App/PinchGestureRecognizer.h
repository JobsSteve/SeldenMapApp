//
//  PanGestureRecognizer.h
//  Selden Map App
//
//  Created by Corey Zanotti on 5/15/13.
//
//

#import <UIKit/UIKit.h>
@protocol PinchDelegate
-(void)respondToPanGestureWithTouches:(NSSet *)touches event:(UIEvent *)event;

@end

@interface PinchGestureRecognizer : UIPinchGestureRecognizer
@property (nonatomic, retain) id<PinchDelegate> delegate;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
