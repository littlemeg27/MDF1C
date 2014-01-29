//
//  WeatherItems.h
//  MDF1Project4
//
//  Created by Brenna Pavlinchak on 1/29/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherItems : NSObject
{
    NSString *cityName;
    NSString *stateName;
    NSString *countryName;
    NSString *zipCode;
    NSString *cityCode;
    NSString *cityType;
}

-(id)initWithName:(NSString*)city state:(NSString*)state country:(NSString*)country zip:(NSString*)zip code:(NSString*)code type:(NSString*)type;

@end
