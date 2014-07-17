//
//  ViewController.h
//  Pro_sample
//
//  Created by Raghuvardhan on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SecondViewController;

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *imageTap;
    IBOutlet UITextField *userName;
    IBOutlet UITextField *passWord;
    NSString *docUserName;
    NSString *docPassword;
    IBOutlet UIButton *button1;
    NSString *user;
    NSString *password;
    
 
    
}
//-(IBAction)imageTapped:(id)sender;
-(IBAction)loginButton:(id)sender;
@end
