//
//  AppDelegate.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "AppDelegate.h"

#import "view1ViewController.h"
#import "view2ViewController.h"
#import "view3ViewController.h"
#import "view4ViewController.h"
#import "view5ViewController.h"
#import "Quare4MenuViewController.h"
#import "APLTransitionController.h"
#import "APLCollectionViewController.h" 
#import "define.h"
#import "FlipSquaresNavigationController.h"
@interface AppDelegate () <UINavigationControllerDelegate, APLTransitionControllerDelegate>

@property (nonatomic) UINavigationController *navigationController;
@property (nonatomic) APLTransitionController *transitionController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[NSUserDefaults standardUserDefaults] setObject:@"test token" forKey:kDeviceToken];
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    view1ViewController *vc1 = [[view1ViewController alloc] initWithNibName:@"view1ViewController" bundle:nil];
    view2ViewController *vc2 = [[view2ViewController alloc] initWithNibName:@"view2ViewController" bundle:nil];
    //view3ViewController *vc3 = [[view3ViewController alloc] initWithNibName:@"view3ViewController" bundle:nil];
    view3ViewController *vc3 = [[view3ViewController alloc] initWithCollectionViewLayout:layout];
    view4ViewController *vc4 = [[view4ViewController alloc] initWithNibName:@"view4ViewController" bundle:nil];
    view5ViewController *vc5 = [[view5ViewController alloc] initWithNibName:@"view5ViewController" bundle:nil];

    
    Quare4MenuViewController *q4mc = [[Quare4MenuViewController alloc]initWithTopLeft:vc1 TopRight:vc2 bottomLeft:vc3 bottomRight:vc4 TopCenter:vc5];
    FlipSquaresNavigationController *nav = [[FlipSquaresNavigationController alloc] initWithRootViewController:q4mc];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
      self.window.rootViewController = nav;
//    [self.window addSubview:q4mc.view];
    [self.window makeKeyAndVisible];
    
    [self.window makeKeyAndVisible];
    
  
    
 
    
    return YES;
    
    
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    layout.itemSize = CGSizeMake(100, 100);
//    layout.minimumInteritemSpacing = 10;
//    layout.minimumLineSpacing = 10;
//    view3ViewController* collectionViewController = [[view3ViewController alloc] initWithCollectionViewLayout:layout];
    //collectionViewController.title = @"Layout 1";
//    self.navigationController = [[UINavigationController alloc] initWithRootViewController:collectionViewController];
//    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.delegate = self;
//    
//    self.transitionController = [[APLTransitionController alloc] initWithCollectionView:collectionViewController.collectionView];
//    self.transitionController.delegate = self;
//    
//    self.window.rootViewController = self.navigationController;
//    [self.window makeKeyAndVisible];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *tokenStr = [deviceToken description];
    NSString *hexStr = [[[tokenStr
                          stringByReplacingOccurrencesOfString:@"<" withString:@""]
                         stringByReplacingOccurrencesOfString:@">" withString:@""]
                        stringByReplacingOccurrencesOfString:@" " withString:@""] ;
    [userDefault setObject:hexStr forKey:kDeviceToken];
    [userDefault synchronize];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSString *message = nil;
    id alert = [userInfo objectForKey:@"alert"];
    if ([alert isKindOfClass:[NSString class]]) {
        message = alert;
    } else if ([alert isKindOfClass:[NSDictionary class]]) {
        message = [alert objectForKey:@"body"];
    }
    if (alert) {
        [Util showAlertWithString:message];
        [UIApplication sharedApplication].applicationIconBadgeNumber = 1;
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:@"didReceiveNotification" object:nil];
    }
    
}

@end
