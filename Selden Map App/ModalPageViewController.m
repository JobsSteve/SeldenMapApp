//
//  ModalPageViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 1/21/13.
//
//

#import "ModalPageViewController.h"

@interface ModalPageViewController ()

@end

@implementation ModalPageViewController
@synthesize imageView = _imageView, textView = _textView, infoViewText=_infoViewText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithImage:(UIImage *)image text:(NSString *)text infoText:(NSString *)infoText
{
    self = [super init];
    if (self){
        [[self view] setFrame:CGRectMake(0, 0, 768, 1024)];
        _imageView = [[UIImageView alloc]initWithImage:image];
        [_imageView setFrame:CGRectMake(36, 590, 450, 385)];
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(36,150, 700, 350)];
        [_textView setBackgroundColor:[UIColor clearColor]];
        [_textView setFont:[UIFont fontWithName:@"Cochin" size:20.0]];
        [_textView setScrollEnabled:NO];
        [_textView setEditable:NO];
        [_textView setText:text];
        [_textView setTextColor:[UIColor whiteColor]];
        _infoViewText = [[UITextView alloc]initWithFrame:CGRectMake(500,590, 230, 385)];
        [_infoViewText setScrollEnabled:NO];
        [_infoViewText setTextColor:[UIColor whiteColor]];
        [_infoViewText setFont:[UIFont fontWithName:@"Cochin" size:20.0]];
        [_infoViewText setBackgroundColor:[UIColor clearColor]];
        [_infoViewText setText:infoText];
        [[self view] addSubview:_imageView];
        [[self view]addSubview:_textView];
        [[self view]addSubview:_infoViewText];
        /*
        _infoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 568, 50)];
        _infoViewText = [[UITextView alloc]initWithFrame:CGRectMake(5,5, 558, 15)];
        [_infoViewText setText:infoText];*/
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //code to set up views
    /*
    _infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [_infoButton setFrame:CGRectMake(538, 395, 30, 30)];
    //[_infoButton addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
   
    [_infoView setBackgroundColor:[UIColor grayColor]];
    [_infoView setAlpha:0.0];
    
    [_infoViewText setFont:[UIFont fontWithName:@"Helvetica" size:15.0]];
    [_infoViewText setBackgroundColor:[UIColor clearColor]];
     */

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
