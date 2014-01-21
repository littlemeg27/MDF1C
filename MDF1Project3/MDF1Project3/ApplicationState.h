//
//  ApplicationState.h
//  MDF1Project3
//
//  Created by Brenna Pavlinchak on 1/20/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplicationState : NSObject
{
    NSMutableArray *businessArray;
}

@property (strong)NSMutableArray *businessArray;

+(ApplicationState*)sharedApplicationState;

@end
