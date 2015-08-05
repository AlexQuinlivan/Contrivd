//
//  CTRLoadingFullscreenIndeterminateView.m
//  Contrivd
//
//  Created by Alex Quinlivan on 20/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRLoadingFullscreenIndeterminateView.h"
#import "HLMLayout.h"
#import "HLMLayoutInflator.h"
#import "HLMFrameLayoutManager.h"
#import "HLMViewBinder.h"

@interface CTRLoadingFullscreenIndeterminateView () <HLMLayoutInflationListener>
@property (nonatomic, weak) UIView* attentionView;
@property (nonatomic, strong) NSArray* hideViews;
@end

@implementation CTRLoadingFullscreenIndeterminateView
BIND_VIEW(attentionView, attention);
BIND_VIEWS_6(hideViews, one, two, three, four, five, six)

-(instancetype) initWithFrame:(CGRect) frame {
    if (self = [super initWithFrame:frame]) {
        self.hlm_layoutManager = [HLMFrameLayoutManager new];
        UIView* children = [[HLMLayoutInflator alloc] initWithLayout:@"@view/view_loading_indeterminate"].inflate;
        [HLMViewBinder bindInto:self view:children];
        [self addSubview:children];
        [self animate];
    }
    return self;
}

-(void) animate {
    {
        CATransform3D beginTransform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
        CATransform3D endTransform = CATransform3DMakeRotation(0, 0, 0, 1);
        CABasicAnimation *animatin = [CABasicAnimation animationWithKeyPath:@"transform"];
        animatin.duration = 1.25;
        animatin.fromValue = [NSValue valueWithCATransform3D:beginTransform];
        animatin.toValue = [NSValue valueWithCATransform3D:endTransform];
        animatin.repeatCount = HUGE_VALF;
        animatin.autoreverses = NO;
        animatin.fillMode = kCAFillModeForwards;
        animatin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.attentionView.layer addAnimation:animatin forKey:@"transform"];
    }
    {
        CABasicAnimation *animatin = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
        animatin.duration = 1.25;
        animatin.fromValue = @(0);
        animatin.toValue = @(self.attentionView.hlm_layoutWidth / 2);
        animatin.repeatCount = HUGE_VALF;
        animatin.autoreverses = YES;
        animatin.fillMode = kCAFillModeForwards;
        animatin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.attentionView.layer addAnimation:animatin forKey:@"cornerRadius"];
    }
}

-(void) animateHide:(void(^)()) completion {
    for (int i = 0; i < self.hideViews.count; i++) {
        UIView* hideView = self.hideViews[i];
        void (^animCompletion)(BOOL);
        if (i == self.hideViews.count - 1 && completion) {
            animCompletion = ^(BOOL finished) {
                completion();
                [self resetHide];
            };
        }
        [UIView animateWithDuration:0.2f
                              delay:i * 0.1f
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             CGRect hideViewFrame = hideView.frame;
                             hideViewFrame.origin.y -= 400;
                             hideView.frame = hideViewFrame;
                             [hideView.layer setValue:@(hideView.alpha) forKey:@"orig_alpha"];
                             hideView.alpha = 0;
                         }
                         completion:animCompletion];
    }
    [UIView animateWithDuration:0.2f
                          delay:((self.hideViews.count / 2.f) * 0.1f) + 0.05f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGRect attentionViewFrame = self.attentionView.frame;
                         attentionViewFrame.origin.y -= 400;
                         self.attentionView.frame = attentionViewFrame;
                         self.attentionView.alpha = 0;
                     }
                     completion:nil];
}

-(void) resetHide {
    CGRect attentionViewFrame = self.attentionView.frame;
    attentionViewFrame.origin.y += 400;
    self.attentionView.frame = attentionViewFrame;
    self.attentionView.alpha = 1;
    for (UIView* hideView in self.hideViews) {
        CGRect hideViewFrame = hideView.frame;
        hideViewFrame.origin.y += 400;
        hideView.frame = hideViewFrame;
        hideView.alpha = [[hideView.layer valueForKey:@"orig_alpha"] floatValue];
    }
}

@end
