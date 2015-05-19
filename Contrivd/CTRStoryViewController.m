//
//  CTRStoryViewController.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRStoryViewController.h"
#import "CTRStory.h"
#import "CTRListStoryCell.h"
#import "HLMLayout.h"
#import "HLMLayoutInflator.h"
#import "HLMResources.h"

@interface CTRStoryViewController ()

@property (nonatomic, strong) CTRStory* story;

@property (nonatomic, weak) UILabel* storyContent;
@property (nonatomic, weak) UILabel* storySource;
@property (nonatomic, weak) UIView* container;
@property (nonatomic, weak) CTRListStoryCell* scrollViewChrome;
@property (nonatomic, strong) UIView* snapshotView;

@property (nonatomic) CGFloat textSize;
@property (nonatomic) CGRect origRect;
@property (nonatomic) BOOL viewHasPreviouslyAppeared;

@end

@implementation CTRStoryViewController
BIND_VIEW(storyContent, content);
BIND_VIEW(storySource, source);
BIND_VIEW(container, container);
BIND_VIEW(scrollViewChrome, story_cell);

-(instancetype) initWithStory:(CTRStory *) story cellRect:(CGRect) rect snapshotView:(UIView *) snapshotView {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
        self.story = story;
        self.origRect = rect;
        self.snapshotView = snapshotView;
    }
    return self;
}

-(NSString *) layoutResource {
    return @"@view/vc_story";
}

-(void) viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
    if (!self.viewHasPreviouslyAppeared) {
        self.viewHasPreviouslyAppeared = YES;
        [self animateIn];
    }
}

-(void) loadView {
    [super loadView];
    if (!self.textSize) {
        self.textSize = self.storyContent.hlm_textSize;
    } else {
        self.storyContent.hlm_textSize = self.textSize;
    }
    self.storyContent.text = self.story.content;
    self.storySource.text = self.story.source;
    self.scrollViewChrome.story = self.story;
    [self.view layoutSubviews];
}

-(UIBarButtonItem *) rightBarButtonItem {
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"font-size"]
                                            style:UIBarButtonItemStylePlain
                                           target:self
                                           action:@selector(toggleFontSize)];
}

-(void) toggleFontSize {
    CGFloat textSize = self.textSize + 2;
    if (textSize > 32) {
        textSize = 12;
    }
    self.storyContent.hlm_textSize = self.textSize = textSize;
    [self.view layoutSubviews];
}

-(void) animateIn {
    CGFloat const animDuration = .6;
    UIView* chrome = self.snapshotView;
    chrome.frame = self.origRect;
    self.scrollViewChrome.alpha = 0;
    [self.navigationController.view insertSubview:chrome belowSubview:self.navigationController.navigationBar];
    chrome.clipsToBounds = NO;
    chrome.layer.shadowColor = [UIColor blackColor].CGColor;
    chrome.layer.shadowRadius = 0;
    chrome.layer.shadowOpacity = 0.5;
    {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
        anim.fromValue = [NSValue valueWithCGSize:CGSizeZero];
        anim.toValue = [NSValue valueWithCGSize:CGSizeMake(0, 6)];
        anim.duration = animDuration / 2;
        anim.autoreverses = YES;
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [chrome.layer addAnimation:anim forKey:@"shadowOffset"];
    }
    {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
        anim.fromValue = @(0);
        anim.toValue = @(10);
        anim.duration = animDuration / 2;
        anim.autoreverses = YES;
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [chrome.layer addAnimation:anim forKey:@"shadowRadius"];
    }
    CGRect navBarFrame = self.navigationController.navigationBar.frame;
    [UIView animateWithDuration:animDuration
                     animations:^{
                         CGRect newRect = self.origRect;
                         newRect.origin.y = navBarFrame.size.height + navBarFrame.origin.y;
                         chrome.frame = newRect;
                     }
                     completion:^(BOOL finished) {
                         [chrome removeFromSuperview];
                         self.snapshotView = nil;
                         self.scrollViewChrome.alpha = 1;
                     }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:(animDuration / 2) - 0.05
                         animations:^{
                             chrome.transform = CGAffineTransformScale(chrome.transform, 1.05, 1.05);
                         }
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:animDuration / 2
                                              animations:^{
                                                  chrome.transform = CGAffineTransformIdentity;
                                              }];
                         }];
    });
    
}

@end
