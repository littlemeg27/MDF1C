//
//  CustomObject.h
//  MDF1Project3
//
//  Created by Brenna Pavlinchak on 1/20/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomObject : NSObject
{
    NSString *nameOfBusiness;
    float longitudeOfBusiness;
    float latitudeOfBusiness;
}

-(id)initWithNameName:(NSString*)name longitude:(float)longitude latitude:(float)latitude;

@property (nonatomic, strong)NSString *nameOfBusiness;
@property (nonatomic, assign)float longitudeOfBusiness;
@property (nonatomic, assign)float latitudeOfBusiness;

@end
