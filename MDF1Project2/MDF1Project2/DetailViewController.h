//
//  DetailViewController.h
//  MDF1Project2
//
//  Created by Brenna Pavlinchak on 1/16/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel* nameLabel;
    IBOutlet UILabel* linkLabel;
    IBOutlet UIButton* backButton;
}

@property(nonatomic, copy) NSString* name;
@property(nonatomic, copy) NSString* linkName;

-(void)updateUILabel;
-(IBAction)backButton:(id)sender;
@end
