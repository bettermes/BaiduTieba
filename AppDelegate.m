//
//  AppDelegate.m
//  Betterme
//
//  Created by len on 16/9/20.
//  Copyright © 2016年 len. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    UIView * screenBgView;
}
@property(strong , nonatomic)UIView * launchScreenBgView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     return YES;
}

//添加启动图
//-(void)loadlaunchScreenBgView{
//    UIStoryboard * board = [UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil];
//    UIViewController * vc = [board instantiateInitialViewController];
//    _launchScreenBgView = vc.view;
//
//    _launchScreenBgView.frame = [UIScreen mainScreen].bounds;
//    [self.window addSubview:_launchScreenBgView];
//    screenBgView = [[[NSBundle mainBundle]loadNibNamed:@"LaunchScreenBgView" owner:self options:nil]lastObject];
//    screenBgView.frame = [UIScreen mainScreen].bounds;
//       [self.window makeKeyAndVisible];
//    UIImageView * imageV = [[screenBgView subviews]lastObject];
//    [_launchScreenBgView addSubview:screenBgView];
//    [self.window addSubview:screenBgView];
//   //screenBgView
//    
//}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
