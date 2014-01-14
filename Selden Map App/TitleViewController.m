//
//  TitleViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 1/3/13.
//
//

#import "TitleViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController

@synthesize titleImageView = _titleImageView, titleTextView = _titleTextView, currentProvince = _currentProvince;

-(id)init{
    self = [super init];
    if (self)
    {
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithCurrentProvince:(Province *)prov{
    self = [super init];
    if (self) {
        // Custom initialization
        _currentProvince = prov;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    //setting up title Image View
    UIImage *titleImage = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"title_bar" ofType:@"png"]];
    _titleImageView = [[UIImageView alloc]initWithImage:titleImage];
    [_titleImageView setFrame:CGRectMake(0, 0, 407, 36)];
    [[self view] addSubview:_titleImageView];
    [_titleImageView setAlpha:0.0f];
    
    _titleTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, -3, 407, 36)];
    [_titleTextView setTextAlignment:UITextAlignmentCenter];
    [_titleTextView setText:[_currentProvince name]];
    [_titleTextView setFont:[UIFont fontWithName:@"Cochin" size:20.0]];
    [_titleTextView setTextColor:[UIColor whiteColor]];
    [_titleTextView setEditable:NO];
    [_titleTextView setAlpha:0.0f];
    [_titleTextView setBackgroundColor:[UIColor clearColor]];
    [[self view]addSubview:_titleTextView];
}

-(void)setCurrentProvince:(Province *)currentProvince{
    _currentProvince = currentProvince;
    [_titleTextView setText:[_currentProvince name]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)animateTitle:(BOOL)state
{
    if (state)
    {
        //code to animate title alpha to 1
        /*
         Algorithm
         Start animation block
         change alpha
         commit animations
         */
        [UIView animateWithDuration:.25f animations:^{
            [_titleImageView setAlpha:1.0];
            [_titleTextView setAlpha:1.0];
        }];
    }else{
        [UIView animateWithDuration:.25f animations:^{
            [_titleImageView setAlpha:0.0];
            [_titleTextView setAlpha:0.0];
        }];
        //code to animate title alpha to 0
    }
}

@end
