//
//  AppDelegate.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRAppDelegate.h"
#import "CTRListViewController.h"
#import "HLMResources.h"

@implementation CTRAppDelegate

-(BOOL) application:(UIApplication *) application didFinishLaunchingWithOptions:(NSDictionary *) launchOptions {
    [self globalStyle];
    UIViewController* navCtrl = [[UINavigationController alloc] initWithRootViewController:[CTRListViewController new]];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = navCtrl;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void) globalStyle {
//    [[UINavigationBar appearance] setBarTintColor: [HLMResources uiColorValue:@"#1abc9c"]];
//    [[UINavigationBar appearance] setTintColor: [UIColor whiteColor]];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{
//        NSForegroundColorAttributeName: [UIColor whiteColor],
//        NSFontAttributeName: [UIFont fontWithName:@"MuseoSlab-300" size:18],
//    }];
}

@end