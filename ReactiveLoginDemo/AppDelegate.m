//
//  AppDelegate.m
//  ReactiveLoginDemo
//
//  Created by Belényesi Viktor on 01/04/14.
//  Copyright (c) 2014 Belényesi Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if (getenv("UnitTest")) return YES;

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [LoginViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
