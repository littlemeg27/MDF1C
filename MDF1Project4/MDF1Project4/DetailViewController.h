//
//  DetailViewController.h
//  MDF1Project4
//
//  Created by Brenna Pavlinchak on 1/27/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel* cityLabel;
    IBOutlet UILabel* stateLabel;
    IBOutlet UILabel* countryLabel;
    IBOutlet UILabel* zipLabel;
    IBOutlet UILabel* codeLabel;
    IBOutlet UILabel* typeLabel;
    
    IBOutlet UIButton* backButton;
}

@property(nonatomic, copy) NSString* city;
@property(nonatomic, copy) NSString* state;
@property(nonatomic, copy) NSString* country;
@property(nonatomic, copy) NSString* zip;
@property(nonatomic, copy) NSString* code;
@property(nonatomic, copy) NSString* type;

-(void)updateUILabel;
-(IBAction)backButton:(id)sender;

@end
