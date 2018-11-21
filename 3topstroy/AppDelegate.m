//
//  AppDelegate.m
//  3topstroy
//
//  Created by MacBookPro on 21/11/2018.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

#import "AppDelegate.h"
#import "TopStoriesTableViewController.h"
#import "ShareTopStoriesTableViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //윈도우객체 생성
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    
    //테이블 뷰 컨트롤러와 네비게이션 컨트롤러 생성
    UITableViewController *topStories = [[TopStoriesTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *storiesNC = [[UINavigationController alloc] initWithRootViewController:topStories];
    
    
    UITableViewController *shareStories = [[TopStoriesTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *shareNC = [[UINavigationController alloc] initWithRootViewController:shareStories];
    
    //탭바컨트롤러 생성
    self.tabBarController = [[UITabBarController alloc] init];
    //컨트롤러 추가
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:storiesNC,shareNC, nil];
    //최상위 뷰를 탭바 컨트롤러
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyWindow];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
