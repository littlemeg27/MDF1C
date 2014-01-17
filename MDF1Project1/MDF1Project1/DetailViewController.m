//
//  DetailViewController.m
//  MDF1Project1
//
//  Created by Brenna Pavlinchak on 1/10/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize showName;
@synthesize station;
@synthesize years;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
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

-(void)updateUILabel
{
    showNameLabel.text = showName;
    stationLabel.text = station;
    numberOfYearsLabel.text = years;
}

-(IBAction)backButton:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
