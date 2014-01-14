//
//  InterfaceAnimatedButton.m
//  Selden Map App
//
//  Created by Corey Zanotti on 12/6/12.
//
//

#import "InterfaceAnimatedButton.h"

@interface InterfaceAnimatedButton ()

@end

@implementation InterfaceAnimatedButton
@synthesize iconButton = _iconButton, backgroundView = _backgroundView;

-(id)initWithButtonImageForUnselected:(UIImage *)imageUnselected selected:(UIImage *)imageSelected background:(UIImage *)background
{
    self = [super init];
    if(self)
    {
        //code to create button with two states and set up uiview
        _iconButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 115, 115)];
        [_iconButton setImage:imageSelected forState:UIControlStateSelected];
        [_iconButton setImage:imageUnselected forState:UIControlStateNormal];
        [_iconButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *bgView = [[UIImageView alloc]initWithImage:background];
        _backgroundView = bgView;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     Algorithm: Place background of button on subview
        set frame for both button images
        add both as subviews
        set off view as visible
     */
    
    [[self view] setFrame:CGRectMake(0, 0, 115, 115)];
    [[self view]addSubview:_backgroundView];
    [[self view] addSubview:_iconButton];

}

-(BOOL)buttonState
{
    return buttonPressed;
}

-(IBAction)buttonPressed:(id)sender
{
    //animate button up or down
    /*[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:.20f];
    int displacement;    [self view].frame = CGRectMake([self view].frame.origin.x, [self view].frame.origin.y + displacement, [self view].frame.size.width,[self view].frame.size.width);
    [UIView commitAnimations];*/
    
    if (buttonPressed){
        //displacement = 40;
        [_iconButton setSelected:NO];
    }
    else{
        //displacement = -40;
        [_iconButton setSelected:YES];
    }

    buttonPressed = !buttonPressed;

    //button will animate, call delegate to update necessary state
    [[self delegate] userInterfaceButtonPressed:self];
}

@end
