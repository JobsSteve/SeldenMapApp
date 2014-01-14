//
//  LabelViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 1/28/13.
//
//

#import "LabelViewController.h"
#import "UIButton+Extensions.h"

@interface LabelViewController ()

@end

@implementation LabelViewController
@synthesize background = _background, expansion_btn = _expansion_btn, buttonState = _buttonState, modalViewController = _modalViewController, provinceName = _provinceName, titleTextView = _titleTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 218, 90)];
    UIImage *popup_img = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"drawer" ofType:@"png"]];
    [_background setImage:popup_img];
    
    _titleTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, 10, 158, 70)];
    //[_titleTextView setTextAlignment:UITextAlignmentCenter];
    [_titleTextView setText:_provinceName];
    [_titleTextView setFont:[UIFont fontWithName:@"Cochin" size:20.0]];
    [_titleTextView setTextColor:[UIColor blackColor]];
    [_titleTextView setEditable:NO];
    [_titleTextView setScrollEnabled:NO];
    [_titleTextView setBackgroundColor:[UIColor clearColor]];
    
    _expansion_btn = [[UIButton_Extensions alloc]initWithFrame:CGRectMake(65, 46, 142, 76)];
    [_expansion_btn setAlpha:0];
    [_expansion_btn setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"flagdown" ofType:@"png"]] forState:UIControlStateNormal];
    [_expansion_btn addTarget:_delegate action:@selector(processLabelButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [_expansion_btn setHitTestEdgeInsets:UIEdgeInsetsMake(-40, -40, -40, -40)];
    hitArea = [[UIButton alloc]initWithFrame:CGRectMake(30, 20, 200, 100)];
    [hitArea setBackgroundColor:[UIColor clearColor]];
    [hitArea addTarget:self action:@selector(pressDown) forControlEvents:UIControlEventTouchDown];
    [hitArea addTarget:self action:@selector(expandInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [[self view]addSubview:_expansion_btn];
    [[self view] addSubview:_background];
    [[self view]addSubview:_titleTextView];
    [[self view]addSubview:hitArea];
}
-(void)pressDown{
    [_expansion_btn setHighlighted:YES];
}
-(void)expandInfo{
    [_expansion_btn setHighlighted:NO];
    [_delegate processLabelButtonPress:hitArea];
}
-(void)setProvinceName:(NSString *)provinceName{
    _provinceName = provinceName;
    [_titleTextView setText:_provinceName];
}

-(void)animateExpansionButton{
    if ([_expansion_btn alpha]==0){
        [UIView animateWithDuration:.4 animations:^{
            [_expansion_btn setAlpha:1];
            [_expansion_btn setFrame:CGRectMake(65, 77, 102, 36)];
        }];
    } else {
            [_expansion_btn setAlpha:0];
            [_expansion_btn setFrame:CGRectMake(65, 47, 102, 36)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MODAL VIEW CONTROLLER METHODS




@end
