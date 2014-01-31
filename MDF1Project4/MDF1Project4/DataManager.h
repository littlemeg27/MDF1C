//
//  DataManager.h
//  MDF1Project4
//
//  Created by Jamal Moubarak on 1/30/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
{
    NSMutableString *weatherString;
}

+(DataManager*)sharedDataManager;

@property (nonatomic, strong)NSMutableString *weatherString;

@end