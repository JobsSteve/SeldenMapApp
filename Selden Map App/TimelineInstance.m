//
//  TimelineInstance.m
//  Selden Map App
//
//  Created by Corey Zanotti on 4/25/13.
//
//

#import "TimelineInstance.h"

@implementation TimelineInstance
@synthesize title=_title,subtitle=_subtitle,bodyText=_bodyText,xLocation=_xLocation,yLocation=_yLocation,image1=_image1,image2=_image2;

-(id)initWithTitle:(NSString *)title Subtitle:(NSString *)subtitle Body:(NSString *)body XLocation:(NSNumber *)x YLocation:(NSNumber *)y FirstImage:(UIImage *)firstImage SecondImage:(UIImage *)secondImage{
    self = [super init];
    if(self){
        _title = title;
        _subtitle=subtitle;
        _bodyText=body;
        _xLocation = x;
        _yLocation = y;
        _image1 = firstImage;
        _image2 = secondImage;
    }
    return self;
}
@end
