//
//  TimelineBarViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 4/25/13.
//
//

#import "TimelineBarViewController.h"

@interface TimelineBarViewController ()

@end

@implementation TimelineBarViewController
@synthesize timeline = _timeline, playHead = _playHead, timelinePoints = _timelinePoints, delegate = _delegate;

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
    //set frame
    //create image and playhead
    NSString *path = [[NSBundle mainBundle]pathForResource:@"timeline" ofType:@"png"];
    UIImage *timelineImage = [[UIImage alloc]initWithContentsOfFile:path];
    _timeline = [[UIImageView alloc]initWithImage:timelineImage];
    [_timeline setFrame:CGRectMake(0, 0, 1024, 161)];
    [[self view]addSubview:_timeline];
    
    _playHead = [[OBShapedButton alloc]initWithFrame:CGRectMake(175, 38, 48, 82)];
    [_playHead setBackgroundImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"playhead" ofType:@"png"]] forState:UIControlStateNormal];
    [_timeline addSubview:_playHead];
    
    //populate timeline with buttons
    /*
     Timeline Button Points: (355,117), (690,117),(1153,117), (1872,117)
     */
    _timelinePoints = [[NSMutableArray alloc]init];
    UIButton *timelineButton = [[UIButton alloc]initWithFrame:CGRectMake(177, 58.5, 43, 43)];
    [timelineButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"blue_dot" ofType:@"png"]] forState:UIControlStateNormal];
    [timelineButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"red_dot" ofType:@"png"]] forState:UIControlStateSelected];
    [timelineButton addTarget:self action:@selector(timelineButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    //[timelineButton setSelected:NO];
    [_timelinePoints addObject:timelineButton];
    [[self view] addSubview:timelineButton];
    
    timelineButton = [[UIButton alloc]initWithFrame:CGRectMake(345, 58.5, 43, 43)];
    [timelineButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"blue_dot" ofType:@"png"]] forState:UIControlStateNormal];
    [timelineButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"red_dot" ofType:@"png"]] forState:UIControlStateSelected];
    [timelineButton addTarget:self action:@selector(timelineButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    //[timelineButton setSelected:NO];
    [_timelinePoints addObject:timelineButton];
    [[self view] addSubview:timelineButton];
    
    timelineButton = [[UIButton alloc]initWithFrame:CGRectMake(577, 58.5, 43, 43)];
    [timelineButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"blue_dot" ofType:@"png"]] forState:UIControlStateNormal];
    [timelineButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"red_dot" ofType:@"png"]] forState:UIControlStateSelected];
    [timelineButton addTarget:self action:@selector(timelineButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [timelineButton setSelected:NO];
    [_timelinePoints addObject:timelineButton];
    [[self view] addSubview:timelineButton];

    timelineButton = [[UIButton alloc]initWithFrame:CGRectMake(936, 58.5, 43, 43)];
    [timelineButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"blue_dot" ofType:@"png"]] forState:UIControlStateNormal];
    [timelineButton setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"red_dot" ofType:@"png"]] forState:UIControlStateSelected];
    [timelineButton addTarget:self action:@selector(timelineButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [timelineButton setSelected:NO];
    [_timelinePoints addObject:timelineButton];
    [[self view] addSubview:timelineButton];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Timeline pressed");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updatePlayHeadLocationToPoint:(CGPoint)newPoint
{
    [UIView animateWithDuration:1.0 animations:^{
        [_playHead setFrame:CGRectMake(newPoint.x, newPoint.y, 48, 82)];
    }];
    [UIView commitAnimations];
}
-(void)updateTimelineButtonsToPage:(NSInteger *)page
{
    int count = 0;
    for (UIButton *button in _timelinePoints)
    {
        
    }
}
-(IBAction)timelineButtonPressed:(id)sender{
    //change status of button
    //move map to new location
    UIButton *buttonPressed = (UIButton *)sender;
    int count = 0;
    for (UIButton *button in _timelinePoints)
    {
       if (button == buttonPressed)
       {
           
           [button setSelected:YES];
           [_delegate updateTimelineToPoint:[[NSNumber alloc] initWithInt:count]];
           //update event in timeline
           
       } else{
           [button setSelected:NO];
       }
        count++;
    }
        
}

@end
