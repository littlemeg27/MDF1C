//
//  DetailViewController.h
//  MDF1Project1
//
//  Created by Brenna Pavlinchak on 1/10/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel* showNameLabel;
    IBOutlet UILabel* stationLabel;
    IBOutlet UILabel* numberOfYearsLabel;
    IBOutlet UIButton* backButton;
}

@property(nonatomic, copy) NSString* showName;
@property(nonatomic, copy) NSString* station;
@property(nonatomic, copy) NSString* years;

-(void)updateUILabel;
-(IBAction)backButton:(id)sender;

@end