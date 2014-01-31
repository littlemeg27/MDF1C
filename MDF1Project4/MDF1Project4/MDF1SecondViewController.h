//
//  MDF1SecondViewController.h
//  MDF1Project4
//
//  Created by Brenna Pavlinchak on 1/27/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"

@interface MDF1SecondViewController : UIViewController
{
    DataManager *xmlString;
    
    IBOutlet UITextView *xmlDataText;
}

@end
