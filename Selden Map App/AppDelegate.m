//
//  AppDelegate.m
//  Selden Map App
//
//  Created by Corey Zanotti
//
/*
 Implementation Log: Progress is complete for the night, maybe...? 
 */

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIViewController *baseVC = [[BaseViewController alloc]initWithNibName:nil bundle:[NSBundle mainBundle]];

    
    self.window.rootViewController = baseVC;
    
    return YES;
}@end
