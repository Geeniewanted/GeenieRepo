//
//  AppDelegate.m
//  Pro_sample
//
//  Created by Raghuvardhan on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "FMDatabase.h"
#import "ViewController.h"

@implementation AppDelegate
@synthesize navigator;

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize arrayOfSomething;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIViewController *mainView = [[ViewController alloc] initWithNibName:@"ViewController" bundle:Nil];
    navigator = [[UINavigationController alloc] initWithRootViewController:mainView];
    // Override point for customization after application launch.
    [self.window setRootViewController:navigator];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    NSString *dbName = [[NSString alloc] initWithString:@"DADatabase1 19-30-53-494.sqlite"];
    NSString *documentsFolder       = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *databaseFullDocumentPath = [documentsFolder stringByAppendingPathComponent:dbName];
    NSLog(@"Database Full Path:               %@", databaseFullDocumentPath);
    NSString *databaseFullBundlePath   = [[NSBundle mainBundle] pathForResource:@"DADatabase1 19-30-53-494" ofType:@"sqlite"];
    NSLog(@"Database Full Bundle Path:        %@", databaseFullBundlePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //BOOL success = [fileManager fileExistsAtPath:writableDBPath];
    if (![fileManager fileExistsAtPath:databaseFullDocumentPath])
    {
        NSAssert([fileManager fileExistsAtPath:databaseFullBundlePath], @"Database not found in bundle");
        
        NSError *error;
        if (![fileManager copyItemAtPath:databaseFullBundlePath toPath:databaseFullDocumentPath error:&error])
            NSLog(@"Unable to copy database from '%@' to '%@': error = %@", databaseFullBundlePath, databaseFullDocumentPath, error);
    }
    // Building the string ourself
    //NSString *query = [NSString stringWithFormat:@"insert into user values ('%@', %d)",@"brandontreb", 25];
    //[database executeUpdate:query];
    
    // Let fmdb do the work
    //[database executeUpdate:@"insert into user(name, age) values(?,?)",@"cruffenach",[NSNumber numberWithInt:25],nil];
    
    // Fetch all users
    /*FMResultSet *results = [database executeQuery:@"select * from user"];
    while([results next]) {
        NSString *name = [results stringForColumn:@"name"];
        NSInteger age  = [results intForColumn:@"age"];        
        NSLog(@"User: %@ - %d",name, age);*/

    //[self createAndCheckDatabase];
    return YES;
}
/*-(void) createAndCheckDatabase
{
    BOOL success; 
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:databasePath];
    
    if(success) return; 
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
}*/
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

@end
