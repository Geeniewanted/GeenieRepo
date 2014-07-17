//
//  FrequencyViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol passFrequency <NSObject>

-(void)PassFrequency:(NSString *)selectedFrequency;

@end

@interface FrequencyViewController : UITableViewController
{
    NSMutableArray *frequencyTable;
    id <passFrequency> delegate;
}
@property (nonatomic, retain) id delegate;

@end
