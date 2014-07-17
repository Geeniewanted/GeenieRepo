//
//  SecondViewController.m
//  Pro_sample
//
//  Created by Raghuvardhan on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DiseaseViewController.h"
#import "DrugsViewController.h"
#import "ReportViewController.h"
//#import "DrugAddViewController.h"
#import "VariableContainer.h"
#import "StoreContainer.h"
#import "FrequencyViewController.h"
//#import "PrescriptionListViewController.h"
#import "ListOfPrescriptionViewController.h"
#import "LabTestViewController.h"
#import "sqlite3.h"
#import "FMDatabase.h"
@class DiseaseContainer;
@interface SecondViewController ()

@end

@implementation SecondViewController 
@synthesize sample;
//@synthesize popOverDrugAdd;
@synthesize docName;
@synthesize popOverDiseases;
@synthesize selectedGender;
@synthesize delegate1;
@synthesize delegate;
@synthesize databasePath, databaseName;

//@synthesize diseaseToPass;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [AddtoPrescriptionButton setTitle:@"Add to Prescription List >>" forState:UIControlStateNormal];


    [super viewDidLoad];
    sample  = [[NSMutableArray alloc] init];
    detailedDiseaseList = [[NSArray alloc] init];
    arrayForDiseases  = [[NSMutableArray alloc] init];
    VariableContainer *variables = [VariableContainer sharedVariables];
    variables.diseaseDetails = [[NSMutableArray alloc] init];
    variables.listOfDetails = [[NSMutableArray alloc] init];
    //tablePreview.backgroundView = nil;
    tick1.hidden = YES;
        tick2.hidden = YES;
        tick3.hidden = YES;
    MaleOn.hidden = YES;
    FemaleOn.hidden = YES;
    diseasesSelected.text = @"  ";
    //x = arc4random() % 300;
    //patNum = [[NSNumber alloc] initWithInt:0];
    
    arrayOfDiseases = [[NSArray alloc] initWithObjects:@" ",@" ",@" ", nil];
    

    /*myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;*/

    //SecondViewController *pv = [[SecondViewController alloc] initWithNibName:@"pickerView" bundle:nil];
    //[self.view addSubview:pv.view];
    
    // Do any additional setup after loading the view from its nib.
    //myPickerView.delegate=self;
    //[self.view addSubview:myPickerView];
    //[self.view addSubview:myImage];
    //Customizing the border for UITextView
    patAddress.layer.borderWidth = 0.5f;
    patAddress.layer.borderColor = [[UIColor grayColor] CGColor];
    patAddress.layer.cornerRadius = 8;
    commentBox.layer.borderWidth = 0.5f;
    commentBox.layer.borderColor = [[UIColor grayColor] CGColor];
    commentBox.layer.cornerRadius = 8;
    //myTextView.layer.shadowOffset = CGSizeMake(12.0f, 12.0f)
    //docName = [[NSString alloc] init];
    doctorName.text = docName;
    //patientNum.text = patNum;
    //x = rand();
    //patientNum.text = [[NSMutableString alloc] initWithFormat:@"%3.0f",x];
    //VariableContainer *variables = [VariableContainer sharedVariables];
    diseasesSelected.text = variables.selectedDisease;
    //drugAdded = [[NSMutableArray alloc] init];
    dosageAdded = [[NSMutableArray alloc] init];
    daysAdded  = [[NSMutableArray alloc] init];
    frequencyAdded = [[NSMutableArray alloc] init];
    [AMpressed setImage:[UIImage imageNamed:@"ON_CheckBox.png"] forState:UIControlStateSelected];
    [AMpressed setImage:[UIImage imageNamed:@"Option_Button_Not_Checked.png"] forState:UIControlStateNormal];
    [NoonPressed setImage:[UIImage imageNamed:@"ON_CheckBox.png"] forState:UIControlStateSelected];
    [NoonPressed setImage:[UIImage imageNamed:@"Option_Button_Not_Checked.png"] forState:UIControlStateNormal];
    [PMPressed setImage:[UIImage imageNamed:@"ON_CheckBox.png"] forState:UIControlStateSelected];
    [PMPressed setImage:[UIImage imageNamed:@"Option_Button_Not_Checked.png"] forState:UIControlStateNormal];
    //showPrescriptionButton.isEnabled = NO;
    showPrescriptionButton.hidden = YES;
    [AddtoPrescriptionButton setTitle:@"Add to Prescription List" forState:UIControlStateNormal];
    variables.i=0;
    
    // Get the path to the main bundle resource directory.
    

    //FMDB SQLite Coding
    
   /* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsPath = [paths objectAtIndex:0];
    //path = [docsPath stringByAppendingPathComponent:@"PrescriptionDetails.sqlite"];
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"DADatabase.sqlite"];
    NSLog(@"%@",defaultDBPath);
    database = [FMDatabase databaseWithPath:defaultDBPath];
    [database open];
    [database executeUpdate:@"create table patientDetails(pid text, age text, pname text, gender text, address text, phone text, email text)"];*/

}
/*- (UIView *)myPickerView:(UIPickerView *)myPickerView
            viewForRow:(NSInteger)row
//          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    UILabel *pickerLabel = (UILabel *)view; 
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 80, 32);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:UITextAlignmentLeft];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:60]];
    }
    
    [pickerLabel setText:[arrayOfDiseases objectAtIndex:row]];
    
    return pickerLabel;
    
}*/
- (void)viewDidUnload  
{
 
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(IBAction)addPrescription:(id)sender
{
    //NSString *selDrug;
    //[drugAdded addObject:drugSelected1.text];
    [dosageAdded addObject:dosageTextBox.text];
    [daysAdded addObject:daysEntered.text];
    [frequencyAdded addObject:FrequencyEntered.text];
    [table1 reloadData];
    [table2 reloadData];
    [table3 reloadData];
    [table4 reloadData];
    ReportViewController *reportView = [[ReportViewController alloc] init];
    reportView.drug1 = drugSelected1.text;
    [drugSelected1 resignFirstResponder];
        [dosageTextBox resignFirstResponder];
    [daysEntered resignFirstResponder];
    [FrequencyEntered resignFirstResponder];
    drugSelected1.text = @"";
    dosageTextBox.text = @"";
    daysEntered.text = @"";
    FrequencyEntered.text = @"";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}
/*-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{   
    if(tableView == tablePreview)
    {
    return 1;
    }
     return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [drugAdded count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
        
    }
    if(tableView == table1)
    {
        //drugAdded = [[NSMutableArray alloc] init];
    cell.textLabel.text = [drugAdded objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    
    }
    else if (tableView == table2) {
        cell.textLabel.text = [dosageAdded objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }
else if (tableView == table3) {
    cell.textLabel.text = [daysAdded objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
}
else {
  cell.textLabel.text = [frequencyAdded objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    
}
return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(tableView == table1)
    {
        return @"Drug";
    }
    else if (tableView == table2)
    {
        return @"Dosage";
    }
    else if(tableView == table3)
    {
        return @"Days";
    }
    else {
        return @"Frequency";
    }
}

- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(table1)
    {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [drugAdded removeObjectAtIndex:indexPath.row];
        
    }
    else if (table2) {
        if (editingStyle == UITableViewCellEditingStyleDelete)
        {
            [dosageAdded removeObjectAtIndex:indexPath.row];
           
        }
        else if (table3) {
            if (editingStyle == UITableViewCellEditingStyleDelete)
            {
                [daysAdded removeObjectAtIndex:indexPath.row];
             
            }
            else {
                if (editingStyle == UITableViewCellEditingStyleDelete)
                {
                    [frequencyAdded removeObjectAtIndex:indexPath.row];
                
                }
            }
        }
    }
        [table1 reloadData];
        [table2 reloadData];
        [table3 reloadData];
        [table4 reloadData];
    }


}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return arrayOfDiseases.count;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [arrayOfDiseases objectAtIndex:row];
}
*/

-(IBAction)goTo3:(id)sender
{
    
    
     DiseaseViewController *thirdView = [[DiseaseViewController alloc] initWithNibName:@"DiseaseViewController" bundle:Nil];
    /*[self.view addSubview:thirdView.view];
    thirdView.modalTransitionStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:thirdView animated:YES];*/
    thirdView.delegate = self;
popOverDiseases = [[UIPopoverController alloc] initWithContentViewController:thirdView];

[popOverDiseases setPopoverContentSize:CGSizeMake(250, 500) animated:NO];
[popOverDiseases presentPopoverFromRect:CGRectMake(384, 540, 25, 28) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    //[popOverDiseases dismissPopoverAnimated:YES];
    
    
}
/*- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (patientNum.text==@"32") {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Customer" message:@"New" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}
(IBAction)patientLookup:(id)sender
{
    //[patientNum resignFirstResponder];
}*/
-(IBAction)showUpDrugs:(id)sender
{
    DrugsViewController *drugView = [[DrugsViewController alloc] initWithNibName:@"DrugsViewController" bundle:Nil];
    drugView.delegate = self;
    popOverDrugs = [[UIPopoverController alloc] initWithContentViewController:drugView];
    [popOverDrugs setPopoverContentSize:CGSizeMake(300, 500) animated:NO];
    [popOverDrugs presentPopoverFromRect:CGRectMake(370, 576, 25, 28) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

-(IBAction)gotoReport:(id)sender
{
    
   //DrugAddViewController *drugview = [[DrugAddViewController alloc] init];
    /*if(!frequencyAdded || !frequencyAdded.count)
    {
        
        UIAlertView *alertNull = [[UIAlertView alloc] initWithTitle:@"Prescription Entry" message:@"No entry found in the prescription list. Please add prescriptions." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertNull show];
    }
    else {
    
    switch (gender.selectedSegmentIndex) {
        case 0:
            selectedGender = @" /M";
            break;
            
        default:
            selectedGender = @" /F";
            break;
    }
    ReportViewController *reportView = [[ReportViewController alloc] initWithNibName:@"ReportViewController" bundle:nil];
   reportView.ArrayToShowDrug = drugAdded;
    reportView.ArrayToShowDosage = dosageAdded;
    reportView.ArrayToShowDays = daysAdded;
    reportView.ArrayToShowFrequency = frequencyAdded;
    reportView.nameOfPatient = patName.text;
    reportView.ageOfPatient = patAge.text;
    reportView.addressOfPatient = patAddress.text;
    reportView.genderOfPatient = selectedGender;
    reportView.diseaseRetained = diseasesSelected.text;
    reportView.instructionsEntered =  commentsEntered.text;
    reportView.recommendedMedStore = storeInfo.text;
    reportView.drug1 = drugSelected1.text;
    reportView.dosage1 = dosageTextBox.text;
    reportView.frequency1 = FrequencyEntered.text;
    reportView.days1 = daysEntered.text;
        reportView.i = [dosageAdded count];

        reportView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:reportView animated:YES];
    

    }
*/
    ReportViewController *reportView = [[ReportViewController alloc] init];
    [self presentModalViewController:reportView animated:YES];
    
    
}

/*-(IBAction)addDrugClick:(id)sender
{
    if ([popOverDrugAdd isPopoverVisible]) {
        [popOverDrugAdd dismissPopoverAnimated:YES];
    }
    else {
        DrugAddViewController *drugAddView = [[DrugAddViewController alloc] initWithNibName:@"DrugAddViewController" bundle:nil];
        popOverDrugAdd = [[UIPopoverController alloc] initWithContentViewController:drugAddView];
        [popOverDrugAdd setPopoverContentSize:CGSizeMake(400, 200) animated:YES];
        [popOverDrugAdd presentPopoverFromBarButtonItem:drugAddButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
  
}*/
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [daysEntered resignFirstResponder];
}
-(void)PassValue:(NSString *)selectedDisease
{
    diseasesSelected.text = selectedDisease;
    [popOverDiseases dismissPopoverAnimated:YES];
}
-(void)PassDrugValue:(NSString *)selectedDrug
{
drugSelected1.text = selectedDrug;
    [popOverDrugs dismissPopoverAnimated:YES];
}

  

-(IBAction)clearAllButton:(id)sender
{
    SSNEntered.text = @"";
    patAge.text = @"";
    patName.text = @"";
    patAddress.text = @"";
    diseasesSelected.text = @"";
    drugSelected1.text = @"";
    dosageTextBox.text = @"";
    daysEntered.text = @"";
    FrequencyEntered.text = @"";
    commentsEntered.text = @"";
}


-(IBAction)showStores:(id)sender
{
        if(storeRecommendation.selectedSegmentIndex == 0)
        {
        StoreContainer *storeView = [[StoreContainer alloc] initWithNibName:@"StoreContainer" bundle:nil];
            storeView.delegate = self;
        storePopOver = [[UIPopoverController alloc] initWithContentViewController:storeView];
        [storePopOver setPopoverContentSize:CGSizeMake(250, 200) animated:YES];
            [storePopOver presentPopoverFromRect:CGRectMake(334, 786, 25, 28) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];    
             }
}


-(IBAction)patientLookup:(id)sender
{
    
   
    /* if([patientNum.text isEqualToString:[NSString stringWithFormat:@"%i", 1000]])
        {
            patName.text = @"Daniel Williams";
            patAge.text = @"24";
            gender.selectedSegmentIndex = 1;
            patAddress.text = @"11-A St. Francis Lane, West Michigan Ave, Jackson, MI 49201";
            MaleOn.hidden = NO;
            patientPhone.text = @"(708)-987-6432";
            patientEmail.text = @"daniel.williamsjrhunt@aol.com";
            [patientNum resignFirstResponder];
        }
    else {
        UIAlertView *alertLookup = [[UIAlertView alloc] initWithTitle:@"Patient Not Found" message:@"Unable to find patient information. Please go ahead and enter the details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertLookup show];
    }*/
    
}

-(void)PassStoreInfo:(NSString *)selectedStore
{
    storeInfo.text = selectedStore;
    [storePopOver dismissPopoverAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [commentBox resignFirstResponder];
    [daysEntered resignFirstResponder];
    return YES;
}
-(void)PassUnitValue:(NSString *)selectedUnit
{
    unitsTextBox.text = selectedUnit;
    [unitsPopOver dismissPopoverAnimated:YES];
}

-(IBAction)maleButtonPressed:(id)sender
{
    MaleOn.hidden = NO;
    FemaleOn.hidden = YES;
    //MaleButton.hidden = YES;
}


-(IBAction)femaleButtonPressed:(id)sender
{
    FemaleOn.hidden = NO;
    MaleOn.hidden = YES;
    //FemaleButton.hidden = YES;f
}

-(IBAction)AMPressed:(id)sender
{
    AMpressed.selected = !AMpressed.selected;

    
}

-(IBAction)NoonPressed:(id)sender
{
   NoonPressed.selected = !NoonPressed.selected;
}
-(IBAction)PMPressed:(id)sender
{
    PMPressed.selected = !PMPressed.selected;
}

    
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 
    UITouch *touch = [[event allTouches] anyObject];
    if ([daysEntered isFirstResponder] && [touch view] != daysEntered) {
        [daysEntered resignFirstResponder];
    }
    if ([patName isFirstResponder] && [touch view] != patName) {
        [patName resignFirstResponder];
    }
    if ([patientNum isFirstResponder] && [touch view] != patientNum) {
        [patientNum resignFirstResponder];
    }
    if ([patAge isFirstResponder] && [touch view] != patAge) {
        [patAge resignFirstResponder];
    }
    if ([patAddress isFirstResponder] && [touch view] != patAddress) {
        [patAddress resignFirstResponder];
    }
    if ([patientPhone isFirstResponder] && [touch view] != patientPhone) {
        [patientPhone resignFirstResponder];
    }
    if ([patientEmail isFirstResponder] && [touch view] != patientEmail) {
        [patientEmail resignFirstResponder];
    }
    if ([quantityBox isFirstResponder] && [touch view] != quantityBox) {
        [quantityBox resignFirstResponder];
    }
    if ([daysEntered isFirstResponder] && [touch view] != daysEntered) {
        [daysEntered resignFirstResponder];
    }
    if ([commentBox isFirstResponder] && [touch view] != commentBox) {
        [commentBox resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [prescriptionLabels count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SimpleTableIdentifier];
        
    }
    
    cell.textLabel.text = [prescriptionLabels objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"Sample";
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Saved Prescription List";
}
-(IBAction)unitsPressed:(id)sender
{
    UnitsContainer *unitsCon = [[UnitsContainer alloc] init];
    unitsCon.delegate = self;
    
    unitsPopOver = [[UIPopoverController alloc] initWithContentViewController:unitsCon];
    [unitsPopOver setPopoverContentSize:CGSizeMake(150, 250) animated:NO];
    [unitsPopOver presentPopoverFromRect:CGRectMake(711, 580, 20, 20) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    [unitsTextBox resignFirstResponder];
}
-(IBAction)FrequencyPressed:(id)sender
{
FrequencyViewController *frequencyView = [[FrequencyViewController alloc] init];
    frequencyView.delegate = self;

frequencyPopOver = [[UIPopoverController alloc] initWithContentViewController:frequencyView];
[frequencyPopOver setPopoverContentSize:CGSizeMake(160, 260) animated:NO];
[frequencyPopOver presentPopoverFromRect:CGRectMake(420, 636, 20, 20) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    [daysEntered resignFirstResponder];
}
-(void)PassFrequency:(NSString *)selectedFrequency
{
    FrequencyEntered.text = selectedFrequency;
    [frequencyPopOver dismissPopoverAnimated:YES];
     
     }
-(IBAction)addButtonClicked:(id)sender
{
    NSString *quantityToPass;
    quantityToPass = [NSString stringWithFormat:@"%@ %@", quantityBox.text, unitsTextBox.text];
    [sample addObject:diseasesSelected.text];
    VariableContainer *variables = [VariableContainer sharedVariables];
    variables.diseaseDetails = sample;
    showPrescriptionButton.hidden = NO;
    //NSString *quantityCorrect = 
    variables.listOfDetails = [[NSMutableArray alloc] initWithObjects:diseasesSelected.text, drugSelected1.text, quantityBox.text,unitsTextBox.text , daysEntered.text, FrequencyEntered.text, nil];
    drugSelected1.text = @"";
    quantityBox.text = @"";
    unitsTextBox.text = @"";
    daysEntered.text = @"";
    FrequencyEntered.text = @"";
    commentBox.text = @"";
    storeInfo.text = @"";
    /*UIAlertView *alertAdded = [[UIAlertView alloc] initWithTitle:@"Prescription Added!" message:@"Your prescription entry has been added to the list. Please tap the Show Prescription List button to view/edit your entries" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertAdded show];*/
    NSLog(@"Count of Sample Array: %i",[sample count]);
    ListOfPrescriptionViewController *listView  = [[ListOfPrescriptionViewController alloc] init];
    listView.arrayFromSecondView = sample;
    [AddtoPrescriptionButton setTitle:@"Add More >>" forState:UIControlEventTouchUpInside];
    
    //SQLite Command
    /*NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [documentPaths objectAtIndex:0];
    databasePath = [documentDir stringByAppendingPathComponent:@"DADatabase1.sqlite"];
    NSLog(@"%@",databasePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *appPath = [[NSBundle mainBundle] pathForResource:@"DADatabase1" ofType:@"sqlite"];
    //NSString *appPath = [[[NSBundle mainBundle] resourcePath]
                         //stringByAppendingPathComponent:@"DADatabase1.sqlite"];
    NSLog(@"%@",appPath);
    [fileManager copyItemAtPath:appPath toPath:databasePath error:nil];
    FMDatabase *database = [FMDatabase databaseWithPath: [[NSBundle mainBundle] pathForResource:@"DADatabase1" ofType:@"sqlite"]];
    //[database open];*/
    
    // Coding to connect SQLite 
    NSString *dbName = [[NSString alloc] initWithString:@"DADatabase1 19-30-53-494.sqlite"];
    NSString *documentsFolder       = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *databaseFullDocumentPath = [documentsFolder stringByAppendingPathComponent:dbName];
    NSLog(@"Database Full Path:               %@", databaseFullDocumentPath);
    NSString *databaseFullBundlePath   = [[NSBundle mainBundle] pathForResource:@"DADatabase1 19-30-53-494" ofType:@"sqlite"];
    NSLog(@"Database Full Bundle Path:        %@", databaseFullBundlePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //BOOL success = [fileManager fileExistsAtPath:writableDBPath];
    if (![fileManager fileExistsAtPath:databaseFullDocumentPath])
    {
        NSAssert([fileManager fileExistsAtPath:databaseFullBundlePath], @"Database not found in bundle");
        
        NSError *error;
        if (![fileManager copyItemAtPath:databaseFullBundlePath toPath:databaseFullDocumentPath error:&error])
            NSLog(@"Unable to copy database from '%@' to '%@': error = %@", databaseFullBundlePath, databaseFullDocumentPath, error);
    }
    FMDatabase *db = [[FMDatabase alloc] initWithPath:databaseFullDocumentPath];
    NSAssert(db, @"Unable to open create FMDatabase");
    BOOL success = [db open];
    NSAssert(success, @"Unable to open database");
    if (success)
    {
        // do whatever you want to do
        [db executeUpdate:[NSString stringWithFormat:@"INSERT INTO PatientDetails VALUES ('%@','%@','%@','Male','%@','%@','%@')", patientNum.text,patAge.text,patName.text,patAddress.text,patientPhone.text,patientEmail.text]];
        NSLog(@"Query executed!");
        FMResultSet *results = [db executeQuery:@"select patName from PatientDetails where patName is not null"];
        while([results next]) {
            //NSLog(@"Inside the loop statement!");
            NSString *name = [results stringForColumn:@"patName"];
            NSLog(@"Inserted Name: %@",name);
            
        }
    }
}
- (BOOL)textView:(UITextView *)textViewshouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [commentBox resignFirstResponder];
    }
    return YES;
}

-(IBAction)showPrescriptionList:(id)sender
{
    ListOfPrescriptionViewController *presView = [[ListOfPrescriptionViewController alloc] init];
    [self presentModalViewController:presView animated:YES];
    /*popOverPrescriptionList = [[UIPopoverController alloc] initWithContentViewController:presView];
    [popOverPrescriptionList setPopoverContentSize:CGSizeMake(700, 800) animated:YES];
    [popOverPrescriptionList presentPopoverFromRect:CGRectMake(248, 892, 20, 20) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];*/
    
}

-(IBAction)ShowLabReport:(id)sender
{
    LabTestViewController *labView = [[LabTestViewController alloc] init];
    labView.PopOverdelegate = self;
    labView.delegateForSecondView = self;
    labPopOver = [[UIPopoverController alloc] initWithContentViewController:labView];
    [labPopOver setPopoverContentSize:CGSizeMake(700, 321) animated:NO];
    [labPopOver presentPopoverFromRect:CGRectMake(726, 758, 25, 28) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}
-(void)passLabInfo:(NSMutableArray *)ArrayWithLabDetails
{
    LabTestViewController *labView = [[LabTestViewController alloc] init];
    labView.delegate = self;
    selectedLabTest.text = [ArrayWithLabDetails objectAtIndex:0];
    selectedLabName.text = [ArrayWithLabDetails objectAtIndex:1];
}
-(void)didClickCancelButton {
    

    NSLog(@"Delegate is called!");
        [labPopOver dismissPopoverAnimated:YES];

    }
-(void)kindOfTest:(NSString *)labTest labStore:(NSString *)labStoreName
{
    selectedLabTest.text = labTest;
    selectedLabName.text = labStoreName;
}

-(void)addPatientDetailsToSQLite
{
    
    
}
@end


