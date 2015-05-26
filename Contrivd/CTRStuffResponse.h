//
//  CTRStuffResponse.h
//  Contrivd
//
//  Created by Alex Quinlivan on 21/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRBaseModel.h"
#import "CTRStuffStory.h"

@interface CTRStuffResponse : CTRBaseModel

CTR_MODEL_PROPERTY(NSArray<CTRStuffStory> *) stories;

@end
