   //
//  RumexCustomTabBar.m
//  
//
//  Created by Oliver Farago on 19/06/2010.
//  Copyright 2010 Rumex IT All rights reserved.
//

#import "CustomTabBar.h"

@implementation CustomTabBar

@synthesize btn1, btn2, btn3, btn4, btn5, btn6, btn7, currentState, previewController;

-(id)initWithState:(defaultState)startingState
{
    self= [super init];
    if (self)
    {
        [self setCurrentState:startingState];
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	[self hideTabBar];
	[self setUpButtons];
    //[self switchStateTo:currentState animated:YES];
}

- (void)hideTabBar
{
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}

- (void)hideNewTabBar 
{
    self.btn1.hidden = 1;
    self.btn2.hidden = 1;
    self.btn3.hidden = 1;
    self.btn4.hidden = 1;
    self.btn5.hidden = 1;
    self.btn6.hidden = 1;
}

- (void)showNewTabBar 
{
    self.btn1.hidden = 0;
    self.btn2.hidden = 0;
    self.btn3.hidden = 0;
    self.btn4.hidden = 0;
    self.btn5.hidden = 0;
    self.btn6.hidden = 0;
}

-(void)clearTabBar
{
    for (UIView *childView in [[self view] subviews])
    {
        //[childView removeFromSuperview];
    }
}
-(void)setUpButtons
{
    UIImage *btnImage = [UIImage imageNamed:@"button01_off.png"];
    UIImage *btnImageSelected = [UIImage imageNamed:@"button01_on.png"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"button01_off" ofType:@"png"];
    btnImage = [[UIImage alloc]initWithContentsOfFile:path];
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom]; //Setup the button
    btn1.frame = CGRectMake(0, 0, 196, 30); // Set the frame (size and position) of the button)
    [btn1 setBackgroundImage:btnImage forState:UIControlStateNormal]; // Set the image for the normal state of the button
    [btn1 setBackgroundImage:btnImageSelected forState:UIControlStateSelected]; // Set the image for the selected state of the button
    [btn1 setTag:0]; // Assign the button a "tag" so when our "click" event is called we know which button was pressed.
    [btn1 setSelected:true]; // Set this button as selected (we will select the others to false as we only want Tab 1 to be selected initially
    
    // Now we repeat the process for the other buttons
    btnImage = [UIImage imageNamed:@"button02_off.png"];
    btnImageSelected = [UIImage imageNamed:@"button02_on.png"];
    self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(196, 0, 196, 30);
    [btn2 setBackgroundImage:btnImage forState:UIControlStateNormal];
    [btn2 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
    [btn2 setTag:1];
    
    btnImage = [UIImage imageNamed:@"button03_off.png"];
    btnImageSelected = [UIImage imageNamed:@"button03_on.png"];
    self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(392, 0, 196, 30);
    [btn3 setBackgroundImage:btnImage forState:UIControlStateNormal];
    [btn3 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
    [btn3 setTag:2];
    
    
    btnImage = [UIImage imageNamed:@"button01_off.png"];
    btnImageSelected = [UIImage imageNamed:@"button01_on.png"];
    self.btn4 = [UIButton buttonWithType:UIButtonTypeCustom]; //Setup the button
    btn4.frame = CGRectMake(0, 0, 196, 30); // Set the frame (size and position) of the button)
    [btn4 setBackgroundImage:btnImage forState:UIControlStateNormal]; // Set the image for the normal state of the button
    [btn4 setBackgroundImage:btnImageSelected forState:UIControlStateSelected]; // Set the image for the selected state of the button
    [btn4 setTag:3]; // Assign the button a "tag" so when our "click" event is called we know which button was pressed.
    [btn4 setSelected:true]; // Set this button as selected (we will select the others to false as we only want Tab 1 to be selected initially
    
    // Now we repeat the process for the other buttons
    btnImage = [UIImage imageNamed:@"button02_off.png"];
    btnImageSelected = [UIImage imageNamed:@"button02_on.png"];
    self.btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(196, 0, 196, 30);
    [btn5 setBackgroundImage:btnImage forState:UIControlStateNormal];
    [btn5 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
    [btn5 setTag:4];
    
    btnImage = [UIImage imageNamed:@"button03_off.png"];
    btnImageSelected = [UIImage imageNamed:@"button03_on.png"];
    self.btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn6.frame = CGRectMake(392, 0, 196, 30);
    [btn6 setBackgroundImage:btnImage forState:UIControlStateNormal];
    [btn6 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
    [btn6 setTag:5];
    
    [btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn6 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)switchStateTo:(defaultState)newState animated:(BOOL)shouldAnimate fromSender:(NSString *)senderName{
    if (currentState == newState){
        //test if the name of sender is the name of the current object displayed
        //update the contents if its not
        //if it is, dismiss the state and clear the current state
        return;
    }
    [self setCurrentState:newState];
    //[self hideNewTabBar];
    [self clearTabBar];
    switch (currentState) {
        case PortState:{
            [self.view addSubview:btn1];
            [self.view addSubview:btn2];
            [self.view addSubview:btn3];
            [btn1 setSelected:YES];
            [self selectTab:[btn1 tag]];
            //code to load port data into views
            //[self loadDataFromPortWithName:senderName];
            
            break;
        }
        case ProvinceState:{
            [self.view addSubview:btn4];
            [self.view addSubview:btn5];
            [self.view addSubview:btn6];
            [btn4 setSelected:YES];
            [self selectTab:[btn4 tag]];
            //code to load province data into views
            [self loadDataFromProvinceWithName:senderName];
            break;
        }
        default:
            break;
    }
    return;
}
-(void)loadDataFromPortWithName:(NSString *)name
{
    /*
     Algorithm
     Query all the ports from the database to find the port with the corresponding name
     Grab the PortDescriptor Object that that port points to.
     */
    //PortInformation *information = [[storage sharedStore]getPortInfoFromName:name];
}

-(void)loadDataFromProvinceWithName:(NSString *)name
{
    //fetch ProvinceInformation from CoreData
    ProvinceInformation *provinceInfo = [self fetchProvinceInfoFromProvinceWithName:name];
    NSLog(@"ProvinceInformation Description is %@",[provinceInfo provinceDescription]);
    //code to load the provinceInformation onto the necessary views
    [self setUpProvinceViewsWithProvinceInfo:provinceInfo];
}

-(void)setUpProvinceViewsWithProvinceInfo:(ProvinceInformation *)info
{
    ProvinceInfoView *infoView = (ProvinceInfoView *)[[self viewControllers] objectAtIndex:3];
    [infoView description].text = info.provinceDescription;
    //repeat for objects at Indexes 4 and 5
    [previewController nameField].text = [info aboutProvince].name;
    NSString *path = [[NSBundle mainBundle]pathForResource:@"previewImage" ofType:@"png"];
    [previewController imageField].image = [[UIImage alloc]initWithContentsOfFile:path];
}
-(ProvinceInformation *)fetchProvinceInfoFromProvinceWithName:(NSString *)name
{
    // 1 - Decide what Entity you want
    NSString *entityName = @"ProvinceInformation";
    
    NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
    
    // 2 - Request that Entity
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    // 3 - Filter it if you want
    request.predicate = [NSPredicate predicateWithFormat:@"aboutProvince.name = %@",name];
    
    // 4 - Sort it if you want
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"aboutProvince.name"                                    ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
    // 5 - Fetch it
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                                               managedObjectContext:[[storage sharedStore]managedObjectContext]
                                                                                                 sectionNameKeyPath:nil
                                                                                                          cacheName:nil];
    [fetchedResultsController performFetch:nil];
    
    return [[fetchedResultsController fetchedObjects]objectAtIndex:0];
}
- (void)buttonClicked:(id)sender
{
	int tagNum = [sender tag];
	[self selectTab:tagNum];
}

- (void)selectTab:(int)tabID
{
    //switch this to read from the current State
	switch(tabID)
	{
		case 0:
			[btn1 setSelected:true];
			[btn2 setSelected:false];
			[btn3 setSelected:false];
			break;
		case 1:
			[btn1 setSelected:false];
			[btn2 setSelected:true];
			[btn3 setSelected:false];
			break;
		case 2:
			[btn1 setSelected:false];
			[btn2 setSelected:false];
			[btn3 setSelected:true];
			break;
		case 3:
			[btn1 setSelected:false];
			[btn2 setSelected:false];
			[btn3 setSelected:false];
            [btn4 setSelected:true];
			[btn5 setSelected:false];
            [btn6 setSelected:false];
			break;
        case 4:
			[btn1 setSelected:false];
			[btn2 setSelected:false];
			[btn3 setSelected:false];
            [btn4 setSelected:false];
            [btn5 setSelected:true];
            [btn6 setSelected:false];
            break;
        case 5:
			[btn1 setSelected:false];
			[btn2 setSelected:false];
			[btn3 setSelected:false];
            [btn4 setSelected:false];
            [btn5 setSelected:false];
            [btn6 setSelected:true];
            break;
	}	
	
	self.selectedIndex = tabID;
	
	
}



@end
