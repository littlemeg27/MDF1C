//
//  DetailViewController.h
//  MDF1Project3
//
//  Created by Brenna Pavlinchak on 1/21/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet MKMapView *mapView;
    IBOutlet UIButton* backButton;
}

//@property (nonatomic, copy) NSString *name;
//@property (nonatomic) float *latit;
//@property (nonatomic) float *longi;
@property (nonatomic) NSObject *mapInfo;


-(IBAction)backButton:(id)sender;

@end
