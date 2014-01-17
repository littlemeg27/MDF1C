//
//  CustomObject.h
//  MDF1Project2
//
//  Created by Brenna Pavlinchak on 1/16/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomObject : NSObject
{
    NSString *object1;
    NSString *object2;
}

-(id)initWithName:(NSString*)obj1 obj2:(NSString*)obj2;

@property (nonatomic, copy)NSString *object1;
@property (nonatomic, copy)NSString *object2;

@end
