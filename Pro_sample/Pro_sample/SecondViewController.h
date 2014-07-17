//
//  SecondViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"

#import "ReportViewController.h"
#import "DiseaseContainer.h"
#import "DiseaseViewController.h"
#import "DrugsViewController.h"
#import "StoreContainer.h"
#import "UnitsContainer.h"
#import "FrequencyViewController.h"
#import "ListOfPrescriptionViewController.h"
#import "LabTestViewController.h"
#import "FMDatabase.h"
#import <sqlite3.h>
@protocol passValuesToPrescriptionList <NSObject>
-(void)passArrayOfDiseases:(NSMutableArray *)DiseaseList;
@end

@interface SecondViewController : UIViewController <UIPopoverControllerDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, passDisease, passDrugs, passStoreInfo, passUnits, passFrequency, UITextViewDelegate, MyPopoverDelegate, LabDataForEntryView>

{

    
    //IBOutlet UIPickerView *myPickerView;
    IBOutlet UIImageView *myImage;
    IBOutlet UITextView *myTextView;
    NSArray *arrayOfDiseases;
    UIPopoverController *popOverDiseases;
    UIPopoverController *popOverDrugs;
    IBOutlet UITextField *patientNum;
    IBOutlet UIButton *patientLookupButton;
    IBOutlet UITextField *drugSelected1;
    IBOutlet UISegmentedControl *storeRecommendation;
    IBOutlet UITableView *dosageTable;
    IBOutlet UITableView *drugTable;
    IBOutlet UIBarButtonItem *generateButton;
    UIPopoverController *popOverDrugAdd;
    UIPopoverController *storePopOver;
    IBOutlet UIBarButtonItem *drugAddButton;
    IBOutlet UILabel *doctorName;
    IBOutlet UITextField *patName;
    IBOutlet UITableView *table1;
    IBOutlet UITableView *table2;
    IBOutlet UITableView *table3;
    IBOutlet UITableView *table4;
    IBOutlet UITextField *patAge;
    IBOutlet UITextField *patAddress;
    IBOutlet UITextField *patNumField;
    IBOutlet UITextField *diseasesSelected;
    IBOutlet UITextField *drugSelectedText;
    IBOutlet UITextField *dosageTextBox;
    IBOutlet UITextField *daysEntered;
    IBOutlet UITextField *FrequencyEntered;
    IBOutlet UISegmentedControl *gender;
    NSString *selectedGender;
    IBOutlet UITextField *SSNEntered;
    IBOutlet UITextField *commentsEntered;
    NSString *diseaseToPass;
    IBOutlet UITextField *storeInfo;
    NSNumber *patNum;
    IBOutlet UILabel *maleLabel;
        IBOutlet UILabel *femaleLabel;
    NSString *drugToReportView;
    IBOutlet UITextView *commentBox;
    IBOutlet UIButton *MaleButton;
    IBOutlet UIButton *FemaleButton;
    IBOutlet UIButton *FemaleOn;
    IBOutlet UIButton *MaleOn;
    IBOutlet UIButton *AMpressed;
    IBOutlet UIButton *NoonPressed;
    IBOutlet UIButton *PMPressed;
    IBOutlet UIButton *tick1;
    IBOutlet UIButton *tick2;
    IBOutlet UIButton *tick3;
    IBOutlet UITableView *tablePreview;
    NSMutableArray *prescriptionLabels;
    IBOutlet UIBarButtonItem *itemTry; 
    UIPopoverController *unitsPopOver;
    IBOutlet UITextField *unitsTextBox;
    UIPopoverController *frequencyPopOver;
    IBOutlet UIButton *showPrescriptionButton;
    IBOutlet UIButton *AddtoPrescriptionButton;
    IBOutlet UITextField *patientPhone;
    IBOutlet UITextField *patientEmail;
    IBOutlet UITextField *quantityBox;
    UIPopoverController *popOverPrescriptionList;
    id <passValuesToPrescriptionList> delegate1;
    
    NSArray *detailedDiseaseList;
    NSMutableArray *drugAdded, *dosageAdded, *daysAdded, *frequencyAdded;
    NSMutableArray *arrayForDiseases;
    NSMutableArray *sample;
    UIPopoverController *labPopOver;
    IBOutlet UITextField *selectedLabTest;
    IBOutlet UILabel *selectedLabName;

    // SQLite Variables
    
}
//+ (BOOL)initDB;
-(IBAction)addButtonClicked:(id)sender;
-(IBAction)AMPressed:(id)sender;
-(IBAction)NoonPressed:(id)sender;
-(IBAction)PMPressed:(id)sender;
    -(IBAction)maleButtonPressed:(id)sender;
-(IBAction)femaleButtonPressed:(id)sender;
-(IBAction)FrequencyPressed:(id)sender;
-(IBAction)goTo3:(id)sender;
-(IBAction)showUpDrugs:(id)sender;
-(IBAction)unitsPressed:(id)sender;
-(IBAction)ShowLabReport:(id)sender;
//-(IBAction)clearKeyBoard:(id)sender;
//-(IBAction)
-(IBAction)gotoReport:(id)sender;
-(IBAction)addPrescription:(id)sender;
-(IBAction)showPrescriptionList:(id)sender;
//-(void) checkAndCreateDatabase;
//-(IBAction)SearchButtonClicked:(id)sender;
//-(void) checkAndCreateDatabase;
//-(IBAction)SearchButtonClicked:(id)sender;
//@property (nonatomic, retain) UIPopoverController *popOverDrugAdd;
@property (nonatomic, retain) UIPopoverController *popOverDiseases;
@property (nonatomic, retain) NSMutableString *docName;
@property (nonatomic, retain) id delegate1;
@property (nonatomic, retain) NSString *selectedGender;
@property (nonatomic, retain) NSMutableArray *sample;
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) NSString * databaseName;
@property (nonatomic, retain) NSString * databasePath;
//@property (nonatomic, retain) NSString *diseaseToPass;
@end
