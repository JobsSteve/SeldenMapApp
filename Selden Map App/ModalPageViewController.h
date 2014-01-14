//
//  ModalPageViewController.h
//  Selden Map App
//
//  Created by Corey Zanotti on 1/21/13.
//
//

#import <UIKit/UIKit.h>

@interface ModalPageViewController : UIViewController
{
    BOOL infoScreenShowing;
}

@property (strong, retain) UIImageView *imageView;
@property (strong, retain) UITextView *textView;
@property (strong, retain) UITextView *infoViewText;

-(id)initWithImage:(UIImage *)image text:(NSString *)text infoText:(NSString *)infoText;

@end
