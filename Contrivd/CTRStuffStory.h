//
//  CTRStuffStory.h
//  Contrivd
//
//  Created by Alex Quinlivan on 21/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRBaseModel.h"
#import "CTRStuffImage.h"

@protocol CTRStuffStory;

@interface CTRStuffStory : CTRBaseModel

CTR_MODEL_PROPERTY(NSString *) title;
CTR_MODEL_PROPERTY(NSString *) body;
CTR_MODEL_PROPERTY(NSString *) byline;
CTR_MODEL_PROPERTY(NSString *) sourceName;
CTR_MODEL_PROPERTY(NSString *) datetimeDisplay;
CTR_MODEL_PROPERTY(NSArray<CTRStuffImage> *) images;

-(nullable NSString *) bigImage;
-(nonnull NSAttributedString *) attributedBody;

@end

@protocol CTRStuffStory @end
