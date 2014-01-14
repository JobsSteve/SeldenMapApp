//
//  TimelineContentView.h
//  Selden Map App
//
//  Created by Corey Zanotti on 4/24/13.
//
//

#import <UIKit/UIKit.h>
#import "ModalTextView.h"

@interface TimelineContentView : UIView
{
   CGPoint mapScrollPoint;

}
@property (nonatomic, strong) ModalTextView *titleText;
@property (nonatomic, strong) ModalTextView *subtitleText;
@property (nonatomic, strong) ModalTextView *bodyContentText;
@property (nonatomic, strong) UIImage *image1;
@property (nonatomic, strong) UIImage *image2;

-(id)initWithTitle:(NSString *)title SubTitle:(NSString *)subtitle Body:(NSString *)body Images:(NSArray *)images ScrollPoint:(CGPoint) scrollPoint;
-(CGPoint)getPointOnMap;
@end
