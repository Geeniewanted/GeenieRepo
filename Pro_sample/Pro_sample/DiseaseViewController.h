//
//  DiseaseViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 18/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"

@protocol passDisease <NSObject>

-(void)PassValue:(NSString *)selectedDisease;

@end

@interface DiseaseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
{
    NSMutableArray *diseases;
    id<passDisease> delegate;
    IBOutlet UIBarButtonItem *button1;
    IBOutlet UITableView *table;
    IBOutlet UISearchDisplayController *searchBar;
    NSMutableArray *ArrayToLoadDiseases;
 
    

    
    
}
-(IBAction)addDiseaseButtonClicked:(id)sender;
@property (nonatomic, retain) id delegate;
@end
