//
//  ApplicationState.m
//  MDF1Project3
//
//  Created by Brenna Pavlinchak on 1/20/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "ApplicationState.h"
#import "CustomObject.h"

@implementation ApplicationState

static ApplicationState  *_sharedApplicationState = nil;

@synthesize businessArray;

+(ApplicationState*)sharedApplicationState //We are creating the singleton for the application
{
   @synchronized([ApplicationState class])
    {
        if(!_sharedApplicationState) //Check to see if it is the applicationState so that we can create it for the first time
        {
            _sharedApplicationState = [[self alloc] init];
        }
    
        return _sharedApplicationState;
    }
    
    return nil;
}

+(id)alloc
{
    @synchronized([ApplicationState class])
    {
        NSAssert(_sharedApplicationState == nil, @"You have already created a singleton, you do not need a second one!"); //Checking to see if we had already made a singleton
        _sharedApplicationState = [super alloc];
        return _sharedApplicationState;
    }
    
    return nil;
}

#pragma init/dealloc

-(id)init
{
    if((self = [super init]))
    {
        //Things we need to save for the singleton go in here
        CustomObject *business1 = [[CustomObject alloc] initWithNameName:@"Best Buy Pineville" longitude:-80.892296 latitude:35.083201];
        CustomObject *business2 = [[CustomObject alloc] initWithNameName:@"Pat-a-cakes Bakery" longitude:-81.042837 latitude:34.951758];
        CustomObject *business3 = [[CustomObject alloc] initWithNameName:@"BreadSmith" longitude:-80.978080 latitude:35.037729];
        CustomObject *business4 = [[CustomObject alloc] initWithNameName:@"Carowinds" longitude:-80.943768 latitude:35.103234];
        CustomObject *business5 = [[CustomObject alloc] initWithNameName:@"Concord Mills" longitude:-80.721188 latitude:35.368479];
        CustomObject *business6 = [[CustomObject alloc] initWithNameName:@"South Park" longitude:-80.831755 latitude:35.153939];
        CustomObject *business7 = [[CustomObject alloc] initWithNameName:@"Nothing But Noodles" longitude:-80.813800 latitude:35.059113];
        CustomObject *business8 = [[CustomObject alloc] initWithNameName:@"Winthrop University"  longitude:-81.028634 latitude:34.938513];
        CustomObject *business9 = [[CustomObject alloc] initWithNameName:@"Charlotte Douglas International Airport" longitude:-80.944165 latitude: 35.223517];
        CustomObject *business10 = [[CustomObject alloc] initWithNameName:@"Books-A-Million" longitude:-80.979465 latitude:34.941647];
        
        businessArray = [[NSMutableArray alloc] initWithObjects: business1, business2, business3, business4, business5, business6, business7, business8, business9, business10, nil];
    }
    
    return self;
}
@end
