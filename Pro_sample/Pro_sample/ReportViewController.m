//
//  ReportViewController.m
//  Pro_sample
//
//  Created by Raghuvardhan on 21/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReportViewController.h"
#import "SecondViewController.h"
#import "Quartzcore/Quartzcore.h"

@interface ReportViewController ()

@end

@implementation ReportViewController
@synthesize nameOfPatient;
@synthesize ageOfPatient;
@synthesize numForPatient;
@synthesize genderOfPatient;
@synthesize addressOfPatient;
@synthesize diseaseRetained;
@synthesize instructionsEntered;
@synthesize recommendedMedStore;
@synthesize dosage1;
@synthesize drug1;
@synthesize frequency1;
@synthesize days1;
@synthesize ArrayToShowDrug;
@synthesize ArrayToShowDosage;
@synthesize ArrayToShowDays;
@synthesize ArrayToShowFrequency;
@synthesize i;

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
    //DrugsViewController *drugView = [[DrugsViewController alloc] init];
    //drugView.delegate = self;
    [super viewDidLoad];
    //SecondViewController *secondView = [[SecondViewController alloc] init];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    NSString *dateString = [dateFormat stringFromDate:date]; 
    dateOfReport.text = dateString;
    agePat.text = ageOfPatient;
    patientName.text = nameOfPatient;
    addressPat.text = addressOfPatient;
    genderSelected.text = genderOfPatient;
    diseasePatient.text = diseaseRetained;
    instructions.text = instructionsEntered;
    medStoreInfo.text = recommendedMedStore;
    //firstDrug.text = drug1;

    firstDosage.text = [ArrayToShowDosage objectAtIndex:0];
    firstFrequency.text = [ArrayToShowFrequency objectAtIndex:0];
    firstDays.text = [ArrayToShowDays objectAtIndex:0];
    firstDrug.text = [ArrayToShowDrug objectAtIndex:0];
    /*secondDosage.text = [ArrayToShowDosage objectAtIndex:1];
    secondFrequency.text = [ArrayToShowFrequency objectAtIndex:1];
    secondDays.text = [ArrayToShowDays objectAtIndex:1];
    secondDrug.text = [ArrayToShowDrug objectAtIndex:1];*/
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}
-(IBAction)printReport:(id)sender
{
    UIAlertView *alertPrint = [[UIAlertView alloc] initWithTitle:@"Printer not connected!" message:@"Unable to find a printer. Please check the printer settings." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                               [alertPrint show];
}
-(IBAction)goToEntryScreen:(id)sender
{
    //SecondViewController *entryScreen = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
     self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)newPatientButtonClicked:(id)sender
{
    SecondViewController *newPatientEntry = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self presentModalViewController:newPatientEntry animated:YES];
}
- (IBAction)printContent:(id)sender {
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    pic.delegate = self;
    
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputGeneral;
    printInfo.jobName = @"Sample";
    pic.printInfo = printInfo;
    
    UISimpleTextPrintFormatter *textFormatter = [[UISimpleTextPrintFormatter alloc]
                                                 initWithText:@"Text"];
    textFormatter.startPage = 1;
    textFormatter.contentInsets = UIEdgeInsetsMake(72.0, 72.0, 72.0, 72.0); // 1 inch margins
    textFormatter.maximumContentWidth = 6 * 72.0;
    pic.printFormatter = textFormatter;
    //[textFormatter release];
    pic.showsPageRange = YES;
    
    void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
    ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
        if (!completed && error) {
            NSLog(@"Printing could not complete because of error: %@", error);
        }
    };
    if (UI_USER_INTERFACE_IDIOM() == UIButtonTypeRoundedRect) {
        //[pic presentFromBarButtonItem:sender animated:YES completionHandler:completionHandler];
        [pic presentFromBarButtonItem:printerButton animated:YES completionHandler:completionHandler];
    } else {
        [pic presentAnimated:YES completionHandler:completionHandler];
    }

    }
-(void)PassDrugValue:(NSString *)selectedDrug
{
    firstDrug.text = selectedDrug;
}
- (void)drawRect:(CGRect)rect {  
    UIGraphicsBeginImageContext(CGSizeMake(768, 914));
    //UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();             
    UIGraphicsEndImageContext();   
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);   
    NSLog(@"Image Captured");
}
-(IBAction)capture:(id)sender
{
    [self drawRect:CGRectMake(300, 200, 200, 200)];
    UIAlertView *alertCapture = [[UIAlertView alloc] initWithTitle:@"Report Saved!" message:@"This medical report has been saved successfully!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

    [alertCapture show];
    
}

-(IBAction)actionButtonClicked:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose an action" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Print", @"Save to My Photos",@"E-mail Me", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showFromBarButtonItem:actionButton animated:YES];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        NSLog(@"Button Pressed!");
        }
}
@end
