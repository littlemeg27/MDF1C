//
//  WeatherItems.m
//  MDF1Project4
//
//  Created by Brenna Pavlinchak on 1/29/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "WeatherItems.h"

@implementation WeatherItems
@synthesize cityName, stateName, countryName, zipCode, cityCode, cityType;


-(id)initWithName:(NSString*)city state:(NSString*)state country:(NSString*)country zip:(NSString*)zip code:(NSString*)code type:(NSString*)type
{
    if((self = [super init]))
    {
        cityName = city;
        stateName = state;
        countryName = country;
        zipCode = zip;
        cityCode = code;
        cityType = type;
    }
    return self;
}


@end
