//
//  FirstDetailViewController.m
//  MDF1Project2
//
//  Created by Brenna Pavlinchak on 1/16/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "SecondDetailViewController.h"

@interface FirstDetailViewController ()

@end

@implementation FirstDetailViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.title = @"First Page"; //Title of the app
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [super viewWillAppear:animated];
}
-(IBAction)onClick:(id)sender //Button to pop you into the next page
{
    SecondDetailViewController *secondView = [[SecondDetailViewController alloc] initWithNibName:@"SecondDetailViewController" bundle:nil];
    
    if(secondView !=nil)
    {
        [self.navigationController pushViewController:secondView animated:TRUE]; //Makes the move to the second view
    }
}

-(IBAction)backButton:(id)sender //Go back a page button
{
    [self.navigationController popViewControllerAnimated:TRUE];
}

@end

