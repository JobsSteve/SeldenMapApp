//
//  mapScrollView.h
//  Selden Map App
//
//  Created by Corey Zanotti on 5/13/13.
//
//

#import <UIKit/UIKit.h>

@interface MapScrollView : UIScrollView
@property (nonatomic, retain) UIPinchGestureRecognizer *pinchGesture;
@end
