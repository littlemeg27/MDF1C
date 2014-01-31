//
//  MDF1FirstViewController.h
//  MDF1Project4
//
//  Created by Brenna Pavlinchak on 1/27/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherItems.h"
#import "DataManager.h"

@interface MDF1FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    DataManager *stringFile;
    
    BOOL editMode;
    IBOutlet UIButton *editButton;
    IBOutlet UITableView *myTableView;
    
    NSURLRequest *requestTheXML;
    NSURL *xmlURL;
    NSURLConnection *connection;
    NSMutableData *requestTheData;
    NSMutableString *weatherString;
    
    NSMutableString *cityName;
    NSMutableString *stateName;
    NSMutableString *countryName;
    NSMutableString *zipCode;
    NSMutableString *cityCode;
    NSMutableString *cityType;
    
    NSInteger *xmlItem;
    NSMutableArray *weather;
}

@end

