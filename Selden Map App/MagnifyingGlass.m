//
//  MagnifyingGlass.m
//  Selden Map App
//
//  Created by Corey Zanotti on 4/22/13.
//
//

#import "MagnifyingGlass.h"

@implementation MagnifyingGlass

@synthesize magnifyingGlassImage = _magnifyingGlassImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _magnifyingGlassImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mag" ofType:@"png"]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    [_magnifyingGlassImage drawInRect:rect];
}


@end
