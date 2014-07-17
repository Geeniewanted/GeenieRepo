//
//  ViewController.m
//  Pro_sample
//
//  Created by Raghuvardhan on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@class SecondViewController;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    docUserName = [[NSString alloc] init];
    docPassword = [[NSString alloc] init];
    docUserName = userName.text;
    docPassword = @"Password";
    //passwordText.secureTextEntry = YES;
    passWord.secureTextEntry = YES;
    //user = [NSString stringWithFormat:@"Test"];
    //password = [NSString stringWithFormat:@"test123"];
 
    //SecondViewController *SecondView = [SecondViewController alloc];
    


	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

/*-(IBAction)imageTapped:(id)sender
{
 

    //self.navigationController.navigationBarHidden = NO;
}*/


-(IBAction)loginButton:(id)sender
{   

    /*if(![userName.text isEqualToString:user] || ![passWord.text isEqualToString:password])
    {
        
        UIAlertView *alertLogin = [[UIAlertView alloc] initWithTitle:@"Login Error!" message:@"Unable to login. Please enter the correct username and password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertLogin show];
    }
    else {*/
        SecondViewController *SecondView = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:Nil];
        //[self.view addSubview:SecondView.view];
        //[SecondView.view modalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        SecondView.docName = [[NSMutableString alloc] initWithString:userName.text];
        SecondView.modalTransitionStyle = UIModalPresentationFullScreen;
        [self presentModalViewController:SecondView animated:YES];

    //}
    

    
}

@end
