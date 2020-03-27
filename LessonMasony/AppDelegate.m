//
//  AppDelegate.m
//  LessonMasony
//
//  Created by rocky on 2020/3/26.
//  Copyright © 2020 rocky. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = nav;
    return YES;
}






@end
