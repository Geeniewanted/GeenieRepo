//
//  LabTypesViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PassLabTestDetails

-(void)passLabTests:(NSString *)selectedLabInfo;
@end

#import "LabTestViewController.h"

@interface LabTypesViewController : UIViewController
{
    IBOutlet UITableView *tableLabList;
    id <PassLabTestDetails> delegate;

    NSString *sectionHeader;
}
@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;
@property (nonatomic, retain) id delegate;
@end
