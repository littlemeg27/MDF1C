//
//  MDF1ViewController.h
//  MDF1Project1
//
//  Created by Brenna Pavlinchak on 1/10/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDF1ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tableView;
    
    NSMutableArray *array1;
    NSMutableArray *array2;
    NSMutableArray *array3;
    UIAlertView *editAlert;
    BOOL editMode;
    
    IBOutlet UIButton *editButton;
}

@end

