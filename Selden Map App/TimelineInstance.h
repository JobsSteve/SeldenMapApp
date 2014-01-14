//
//  TimelineInstance.h
//  Selden Map App
//
//  Created by Corey Zanotti on 4/25/13.
//
//

#import <Foundation/Foundation.h>

@interface TimelineInstance : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSString *bodyText;
@property (nonatomic, retain) NSNumber *xLocation;
@property (nonatomic, retain) NSNumber *yLocation;
@property (nonatomic, retain) UIImage *image1;
@property (nonatomic, retain) UIImage *image2;

-(id)initWithTitle:(NSString *)title Subtitle:(NSString *)subtitle Body:(NSString *)body XLocation:(NSNumber *)x YLocation:(NSNumber *)y FirstImage:(UIImage *)firstImage SecondImage:(UIImage *)secondImage;
@end
