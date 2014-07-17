//
//  ListOfPrescriptionViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 18/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VariableContainer.h"
#import "DrugsViewController.h"

@interface ListOfPrescriptionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, passDrugs>
{
    IBOutlet UITableView *table1;
    NSMutableArray *rowHeaderDisease;
    NSMutableArray *prescriptionDetails;
    NSMutableArray *arrayFromSecondView;
    int i;
    UIPopoverController *popOverDisease;
    IBOutlet UIBarButtonItem *closeButton;
    IBOutlet UIBarButtonItem *editButton;
    NSString *drugChosen;
}
- (IBAction) EditTable:(id)sender;

-(IBAction)addMore:(id)sender;
@property (nonatomic, retain) NSMutableArray *arrayFromSecondView;
@end
