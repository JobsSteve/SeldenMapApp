//
//  ModalTextView.m
//  Selden Map App
//
//  Created by Corey Zanotti on 4/18/13.
//
//

#import "ModalTextView.h"

@implementation ModalTextView

@synthesize fontSize = _fontSize, text=_text, fontColor = _fontColor;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setClearsContextBeforeDrawing:YES];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setUserInteractionEnabled:NO];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // Drawing code
    
    UIFont *font = [UIFont fontWithName:@"Hoefler Text" size:[_fontSize floatValue]];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShadow(context, CGSizeMake(1, 1), 1);
    if (_fontColor != [UIColor whiteColor])
        CGContextSetRGBFillColor(context,.164,.635,.78, 1);
    else
        CGContextSetRGBFillColor(context,1,1,1, 1);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetLineWidth(context, .35);
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    CGContextSaveGState(context);
    [_text drawInRect:rect withFont:font];
}

@end
