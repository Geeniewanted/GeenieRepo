//
//  DrugsViewController.m
//  Pro_sample
//
//  Created by Raghuvardhan on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DrugsViewController.h"
#import "SecondViewController.h"
#import <SQLite3.h>

@interface DrugsViewController ()

@end

@implementation DrugsViewController
@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    arrayToLoadDiseases = [[NSMutableArray alloc] init];
    listOfDrugs = [[NSArray alloc] initWithObjects:@"Ornidazole",@"Aceclofenac",@"Budesonide",@"Diclofenac",@"Degarelix",@"Linagliptin",@"Eribulin mesylate solution",@"Plerixafor",@"Cephalexin IP",@"Mucotrol", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //NSArray *arrayPathComponent=[NSArray arrayWithObjects:NSHomeDirectory(),@"Documents",@"DADatabase.sqlite",nil];
   // NSString *destinationPath=[NSString pathWithComponents:arrayPathComponent];
    NSArray *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentsPath objectAtIndex:0];
	NSString *databasePath = [documentsDir stringByAppendingPathComponent:@"DADatabase1 19-30-53-494.sqlite"];
    NSString *appPath = [[[NSBundle mainBundle] resourcePath] 
                         stringByAppendingPathComponent:@"DADatabase1 19-30-53-494.sqlite"];
    NSLog(@"%@",appPath);
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath]; 
    //[database open];*/

    //[database open];*/
    [database open];
        FMResultSet *results = [database executeQuery:@"SELECT distinct * from DrugList"];
        while([results next]) {
            //NSLog(@"Inside the loop statement!");
            NSString *name = [results stringForColumn:@"Drugname"];
            [arrayToLoadDiseases addObject:name];
  
   
    }
    [database close];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [arrayToLoadDiseases count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    //selectedDrug = 
    cell.textLabel.font = [UIFont fontWithName:@"Heiti SC Medium" size:16];
    cell.textLabel.text = [arrayToLoadDiseases objectAtIndex:indexPath.row];
    return cell;
    //NSLog(@"%@",reportView.drug1);
    // Configure the cell...
    
   
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    //SecondViewController *secondView = [[SecondViewController alloc] init];
    /*NSString *currentSel = [listOfDrugs objectAtIndex:indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Drug selected!" message:currentSel delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
    [alert show];*/
    if([delegate respondsToSelector:@selector(PassDrugValue:)])
    {
        [delegate PassDrugValue:[arrayToLoadDiseases objectAtIndex:indexPath.row]];
       
    }
         //[secondView.popOverDrugAdd setPopoverContentSize:CGSizeMake(400, 100) animated:YES];
    
    //[alert show];
}
@end
