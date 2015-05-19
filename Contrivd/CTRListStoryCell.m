//
//  CTRListStoryCell.m
//  Contrivd
//
//  Created by Alex Quinlivan on 19/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRListStoryCell.h"
#import "HLMViewBinder.h"
#import "HLMLayoutInflator.h"

@interface CTRListStoryCell () <HLMLayoutInflationListener>
@property (nonatomic, weak) UIImageView* storyImage;
@property (nonatomic, weak) UILabel* storyTitle;
@property (nonatomic, weak) UILabel* storyDate;
@property (nonatomic, weak) UILabel* storyAuthor;
@end

@implementation CTRListStoryCell
BIND_VIEW(storyTitle, title);
BIND_VIEW(storyImage, image);
BIND_VIEW(storyDate, date);
BIND_VIEW(storyAuthor, author);

-(void) didInflateChildren {
    [HLMViewBinder bindViewsInto:self withRootView:self];
}

-(void) setStory:(CTRStory *) story {
    self.storyTitle.text = story.title;
    self.storyImage.image = [UIImage imageNamed:story.image];
    self.storyDate.text = story.date.uppercaseString;
    self.storyAuthor.text = story.author.uppercaseString;
}

@end
