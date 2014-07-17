//
//  LabTestViewController.m
//  Pro_sample
//
//  Created by Raghuvardhan on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LabTestViewController.h"
#import "LabNameContainerViewController.h"
#import "VariableContainer.h"
#import "SecondViewController.h"
#import "LabTypesViewController.h"
@interface LabTestViewController ()

@end

@implementation LabTestViewController
@synthesize tableContents;
@synthesize sortedKeys;
@synthesize delegate;
@synthesize PopOverdelegate;
@synthesize delegateForSecondView;

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
    [super viewDidLoad];
  
    selectedLabTest.text = @"";
    labTestDetails = [[NSMutableArray alloc] initWithObjects:@"Cancer Test",@"Hair Analysis",@"Fertility Test",@"Medical Tests",@"Blood Tests",@"Face Lift",@"Arthroscopy",@"Forensic Tests", nil];
    NSArray *CancerTest = [[NSArray alloc]
                         initWithObjects:@"Ovarian Cancer Test",@"Bowel Cancer Test",nil];
	NSArray *HairAnalysis = [[NSArray alloc]
                         initWithObjects:@"Forensic Hair Analysis",nil];
    NSArray *FertilityTest = [[NSArray alloc]
                             initWithObjects:@"Male Fertility Test ",@"Female Fertility Test",nil];
    NSArray *BloodTest = [[NSArray alloc]
                          initWithObjects:@"ABO Blood Typing",@"Blood Calcium Levels", nil];
    NSArray *OvulationTest = [[NSArray alloc]
                          initWithObjects:@"Saliva Ovulation Test",@"Positive Ovulation Test", nil];
	NSArray *GeneticTesting = [[NSArray alloc]
                         initWithObjects:@"Duchenne Muscular Dystrophy Testing",@"Myotonic Dystrophy Testing",nil];
	NSDictionary *temp =[[NSDictionary alloc]
                         initWithObjectsAndKeys:CancerTest,@"Cancer Test",HairAnalysis,
                         @"Hair Analysis Test",FertilityTest,@"Fertility Test",BloodTest,@"Blood Test",OvulationTest, @"Ovulation Test",GeneticTesting,@"Genetic Testing",nil];
	self.tableContents =temp;
	self.sortedKeys =[[self.tableContents allKeys]
                      sortedArrayUsingSelector:@selector(compare:)];
    labInfo = [[NSMutableArray alloc] init];

    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sortedKeys count];
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

	return [self.sortedKeys objectAtIndex:section];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   	NSArray *listData =[self.tableContents objectForKey:
                        [self.sortedKeys objectAtIndex:section]];
	return [listData count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
	NSArray *listData =[self.tableContents objectForKey:
                        [self.sortedKeys objectAtIndex:[indexPath section]]];
    
	UITableViewCell * cell = [tableView
                              dequeueReusableCellWithIdentifier: SimpleTableIdentifier];
    
	if(cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
        
		/*cell = [[[UITableViewCell alloc]
         initWithStyle:UITableViewCellStyleSubtitle
         reuseIdentifier:SimpleTableIdentifier] autorelease];
         */
	}
    
	NSUInteger row = [indexPath row];
	cell.textLabel.text = [listData objectAtIndex:row];
    
	return cell;
}
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSArray *listData =[self.tableContents objectForKey:
                        [self.sortedKeys objectAtIndex:[indexPath section]]];
	NSUInteger row = [indexPath row];
	NSString *rowValue = [listData objectAtIndex:row];
    
	NSString *message = [[NSString alloc] initWithFormat:rowValue];
	selectedLabTest.text = message;
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(IBAction)showLabName:(id)sender
{
    
    VariableContainer *variables = [VariableContainer sharedVariables];
    LabNameContainerViewController *labNameView = [[LabNameContainerViewController alloc] init];
    labNameView.delegate = self;
    popUpLabName = [[UIPopoverController alloc] initWithContentViewController:labNameView];
    [popUpLabName setPopoverContentSize:CGSizeMake(200, 300) animated:NO];
    [popUpLabName presentPopoverFromRect:CGRectMake(544, 455, 0, 0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    labNameSelected.text = variables.labNameChosen;
}

-(void)passLab:(NSString *)selectedLabName
{
    NSLog(@"%@",selectedLabName);
    labNameSelected.text = selectedLabName;
    [popUpLabName dismissPopoverAnimated:YES];
}
-(IBAction)saveAndCloseButtonPressed:(id)sender
{
    SecondViewController *secondView = [[SecondViewController alloc] init];
    secondView.delegate = self;
    //labInfo = [[NSMutableArray alloc] initWithObjects:labNameSelected.text, nil];
    //if([delegate respondsToSelector:@selector(passLabDetails:)])
      // {
       //    [delegate passLabInfo:labInfo];
    //   }
   // NSLog(@"%@",[labInfo objectAtIndex:0]);
    //NSLog(@"%@",[labInfo objectAtIndex:1]);
    //[secondView setDelegate:self];
    [self.PopOverdelegate didClickCancelButton];
    NSLog(@"Button Pressed!");
    if([delegateForSecondView respondsToSelector:@selector(kindOfTest:labStore:)])
    {
        [delegateForSecondView kindOfTest:labTestInfo.text labStore:labNameSelected.text];
    }
}
-(IBAction)closeButtonPressed:(id)sender
{
    [self.PopOverdelegate didClickCancelButton];
    NSLog(@"Cancel Button Pressed!");
}
-(IBAction)ListofLabTests:(id)sender
{
    LabTypesViewController *labTypes = [[LabTypesViewController alloc] init];
    labTypes.delegate = self;
    popLabTests = [[UIPopoverController alloc] initWithContentViewController:labTypes];
    [popLabTests setPopoverContentSize:CGSizeMake(400, 500) animated:NO];
    [popLabTests presentPopoverFromRect:CGRectMake(542, 124, 43, 32) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
}
-(void)passLabTests:(NSString *)selectedLabInfo
{
    NSLog(@"%@", selectedLabInfo);
    labTestInfo.text = selectedLabInfo;
    [popLabTests dismissPopoverAnimated:YES];
}
@end
