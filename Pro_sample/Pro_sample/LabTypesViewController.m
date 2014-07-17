//
//  LabTypesViewController.m
//  Pro_sample
//
//  Created by Raghuvardhan on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LabTypesViewController.h"
#import "LabTestViewController.h"
@interface LabTypesViewController ()

@end

@implementation LabTypesViewController
@synthesize sortedKeys;
@synthesize tableContents;
@synthesize delegate;

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
    sectionHeader = [self.sortedKeys objectAtIndex:section];
	return sectionHeader;
    
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
     cell.textLabel.font = [UIFont fontWithName:@"Heiti SC Medium" size:16];
	cell.textLabel.text = [listData objectAtIndex:row];
    
	return cell;
}

/*- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSArray *listData =[self.tableContents objectForKey:
                        [self.sortedKeys objectAtIndex:[indexPath section]]];
	NSUInteger row = [indexPath row];
	NSString *rowValue = [listData objectAtIndex:row];
    
	//NSString *message = [[NSString alloc] initWithFormat:rowValue];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSString *selectedMainLabTest;
    selectedMainLabTest = [sortedKeys objectAtIndex:[indexPath section]];
    NSString *selectedLabDetails;
    NSArray *listData =[self.tableContents objectForKey:
                        [self.sortedKeys objectAtIndex:[indexPath section]]];
	NSUInteger row = [indexPath row];
	NSString *rowValue = [listData objectAtIndex:row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSString *message = [[NSString alloc] initWithFormat:rowValue];
	selectedLabDetails = [selectedMainLabTest stringByAppendingFormat:@" > "];
    selectedLabDetails = [selectedLabDetails stringByAppendingFormat:message];
    NSLog(@"%@",selectedLabDetails);
    if([self.delegate respondsToSelector:@selector(passLabTests:)])
    {
        [delegate passLabTests:selectedLabDetails];
    }
    
}

@end
