//
//  CTRLoadingFullscreenIndeterminateView.h
//  Contrivd
//
//  Created by Alex Quinlivan on 20/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTRLoadingFullscreenIndeterminateView : UIView

-(void) animateHide:(void(^)()) completion;

@end
