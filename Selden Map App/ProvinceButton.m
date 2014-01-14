//
//  ProvinceButton.m
//  SeldenMap
//
//  Created by Corey Zanotti on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProvinceButton.h"

@implementation ProvinceButton
@synthesize location = _location, layerMask = _layerMask;
-(id)initWithLocation:(CGPoint)location type:(NSNumber *)type
{
    self = [super init];
    if(self)
    {
        [self setFrame:CGRectMake(0,0,102,102)];
        [self setShowsTouchWhenHighlighted:YES];
        _location = location;
        buttonType = type;
        [self setBackgroundImage:[self buttonImage] forState:UIControlStateNormal];
        
        [self addTarget:self action:@selector(provincePressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(UIImage *)buttonImage
{
    NSString *path;
    switch ([buttonType integerValue]) {
        case 1:
            path = [[NSBundle mainBundle] pathForResource:@"green_mag" ofType:@"png"];
            break;
        case 2:
            path = [[NSBundle mainBundle] pathForResource:@"brown_mag" ofType:@"png"];
            break;
        case 3:
            path = [[NSBundle mainBundle] pathForResource:@"blue_mag" ofType:@"png"];
            break;
            
        default:
            break;
    }
        
    UIImage *buttonBackground = [[UIImage alloc]initWithContentsOfFile:path];
    return buttonBackground;
}

-(void)provincePressed{
    [_delegate provincePressed:self];
}

@end
