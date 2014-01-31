//
//  DetailViewController.m
//  MDF1Project4
//
//  Created by Brenna Pavlinchak on 1/30/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize city;
@synthesize state;
@synthesize country;
@synthesize zip;
@synthesize code;
@synthesize type;

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

-(void)updateUILabel
{
    cityLabel.text = city;
    stateLabel.text = state;
    countryLabel.text = country;
    zipLabel.text = zip;
    codeLabel.text = code;
    typeLabel.text = type;
}

-(IBAction)backButton:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}


@end
