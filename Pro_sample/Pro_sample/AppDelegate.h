//
//  AppDelegate.h
//  Pro_sample
//
//  Created by Raghuvardhan on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    IBOutlet UINavigationController *navigator;
    NSMutableArray *arrayOfSomething;
    UISplitViewController *splitView;
    NSString *databaseName;
    NSString *databasePath;
    
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) IBOutlet UINavigationController *navigator;
@property (strong, nonatomic) NSMutableArray *arrayOfSomething;


@end
