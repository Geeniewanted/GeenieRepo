//
//  ReportViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 21/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrugsViewController.h"

@interface ReportViewController : UIViewController <UIPrintInteractionControllerDelegate, UIActionSheetDelegate>
{
    IBOutlet UIBarButtonItem *printButton;
    IBOutlet UILabel *patientName;
    NSDate *reportDate;
    //NSMutableString *dateOfReport;
    IBOutlet UILabel *dateOfReport;
    IBOutlet UILabel *agePat;
    IBOutlet UILabel *addressPat;
    IBOutlet UILabel *genderSelected;
    IBOutlet UILabel *diseasePatient;
    IBOutlet UILabel *instructions;
    IBOutlet UILabel *medStoreInfo;
    IBOutlet UILabel *firstDrug;
    IBOutlet UILabel *firstDosage;
    IBOutlet UILabel *firstFrequency;
    IBOutlet UILabel *firstDays;
    IBOutlet UILabel *secondDrug;
    IBOutlet UILabel *secondDosage;
    IBOutlet UILabel *secondFrequency;
    IBOutlet UILabel *secondDays;
    IBOutlet UILabel *thirdDrug;
    IBOutlet UILabel *thirdDosage;
    IBOutlet UILabel *thirdFrequency;
    IBOutlet UILabel *thirdDays;
    IBOutlet UILabel *fourthDrug;
    IBOutlet UILabel *fourthDosage;
    IBOutlet UILabel *fourthFrequency;
    IBOutlet UILabel *fourthDays;
    IBOutlet UILabel *fifthDrug;
    IBOutlet UILabel *fifthDosage;
    IBOutlet UILabel *fifthFrequency;
    IBOutlet UILabel *fifthDays;
    IBOutlet UIBarButtonItem *actionButton;
    IBOutlet UIBarButtonItem *printerButton;
    IBOutlet UIBarButtonItem *savePhotosButton;
   

}
 -(IBAction)actionButtonClicked:(id)sender;
-(IBAction)capture:(id)sender;
-(IBAction)printReport:(id)sender;
-(IBAction)goToEntryScreen:(id)sender;
-(IBAction)newPatientButtonClicked:(id)sender;
- (IBAction)printContent:(id)sender;
@property (nonatomic, retain) NSString *nameOfPatient;
@property (nonatomic, retain) NSString *numForPatient;
@property (nonatomic, retain) NSString *ageOfPatient;
@property (nonatomic, retain) NSString *genderOfPatient;
@property (nonatomic, retain) NSString *addressOfPatient;
@property (nonatomic, retain) NSString *diseaseRetained;
@property (nonatomic, retain) NSString *instructionsEntered;
@property (nonatomic, retain) NSString *recommendedMedStore;
@property (nonatomic, retain) NSString *drug1;
@property (nonatomic, retain) NSString *dosage1;
@property (nonatomic, retain) NSString *days1;
@property (nonatomic, retain) NSString *frequency1;
@property (nonatomic, retain) NSMutableArray *ArrayToShowDrug;
@property (nonatomic, retain) NSMutableArray *ArrayToShowDosage;
@property (nonatomic, retain) NSMutableArray *ArrayToShowDays;
@property (nonatomic, retain) NSMutableArray *ArrayToShowFrequency;
@property int i;
@end
