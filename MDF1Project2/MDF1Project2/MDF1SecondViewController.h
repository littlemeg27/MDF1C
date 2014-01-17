//
//  MDF1SecondViewController.h
//  MDF1Project2
//
//  Created by Brenna Pavlinchak on 1/16/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDF1SecondViewController : UIViewController
{
    IBOutlet UITableView *tableView;
    
    NSMutableArray *array1;
    NSMutableArray *array2;
    UIAlertView *editAlert;
    BOOL editMode;
    
    IBOutlet UIButton *editButton;
}
@end
