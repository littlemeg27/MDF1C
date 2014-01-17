//
//  CustomTableViewCell.h
//  MDF1Project1
//
//  Created by Brenna Pavlinchak on 1/10/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell
{
    IBOutlet UILabel *showNameLabel;
    IBOutlet UILabel *stationLabel;
}

@property (nonatomic, strong) UILabel* showNameLabel;
@property (nonatomic, strong) UILabel* stationLabel;

@end

