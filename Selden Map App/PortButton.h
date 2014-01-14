//
//  portButton.h
//  SeldenMap
//
//  Created by Corey Zanotti on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBShapedButton.h"
/*
 Port buttons are responsible for allowing their text fields to be changed, and telling the appropriate authority when they've been touched. 
 */
@interface PortButton : OBShapedButton
{
}
@property (nonatomic) NSString *portName;

@end
