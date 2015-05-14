//
//  CTRListScrimView.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRListScrimView.h"
#import "HLMResources.h"

@interface CTRListScrimView ()
@property (nonatomic, weak) CALayer* scrim;
@end

@implementation CTRListScrimView

-(instancetype) initWithFrame:(CGRect) frame {
    if (self = [super initWithFrame:frame]) {
        [self applyScrimLayer];
    }
    return self;
}

-(void) applyScrimLayer {
    CAGradientLayer* scrim = [CAGradientLayer layer];
    scrim.colors = @[(id)[UIColor clearColor].CGColor, (id)[HLMResources uiColorValue:@"#B000"].CGColor];
    [self.layer insertSublayer:scrim atIndex:0];
    self.scrim = scrim;
}

-(void) setFrame:(CGRect) frame {
    [super setFrame:frame];
    self.scrim.frame = self.bounds;
}

@end
