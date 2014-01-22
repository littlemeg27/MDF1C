//
//  MDF1SecondViewController.m
//  MDF1Project3
//
//  Created by Brenna Pavlinchak on 1/20/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF1SecondViewController.h"
#import "ApplicationState.h"
#import "MyMapAnnotation.h"
#import "CustomObject.h"


@interface MDF1SecondViewController ()

@end

@implementation MDF1SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Map View", @"Map View");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    MKCoordinateSpan span; //The zoom level of the map
    span.latitudeDelta = 1.0;
    span.longitudeDelta = 1.0;
    
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

-(void) viewDidAppear:(BOOL)animated
{
    
    ApplicationState *theAppState = [ApplicationState sharedApplicationState];
    
    for (int i = 0; i <= 11; i++)
    {
        CustomObject *mapInfo = [theAppState.businessArray objectAtIndex:i];
        MyMapAnnotation *anno = [[MyMapAnnotation alloc]initWithTitle:mapInfo.nameOfBusiness coord:CLLocationCoordinate2DMake(mapInfo.latitudeOfBusiness, mapInfo.longitudeOfBusiness)];
    
        if(theAppState != nil)
        {
            [mapView addAnnotation:anno];
        }
    }

    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
