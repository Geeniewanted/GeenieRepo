//
//  LabTestViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabNameContainerViewController.h"
#import "LabTestViewController.h"
#import "LabTypesViewController.h"

@protocol LabDataForEntryView <NSObject>

-(void)kindOfTest:(NSString *)labTest labStore:(NSString *)labStoreName;

@end
@protocol MyPopoverDelegate <NSObject>
-(void)didClickCancelButton;
@end
@protocol passLabDetails <NSObject>

-(void)passLabInfo:(NSMutableArray *)ArrayWithLabDetails;
-(void)dismissPopOver;

@end

@interface LabTestViewController : UIViewController <passLabName, UITableViewDelegate, UITableViewDataSource, PassLabTestDetails>
{
    NSDictionary *tableContents;
	NSArray *sortedKeys;
    
    
    
    // Other declarations
    NSMutableArray *labTestDetails;
    NSMutableArray *labTestSubdetails;
    UIPopoverController *popLabTests;
    IBOutlet UITableView *tableList;
    IBOutlet UILabel *selectedLabTest;
    UIPopoverController *popUpLabName;
    IBOutlet UITextField *labNameSelected;
    IBOutlet UITableView *table; 
    id <passLabDetails> delegate;
    id <MyPopoverDelegate> PopOverdelegate;
    NSMutableArray *labInfo;
    NSString *sectionTitle;
    UIPopoverController *popUpLabTests;
    IBOutlet UITextField *labTestInfo;
    id <LabDataForEntryView> delegateForSecondView;

    //Array for List
    
    
}
-(IBAction)showLabName:(id)sender;
-(IBAction)closeButtonPressed:(id)sender;
-(IBAction)saveAndCloseButtonPressed:(id)sender;
@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) id PopOverdelegate;
-(IBAction)ListofLabTests:(id)sender;
@property (nonatomic, retain) id delegateForSecondView;
@end
