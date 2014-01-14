//
//  DrawerViewController.m
//  Selden Map App
//
//  Created by Corey Zanotti on 12/13/12.
//
//

#import "DrawerViewController.h"

@interface DrawerViewController ()

@end

@implementation DrawerViewController
@synthesize provinceViewController = _provinceViewController;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //CREATE AND PLACE BACKDROP
    NSString *path = [[NSBundle mainBundle]pathForResource:@"drawer" ofType:@"png"];
    UIImage *backdrop = [[UIImage alloc]initWithContentsOfFile:path];
    UIImageView *backdropView = [[UIImageView alloc]initWithImage:backdrop];
    [self.view addSubview:backdropView];
    self.view.frame = CGRectMake(0,0,768, 299);
    
    //SETTING UP THE CONTENT VIEW
    _provinceViewController = [[ProvinceInfoView alloc]init];
    [[_provinceViewController view] setFrame:CGRectMake(0, 0, 768, 299)];
    [[self view]addSubview: [_provinceViewController view]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTitleView:(UITextView *)provinceTitleView
{
    [_provinceViewController setProvinceTitleView:provinceTitleView];
}
@end
