//
//  StoreContainer.h
//  Pro_sample
//
//  Created by Raghuvardhan on 03/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol passStoreInfo <NSObject>

-(void)PassStoreInfo:(NSString *)selectedStore;

@end

@interface StoreContainer : UITableViewController
{
    NSMutableArray *storeList;
    id<passStoreInfo> delegate;
}
@property (nonatomic, retain) id delegate;
@end
