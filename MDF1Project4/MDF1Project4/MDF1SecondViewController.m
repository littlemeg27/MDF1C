//
//  MDF1SecondViewController.m
//  MDF1Project4
//
//  Created by Brenna Pavlinchak on 1/27/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF1SecondViewController.h"

@interface MDF1SecondViewController ()

@end

@implementation MDF1SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Full XML", @"Full XML");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    //grab data from singleton
    xmlString = [DataManager sharedDataManager];
    
    //create a local string
    NSMutableString *localXmlString = xmlString.weatherString;
    
    //load local string into UITextView
    xmlDataText.text = localXmlString;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
