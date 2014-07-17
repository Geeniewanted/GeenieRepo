//
//  LabNameContainerViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol passLabName <NSObject>

-(void)passLab:(NSString *)selectedLabName;

@end

@interface LabNameContainerViewController : UIViewController
{
    NSMutableArray *labName;
    id<passLabName> delegate;
    IBOutlet UITableView *tableLabName;
    
}
@property(nonatomic, retain) id delegate;

@end
