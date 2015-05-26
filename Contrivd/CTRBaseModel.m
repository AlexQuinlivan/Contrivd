//
//  CTRBaseModel.m
//  Contrivd
//
//  Created by Alex Quinlivan on 21/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRBaseModel.h"

@implementation CTRBaseModel

-(id) initWithDictionary:(NSDictionary *) dict {
    NSError* error;
    return [self initWithDictionary:dict error:&error];
}

+(JSONKeyMapper *) keyMapper {
    return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase;
}

+(BOOL) propertyIsOptional:(NSString *) propertyName {
    return YES;
}

@end
