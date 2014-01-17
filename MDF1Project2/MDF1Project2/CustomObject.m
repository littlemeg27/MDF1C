//
//  CustomObject.m
//  MDF1Project2
//
//  Created by Brenna Pavlinchak on 1/16/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "CustomObject.h"

@implementation CustomObject
@synthesize object1, object2;

-(id)initWithName:(NSString*)obj1 obj2:(NSString*)obj2
{
    if ((self = [super init]))
    {
        object1 = [obj1 copy];
        object2 = [obj2 copy];
        // Custom initialization
    }
    return self;
}

@end
