//
//  portButton.m
//  SeldenMap
//
//  Created by Corey Zanotti on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PortButton.h"

@implementation PortButton
@synthesize portName;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor blackColor]];
    }
    return self;
}
-(id)initWithName:(NSString *)name frame:(CGRect)location
{
    self = [super initWithFrame:location];
    if(self)
    {
        portName = name;
        //create the custom port image
        [self setBackgroundImage:[PortButton buttonImage] forState:UIControlStateNormal];
        [self setShowsTouchWhenHighlighted:YES];
    }
    return self;
}

+(UIImage *)buttonImage
{
    static UIImage *buttonBackground = nil;
    if (!buttonBackground){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"switches_ports_off" ofType:@"png"];
        buttonBackground = [[UIImage alloc]initWithContentsOfFile:path];
    }
    return buttonBackground;
}

+(UIImage *)buttonPressedImage
{
    static UIImage *buttonBackground = nil;
    if (!buttonBackground){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"switches_ports_on" ofType:@"png"];
        buttonBackground = [[UIImage alloc]initWithContentsOfFile:path];
    }
    return buttonBackground;
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
