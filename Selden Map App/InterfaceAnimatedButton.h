//
//  InterfaceAnimatedButton.h
//  Selden Map App
//
//  Created by Corey Zanotti on 12/6/12.
//
//
/*
 Interface Animated Button will need to declare a delegate protocol for itself. The delegate will be responsible for dealing with additional processing when the button is pressed. 
 
 
 */

#import <UIKit/UIKit.h>
#import "OBShapedButton.h"

@protocol ButtonDelegate <NSObject>

-(void)userInterfaceButtonPressed:(id)sender;

@end

@interface InterfaceAnimatedButton : UIViewController
{
    BOOL buttonPressed;
    
}
@property (nonatomic, strong) UIButton *iconButton;
@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) id <ButtonDelegate> delegate;
//instantiate the button
-(id)initWithButtonImageForUnselected:(UIImage *) imageUnselected selected:(UIImage *) imageSelected background:(UIImage *)background;
-(BOOL)buttonState;

//-(IBAction)buttonPressed:(id *)button;
@end
