//
//  UnitsContainer.h
//  Pro_sample
//
//  Created by Raghuvardhan on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol passUnits <NSObject>
-(void)PassUnitValue:(NSString *)selectedUnit;
@end


@interface UnitsContainer : UITableViewController
{
    NSMutableArray *units;
    id<passUnits>delegate;
}
@property (nonatomic, retain)  id delegate;
@end
