//
//  CTRStoryListTableViewCell.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRStoryListTableViewCell.h"
#import "HLMViewInjector.h"

NSString* const CTRStoryListTableViewCellDidSelectNotification = @"";

@interface CTRStoryListTableViewCell ()
@property (nonatomic, weak) UIImageView* storyImage;
@property (nonatomic, weak) UILabel* storyTitle;
@property (nonatomic, weak) UILabel* storyDate;
@property (nonatomic, weak) UILabel* storyAuthor;
@end

@implementation CTRStoryListTableViewCell
INJECT_VIEW(storyTitle, title);
INJECT_VIEW(storyImage, image);
INJECT_VIEW(storyDate, date);
INJECT_VIEW(storyAuthor, author);

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
    if (_story != story) {
        _story = story;
        self.storyTitle.text = story.title;
        self.storyImage.image = [UIImage imageNamed:story.image];
        self.storyDate.text = story.date.uppercaseString;
        self.storyAuthor.text = story.author.uppercaseString;
        [self layoutSubviews];
    }
}

TARGET(button, UIControlEventTouchUpInside) {
    [[NSNotificationCenter defaultCenter] postNotificationName:CTRStoryListTableViewCellDidSelectNotification object:self];
}

@end
