//
//  DetailViewController.m
//  MDF1Project3
//
//  Created by Brenna Pavlinchak on 1/21/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "DetailViewController.h"
#import "MDF1FirstViewController.h"
#import "ApplicationState.h"
#import "MyMapAnnotation.h"
#import "CustomObject.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize name;
@synthesize latit;
@synthesize longi;

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
    MKCoordinateSpan span; //The zoom level of the map
    span.latitudeDelta = .5;
    span.longitudeDelta = .5;
    
    CLLocationCoordinate2D location; //The location of the map
    location.latitude = 35.227087;
    location.longitude = -80.843127;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapView.region = region;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    ApplicationState *theAppState = [ApplicationState sharedApplicationState];
    
    CustomObject *mapInfo = [theAppState.businessArray objectAtIndex:0];
    MyMapAnnotation *anno = [[MyMapAnnotation alloc]initWithTitle:mapInfo.nameOfBusiness coord:CLLocationCoordinate2DMake(mapInfo.latitudeOfBusiness, mapInfo.longitudeOfBusiness)];
    NSLog(@"Map info %@", name);
    
    if(theAppState != nil)
    {
        [mapView addAnnotation:anno];
    }
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backButton:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}


@end
