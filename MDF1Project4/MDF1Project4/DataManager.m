//
//  DataManager.m
//  MDF1Project4
//
//  Created by Jamal Moubarak on 1/30/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

@synthesize weatherString;

static DataManager* _sharedDataManager = nil;

+(DataManager*)sharedDataManager
{
    if (!_sharedDataManager)
    {
        _sharedDataManager = [[self alloc] init];
    }
    return _sharedDataManager;
}

-(id)init
{
    if ((self = [super init]))
    {
        weatherString = [[NSMutableString alloc] init];
    }
    return self;
}

@end
