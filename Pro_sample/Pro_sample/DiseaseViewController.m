//
//  DiseaseViewController.m
//  Pro_sample
//
//  Created by Raghuvardhan on 18/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DiseaseViewController.h"
#import "SecondViewController.h"
#import "VariableContainer.h"
#import "FMDatabase.h"

@interface DiseaseViewController ()

@end

@implementation DiseaseViewController
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
    ArrayToLoadDiseases = [[NSMutableArray alloc] init];
    VariableContainer *variables = [VariableContainer sharedVariables];
    variables.diseaseAdded = [[NSMutableArray alloc] init];
    variables.addedDisease = [[NSString alloc] init];
    diseases = [[NSMutableArray alloc] initWithObjects:@"Lukhemia",@"Fever",@"Cold",@"Cholera",@"Pneumonia",@"Strep Throat",@"Cancer",@"Measles",@"Aids",@"Tuberculosis",@"Backache",@"Blood pressure",@"Bronchial asthma",@"Brucellosis",@"Campylobacter",@"Carbuncle",@"Carcinomatosis",@"Cardiac debility",@"Carditis",@"Cataract",@"Cerebral abscess",@"Demyelination",@"Dementia",@"Diarrhoea",@"Empyema",@"Endocarditis",@"Frozen shoulder",@"Glaucoma",@"Gout",@"HIV Infection",@"Hyperemesis",@"Impetigo",@"Indigestion",@"Keratitis",@"Lobectomy", nil];
    // Do any additional setup after loading the view from its nib.
    
    //SQLite Coding
    NSArray *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentsPath objectAtIndex:0];
	NSString *databasePath = [documentsDir stringByAppendingPathComponent:@"DADatabase1 19-30-53-494.sqlite"];
    NSString *appPath = [[[NSBundle mainBundle] resourcePath] 
                         stringByAppendingPathComponent:@"DADatabase1 19-30-53-494.sqlite"];
    NSLog(@"%@",appPath);
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath]; 
    
    //[database open];*/
    [database open];
    //FMResultSet *results = [database executeQuery:@"select col_2 from DiseaseList where col_2 not null"];
  
        FMResultSet *results = [database executeQuery:@"select col_2 from DiseaseList where col_2 not null"];
    NSLog(@"%@",results);
    while([results next]) {
        //NSLog(@"Inside the loop statement!");
        NSString *name = [results stringForColumn:@"col_2"];
        [ArrayToLoadDiseases addObject:name];
    }
    [table reloadData];
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
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%i", [ArrayToLoadDiseases count]);
    return [ArrayToLoadDiseases count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
        
    }
    //UIView *bgColorView = [[UIView alloc] init];
    //[bgColorView setBackgroundColor:[UIColor blueColor]];
    //cell.selectedBackgroundView = bgColorView;
    //cell.selectedBackgroundView = [self view];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.font = [UIFont fontWithName:@"Heiti SC Medium" size:16];
    cell.textLabel.text = [ArrayToLoadDiseases objectAtIndex:indexPath.row];
    //cell.textLabel.textColor = [UIColor ];
    return cell;
}

-(IBAction)addDiseaseButtonClicked:(id)sender
{
    
    UIAlertView *alertAdd = [[UIAlertView alloc] initWithTitle:@"Add a Disease" message:@"Please enter the disease and tap Done" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
    alertAdd.alertViewStyle = UIAlertViewStylePlainTextInput;
     [alertAdd show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    VariableContainer *variables = [VariableContainer sharedVariables];
    
    variables.addedDisease = [alertView textFieldAtIndex:0].text; 
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
        [db executeUpdate:[NSString stringWithFormat:@"INSERT INTO DiseaseList (col_2) VALUES ('%@')",variables.addedDisease]];
        NSLog(@"Query executed!");
        FMResultSet *results = [db executeQuery:@"select distinct col_2 from DiseaseList where col_2 is not null"];
        NSLog(@"Rs contains => %@",results);
        while([results next]) {
            //NSLog(@"Inside the loop statement!");
            NSString *name = [results stringForColumn:@"col_2"];
            NSLog(@"Inserted Name: %@",name);
            
        }
    
    }

    [ArrayToLoadDiseases addObject:variables.addedDisease];
    [table reloadData];
    NSLog(@"%@",variables.addedDisease);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    VariableContainer *variables = [VariableContainer sharedVariables];
    variables.drugChosen = [ArrayToLoadDiseases objectAtIndex:indexPath.row];
    NSLog(@"%@", variables.drugChosen);
    
    SecondViewController *secondView = [[SecondViewController alloc] init];
        
    if([delegate respondsToSelector:@selector(PassValue:)])
    {
        [delegate PassValue:[ArrayToLoadDiseases objectAtIndex:indexPath.row]];           
        
    }
    [secondView.popOverDiseases setPopoverContentSize:CGSizeMake(400, 100) animated:YES];
}

@end
