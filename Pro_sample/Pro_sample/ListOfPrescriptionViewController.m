//
//  ListOfPrescriptionViewController.m
//  Pro_sample
//
//  Created by Raghuvardhan on 18/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListOfPrescriptionViewController.h"
#import "VariableContainer.h"
#import "DiseaseViewController.h"
#import "DrugsViewController.h"

@interface ListOfPrescriptionViewController ()

@end

@implementation ListOfPrescriptionViewController
@synthesize arrayFromSecondView;

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
    DrugsViewController *drugView = [[DrugsViewController alloc] init];
    drugView.delegate = self;
    drugChosen = [[NSString alloc] init];
    i = 0;
    VariableContainer *variables = [VariableContainer sharedVariables];
    [super viewDidLoad];
    
    rowHeaderDisease = [[NSMutableArray alloc] initWithArray:variables.diseaseDetails];
    prescriptionDetails = [[NSMutableArray alloc] initWithObjects:@"Disease",@"Drug",@"Quantity",@"Units",@"Days",@"Frequency",@"Frequency",@"Medical Store",@"Lab Test",@"Instructions", nil];
    NSLog(@"Count of current Array : %i", [variables.diseaseDetails count]);
    //rowHeaderDisease = variables.diseaseDetails;
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
	return YES;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    VariableContainer *variables = [VariableContainer sharedVariables];
    return [variables.diseaseDetails count];
 
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    VariableContainer *variables = [VariableContainer sharedVariables];
    return [variables.listOfDetails count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //VariableContainer *variables = [VariableContainer sharedVariables];
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SimpleTableIdentifier];
        
    }
    //NSLog(@"%i",[variables.listOfDetails count]);
    VariableContainer *variables = [VariableContainer sharedVariables];
    cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
    
    cell.textLabel.text = [prescriptionDetails objectAtIndex:indexPath.row];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Heiti SC" size:22];
    cell.detailTextLabel.text = [variables.listOfDetails objectAtIndex:indexPath.row];
    if ([cell.detailTextLabel.text isEqualToString:@""]) 
    {
        cell.detailTextLabel.font = [UIFont fontWithName:@"Heiti SC" size:14];
        cell.detailTextLabel.text = @"- None Selected -";
        //UIButton *contactAddButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        //cell.accessoryAction = @selector(showMessage);
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return cell;
}
/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
       VariableContainer *variables = [VariableContainer sharedVariables];
    return [variables.diseaseDetails objectAtIndex:section];
}*/
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"You may continue doing so..";
}
-(void)PassDrugValue:(NSString *)selectedDrug
{
    
drugChosen = selectedDrug;
    //[popOverDrugs dismissPopoverAnimated:YES];
}
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    VariableContainer *variables = [VariableContainer sharedVariables];
     //UITableViewCell *cell = [table1 cellForRowAtIndexPath:indexPath];

    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
                [variables.listOfDetails removeObjectAtIndex:indexPath.row];
        [variables.listOfDetails insertObject:@"" atIndex:indexPath.row];
         //[variables.listOfDetails insertObject:@"" atIndex:indexPath.row];

        [table1 reloadData];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Adding" message:@"Addition" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert2 show];
    }
       
    
    
}
- (IBAction) EditTable:(id)sender
{
    
	if(self.editing)
	{
        editButton.title = @"Edit";
		[super setEditing:NO animated:NO]; 
		[table1 setEditing:NO animated:NO];
		[table1 reloadData];
    }
	else
	{
        editButton.title = @"Done Editing";
		[super setEditing:YES animated:YES]; 
		[table1 setEditing:YES animated:YES];
		[table1 reloadData];
    }
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [table1 cellForRowAtIndexPath:indexPath];
    if(cell.textLabel.text == @"Disease")
    {
    DiseaseViewController *diseaseView = [[DiseaseViewController alloc] init];
    popOverDisease = [[UIPopoverController alloc] initWithContentViewController:diseaseView];
    [popOverDisease setPopoverContentSize:CGSizeMake(400, 800) animated:YES];
    [popOverDisease presentPopoverFromRect:CGRectMake(600, 140, 72, 37) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
        VariableContainer *variables = [VariableContainer sharedVariables];
        cell.detailTextLabel.text = variables.drugChosen;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else if(cell.textLabel.text == @"Drug")
    {
        DrugsViewController *drugView = [[DrugsViewController alloc] init];
        popOverDisease = [[UIPopoverController alloc] initWithContentViewController:drugView];
        [popOverDisease setPopoverContentSize:CGSizeMake(400, 800) animated:YES];
        [popOverDisease presentPopoverFromRect:CGRectMake(600, 140, 72, 37) inView:self.view permittedArrowDirections:0 animated:YES]; 
    }
    else if (cell.textLabel.text == @"Days")
    {
        NSLog(@"Test");
    }
    else {
        UIAlertView *Alert = [[UIAlertView alloc] initWithTitle:@"Days" message:@"Please enter the number of days" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        Alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [Alert show];
    }
}


-(IBAction)addMore:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


-(void)showMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hi" message:@"Sample" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    UITableViewCell *cell;
    cell.textLabel.text = title;
    
}


@end