//
//  CTRStoryListTableViewCell.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRStoryListTableViewCell.h"
#import "HLMViewInjector.h"

@interface CTRStoryListTableViewCell ()
@property (nonatomic, weak) UIImageView* storyImage;
@property (nonatomic, weak) UILabel* storyTitle;
@end

@implementation CTRStoryListTableViewCell
INJECT_VIEW(storyTitle, title);
INJECT_VIEW(storyImage, image);

+(NSString *) reuseIdentifier {
    static NSString* reuseIdentifier;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reuseIdentifier = NSStringFromClass(self);
    });
    return reuseIdentifier;
}

-(instancetype) initWithStyle:(UITableViewCellStyle) style reuseIdentifier:(NSString *) reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [HLMViewInjector injectViewsInto:self withRootView:self];
    }
    return self;
}

-(NSString *) layoutResource {
    return @"@view/list_story_cell";
}

-(void) setStory:(CTRStory *) story {
    _story = story;
    if (_story) {
        self.storyTitle.text = story.title;
        self.storyImage.image = [UIImage imageNamed:story.image];
    }
}

@end
