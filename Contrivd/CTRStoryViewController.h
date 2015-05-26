//
//  CTRStoryViewController.h
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "HLMInflatableViewController.h"

@class CTRStuffStory;

@interface CTRStoryViewController : HLMInflatableViewController

-(instancetype) initWithStory:(CTRStuffStory *) story cellRect:(CGRect) rect snapshotView:(UIView *) snapshotView;

@end
