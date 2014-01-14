//
//  ProvinceButton.h
//  SeldenMap
//
//  Created by Corey Zanotti on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBShapedButton.h"

/*
 Province buttons are responsible for facilitating updates to their text fields and informing their owners when they've been touched
 */
@protocol ProvinceButtonDelegate <NSObject>

-(IBAction)provincePressed:(id)sender;
@end

@interface ProvinceButton : UIButton
{
    NSNumber *buttonType;
}
@property (nonatomic, retain) NSString *provinceName;
@property (nonatomic) CGPoint location;
@property (nonatomic, retain) id<ProvinceButtonDelegate> delegate;
@property (nonatomic, retain) UIImage *layerMask;

-(id)initWithLocation:(CGPoint)location type:(NSNumber *)type;
-(UIImage *)buttonImage;


@end
