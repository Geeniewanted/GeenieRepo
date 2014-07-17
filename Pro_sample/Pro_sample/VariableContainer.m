//
//  VariableContainer.m
//  Pro_sample
//
//  Created by Raghuvardhan on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VariableContainer.h"
static VariableContainer *sharedVariables = nil;

@implementation VariableContainer
@synthesize selectedDisease;
@synthesize arrayContainingDiseases;
@synthesize diseaseDetails;
@synthesize listOfDetails;
@synthesize i;
@synthesize diseaseAdded;
@synthesize drugChosen;
@synthesize labNameChosen;
@synthesize labTestChosen;
@synthesize addedDisease;
+(VariableContainer *) sharedVariables 
{
    if(sharedVariables ==  nil)
    {
        sharedVariables = [[super allocWithZone:NULL] init];
    }
    return sharedVariables;
}

@end
