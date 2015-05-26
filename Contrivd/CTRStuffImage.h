//
//  CTRStuffImage.h
//  Contrivd
//
//  Created by Alex Quinlivan on 21/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRBaseModel.h"

@protocol CTRStuffImageVariant;
@protocol CTRStuffImage;

@interface CTRStuffImage : CTRBaseModel

CTR_MODEL_PROPERTY(NSString *) creditline;
CTR_MODEL_PROPERTY(NSString *) caption;
CTR_MODEL_PROPERTY(NSString *) datetimeDisplay;
CTR_MODEL_PROPERTY(NSArray<CTRStuffImageVariant> *) variants;

@end

@interface CTRStuffImageVariant : CTRBaseModel

CTR_MODEL_PROPERTY(NSString *) layout;
CTR_MODEL_PROPERTY(NSString *) src;

@end

@protocol CTRStuffImage @end
@protocol CTRStuffImageVariant @end
