//
//  CustomObject.m
//  MDF1Project3
//
//  Created by Brenna Pavlinchak on 1/20/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "CustomObject.h"

@implementation CustomObject

@synthesize nameOfBusiness, longitudeOfBusiness, latitudeOfBusiness;

-(id)initWithNameName:(NSString*)name  longitude:(float)longitude latitude:(float)latitude
{
    if((self = [super init]))
    {
        nameOfBusiness = [name copy];
        longitudeOfBusiness = longitude;
        latitudeOfBusiness = latitude;
    }
    return self;
}


@end
