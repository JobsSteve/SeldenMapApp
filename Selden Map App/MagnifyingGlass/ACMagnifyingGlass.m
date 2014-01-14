//
//  ACMagnifyingGlass.m
//  MagnifyingGlass
//

#import "ACMagnifyingGlass.h"
#import <QuartzCore/QuartzCore.h>


static CGFloat const kACMagnifyingGlassDefaultRadius = 40;
static CGFloat const kACMagnifyingGlassDefaultOffset = -40;
static CGFloat const kACMagnifyingGlassDefaultScale = 1.5;

@interface ACMagnifyingGlass ()
@end

@implementation ACMagnifyingGlass

@synthesize viewToMagnify, touchPoint, touchPointOffset, scale, scaleAtTouchPoint, magGlass = _magGlass;

- (id)init {
    self = [self initWithFrame:CGRectMake(0, 0, kACMagnifyingGlassDefaultRadius*2, kACMagnifyingGlassDefaultRadius*2)];
    return self;
}

- (id)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		//_magGlass = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mag" ofType:@"png"]];
		self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
		self.layer.borderWidth = 3;
		self.layer.cornerRadius = frame.size.width / 2;
		self.layer.masksToBounds = YES;
		self.touchPointOffset = CGPointMake(0, kACMagnifyingGlassDefaultOffset);
		self.scale = kACMagnifyingGlassDefaultScale;
		self.viewToMagnify = nil;
		self.scaleAtTouchPoint = YES;
	}
	return self;
}

- (void)setFrame:(CGRect)f {
	super.frame = f;
	self.layer.cornerRadius = f.size.width / 2;
}

- (void)setTouchPoint:(CGPoint)point {
	touchPoint = point;
	self.center = CGPointMake(point.x + touchPointOffset.x, point.y + touchPointOffset.y);
}

- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(context, self.frame.size.width/2, self.frame.size.height/2 );
	CGContextScaleCTM(context, scale, scale);
	CGContextTranslateCTM(context, -touchPoint.x, -touchPoint.y + (self.scaleAtTouchPoint? 0 : self.bounds.size.height/2));
	[self.viewToMagnify.layer renderInContext:context];
    //[_magGlass drawInRect:rect];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //when touches begin... don't do anything
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //update location of the magnifying glass relative to its superframe
	UITouch *touch = [touches anyObject];
	[self updateMagnifyingGlassAtPoint:[touch locationInView:self.superview]];
    
}
-(void)updateMagnifyingGlassAtPoint:(CGPoint)point{
    self.touchPoint = point;
    [self setNeedsDisplay];
}
@end
