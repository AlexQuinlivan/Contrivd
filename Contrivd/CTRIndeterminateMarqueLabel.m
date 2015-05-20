//
//  CTRIndeterminateMarqueLabel.m
//  Contrivd
//
//  Created by Alex Quinlivan on 20/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRIndeterminateMarqueLabel.h"

@implementation CTRIndeterminateMarqueLabel

-(instancetype) initWithFrame:(CGRect) frame {
    if (self = [super initWithFrame:frame]) {
        self.marqueeType = MLContinuous;
        self.scrollDuration = 30.0 + (20 % arc4random());
        self.animationDelay = 0;
        self.animationCurve = UIViewAnimationOptionCurveLinear;
        self.fadeLength = 10.0f;
    }
    return self;
}

@end
