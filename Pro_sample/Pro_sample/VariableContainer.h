//
//  VariableContainer.h
//  Pro_sample
//
//  Created by Raghuvardhan on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface VariableContainer : NSObject
{
    NSMutableString *selectedDisease;
    NSMutableArray *arrayContainingDiseases;
    NSString *drugChosen;
    NSMutableArray *diseaseAdded;
    NSString *labNameChosen;
    NSString *labTestChosen;
    NSString *addedDisease;

    
}
@property (nonatomic, retain) NSMutableString *selectedDisease;
@property (nonatomic, retain) NSMutableArray *arrayContainingDiseases;
@property (nonatomic, retain) NSMutableArray *diseaseDetails;
@property (nonatomic) int i;
@property (nonatomic, retain) NSMutableArray *listOfDetails;
@property(nonatomic, retain)     NSString *drugChosen;
@property (nonatomic, retain) NSMutableArray *diseaseAdded;
@property (nonatomic, retain)     NSString *labNameChosen;
@property (nonatomic, retain)     NSString *labTestChosen;
@property (nonatomic, retain)     NSString *addedDisease;
+(VariableContainer *)sharedVariables;
@end
