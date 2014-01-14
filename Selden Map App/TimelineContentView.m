//
//  TimelineContentView.m
//  Selden Map App
//
//  Created by Corey Zanotti on 4/24/13.
//
//

#import "TimelineContentView.h"

@implementation TimelineContentView
@synthesize titleText = _titleText, subtitleText = _subtitleText, bodyContentText = _bodyContentText, image1 = _image1, image2 = _image2;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithTitle:(NSString *)title SubTitle:(NSString *)subtitle Body:(NSString *)body Images:(NSArray *)images ScrollPoint:(CGPoint) scrollPoint
{
    self = [super init];
    if (self)
    {
        
        
        _titleText = [[ModalTextView alloc] initWithFrame:CGRectMake(36, 15, 952, 100)];
        [_titleText setText: title];
        [_titleText setFontColor:[UIColor whiteColor]];
        [_titleText setFontSize:[NSNumber numberWithFloat:45.0]];
        [self addSubview:_titleText];
        _subtitleText = [[ModalTextView alloc]initWithFrame:CGRectMake(36, 65, 952, 100)];
        [_subtitleText setText:subtitle];
        [_subtitleText setFontColor:[UIColor whiteColor]];
        [_subtitleText setFontSize:[NSNumber numberWithFloat:36.0]];
        [self addSubview:_subtitleText];
        _bodyContentText =  [[ModalTextView alloc]initWithFrame:CGRectMake(311, 147, 384, 417)];
        [_bodyContentText setText:body];
        [_bodyContentText setFontColor:[UIColor whiteColor]];
        [_bodyContentText setFontSize:[NSNumber numberWithFloat:22.5]];
        [self addSubview:_bodyContentText];
        _image1 =[images objectAtIndex:0];
        _image2 = [images objectAtIndex:1];
        
        mapScrollPoint = scrollPoint;
        
    }
    return self;
}

-(CGPoint)getPointOnMap{
    return mapScrollPoint;
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
