//
//  DrugsViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"

@protocol passDrugs <NSObject>

-(void)PassDrugValue:(NSString *)selectedDrug;

@end
@interface DrugsViewController : UITableViewController 
{
    NSArray *listOfDrugs;
    //NSString *selectedDrug;
     id<passDrugs> delegate;
    
    //SQLite Database Details
    

    NSMutableArray *arrayToLoadDiseases;
}
//@property (nonatomic, retain) NSString *selectedDrug;
@property (nonatomic, retain) id delegate;
@end
