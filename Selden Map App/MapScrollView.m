//
//  mapScrollView.m
//  Selden Map App
//
//  Created by Corey Zanotti on 5/13/13.
//
//

#import "MapScrollView.h"

@implementation MapScrollView
@synthesize pinchGesture = _pinchGesture;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer{
    if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]])
    {
        _pinchGesture = (UIPinchGestureRecognizer *)gestureRecognizer;
    }
    [super addGestureRecognizer:gestureRecognizer];
    return; 
}
//-(void)touches
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)contentView{
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches withEvent:event];
}

@end
