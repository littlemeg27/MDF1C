//
//  ThirdViewController.m
//  MDF1Project2
//
//  Created by Brenna Pavlinchak on 1/16/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "ThirdViewController.h"
#import "CustomObject.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Custom Object", @"Custom Object");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    CustomObject *info1 = [[CustomObject alloc] initWithName:@"Test1" obj2:@"Test1"];
    CustomObject *info2 = [[CustomObject alloc] initWithName:@"Test2" obj2:@"Test2"];
    CustomObject *info3 = [[CustomObject alloc] initWithName:@"Test3" obj2:@"Test3"];
    CustomObject *info4 = [[CustomObject alloc] initWithName:@"Test4" obj2:@"Test4"];
    CustomObject *info5 = [[CustomObject alloc] initWithName:@"Test5" obj2:@"Test5"];
                           
    customArray = [[NSMutableArray alloc] initWithObjects:info1, info2, info3, info4, info5, nil];
                           
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.title = @"Custom Object"; //Title of the app
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
