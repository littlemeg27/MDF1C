//
//  MyMapAnnotation.m
//  MDF1Project3
//
//  Created by Brenna Pavlinchak on 1/20/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MyMapAnnotation.h"

@implementation MyMapAnnotation

@synthesize title, coordinate;

-(id)initWithTitle:(NSString*)text coord:(CLLocationCoordinate2D)coord
{
    if((self = [super init]))
    {
        title = text;
        coordinate = coord;
    }
    return self;
}

@end
