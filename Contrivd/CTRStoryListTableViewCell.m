//
//  CTRStoryListTableViewCell.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRStoryListTableViewCell.h"
#import "HLMViewBinder.h"

NSString* const CTRStoryListTableViewCellDidSelectNotification = @"";

@interface CTRStoryListTableViewCell ()
@property (nonatomic, weak) UIImageView* storyImage;
@property (nonatomic, weak) UILabel* storyTitle;
@property (nonatomic, weak) UILabel* storyDate;
@property (nonatomic, weak) UILabel* storyAuthor;
@property (nonatomic, weak) UIControl* button;
@end

@implementation CTRStoryListTableViewCell
BIND_VIEW(storyTitle, title);
BIND_VIEW(storyImage, image);
BIND_VIEW(storyDate, date);
BIND_VIEW(storyAuthor, author);
BIND_VIEW(button, button);

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
        [HLMViewBinder bindViewsInto:self withRootView:self];
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

-(void) setEmitsNotifications:(BOOL) emitsNotifications {
    if (!emitsNotifications) {
        [self.button removeTarget:self
                           action:@selector(controltarget_$$button_$$UIControlEventTouchUpInside)
                 forControlEvents:UIControlEventTouchUpInside];
    }
}

BIND_TARGET(button, UIControlEventTouchUpInside) {
    [[NSNotificationCenter defaultCenter] postNotificationName:CTRStoryListTableViewCellDidSelectNotification object:self];
}

@end
