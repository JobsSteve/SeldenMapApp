//
//  DrawerPreviewViewController.m
//  ECSlidingViewController
//
//  Created by Corey Zanotti on 11/29/12.
//
//

#import "DrawerPreviewViewController.h"

@interface DrawerPreviewViewController ()

@end

@implementation DrawerPreviewViewController

@synthesize nameField,imageField;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setNameField:nil];
    [self setImageField:nil];
    [super viewDidUnload];
}
@end
