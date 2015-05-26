//
//  CTRBaseModel.h
//  Contrivd
//
//  Created by Alex Quinlivan on 21/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "JSONModel.h"

#define CTR_MODEL_PROPERTY(_type) @property(nonatomic, strong, nullable) _type

@interface CTRBaseModel : JSONModel

@end
