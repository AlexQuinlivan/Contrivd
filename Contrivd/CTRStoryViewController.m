//
//  CTRStoryViewController.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRStoryViewController.h"
#import "CTRStory.h"
#import "HLMLayout.h"

@interface CTRStoryViewController ()
@property (nonatomic, strong) CTRStory* story;
@property (nonatomic, weak) UILabel* storyContent;
@property (nonatomic) CGFloat textSize;
@end

@implementation CTRStoryViewController
INJECT_VIEW(storyContent, content);

-(instancetype) initWithStory:(CTRStory *) story {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
        self.story = story;
    }
    return self;
}

-(NSString *) layoutResource {
    return @"@view/vc_story";
}

-(void) loadView {
    [super loadView];
    if (!self.textSize) {
        self.textSize = self.storyContent.hlm_textSize;
    } else {
        self.storyContent.hlm_textSize = self.textSize;
    }
    self.storyContent.text = self.story.content;
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

@end
