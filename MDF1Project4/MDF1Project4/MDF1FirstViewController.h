//
//  MDF1FirstViewController.h
//  MDF1Project4
//
//  Created by Brenna Pavlinchak on 1/30/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherItems.h"

@interface MDF1FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    BOOL editMode;
    IBOutlet UIButton *editButton;
    IBOutlet UITableView *myTableView; //IB outlets
    
    NSURLRequest *requestTheXML;
    NSURL *xmlURL;
    NSURLConnection *connection;
    NSMutableData *requestTheData; //Connection information
    
    NSMutableString *cityName;
    NSMutableString *stateName;
    NSMutableString *countryName;
    NSMutableString *zipCode;
    NSMutableString *cityCode;
    NSMutableString *cityType; //NSMutable strings for the array and so we can display
    
    NSInteger *xmlItem;
    NSMutableArray *weather; //NSMutableArray for parsing
}

@end
