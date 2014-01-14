//
//  ModalImage.m
//  Selden Map App
//
//  Created by Corey Zanotti on 5/1/13.
//
//

#import "ModalImage.h"

@implementation ModalImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"TouchedMe");
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Touched ME");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    struct CGContext *currentGraphicsContext = UIGraphicsGetCurrentContext();
    [currentGraphicsContext setInterpolationQuality]
}
*/

@end
