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
        CustomObject *business1 = [[CustomObject alloc] initWithNameName:@"Carolina Place Mall" longitude:-80.877224 latitude:35.082200];
        CustomObject *business2 = [[CustomObject alloc] initWithNameName:@"Amelie's" longitude:-80.812057 latitude:35.241145];
        CustomObject *business3 = [[CustomObject alloc] initWithNameName:@"CupCrazed" longitude:-80.967143 latitude:35.028639];
        CustomObject *business4 = [[CustomObject alloc] initWithNameName:@"York County Courthouse" longitude:-81.241968 latitude:34.994118];
        CustomObject *business5 = [[CustomObject alloc] initWithNameName:@"Dave and Busters" longitude:-80.722255 latitude:35.369231];
        CustomObject *business6 = [[CustomObject alloc] initWithNameName:@"Apple Store at NorthLake Mall" longitude:-80.851181 latitude:35.352549];
        CustomObject *business7 = [[CustomObject alloc] initWithNameName:@"FireBird's" longitude:-80.815844 latitude:35.062055];
        CustomObject *business8 = [[CustomObject alloc] initWithNameName:@"Winthrop University Coliseum"  longitude:-81.014634 latitude:34.948344];
        CustomObject *business9 = [[CustomObject alloc] initWithNameName:@"Barnes and Noble" longitude:-80.824574 latitude: 35.155506];
        CustomObject *business10 = [[CustomObject alloc] initWithNameName:@"Moe's Rock Hill" longitude:-80.979465 latitude:34.944206];
        CustomObject *business11 = [[CustomObject alloc] initWithNameName:@"National Whitewater Center" longitude:-81.005258 latitude:35.272425];
        CustomObject *business12 = [[CustomObject alloc] initWithNameName:@"Discovery Place" longitude:-80.840927 latitude:35.229601];
        
        businessArray = [[NSMutableArray alloc] initWithObjects: business1, business2, business3, business4, business5, business6, business7, business8, business9, business10, business11, business12, nil];
    }
    
    return self;
}
@end
