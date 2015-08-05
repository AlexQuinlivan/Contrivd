//
//  CTRStoryListTableViewCell.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRStoryListTableViewCell.h"
#import "CTRListStoryCell.h"
#import "HLMViewBinder.h"

NSString* const CTRStoryListTableViewCellDidSelectNotification = @"";

@interface CTRStoryListTableViewCell ()
@property (nonatomic, weak) CTRListStoryCell* listStory;
@property (nonatomic, weak) UIControl* button;
@end

@implementation CTRStoryListTableViewCell
BIND_VIEW(listStory, story_cell);
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
        [HLMViewBinder bindInto:self];
    }
    return self;
}

-(NSString *) layoutResource {
    return @"@view/list_story_cell";
}

-(void) setStory:(CTRStuffStory *) story {
    if (_story != story) {
        _story = story;
        self.listStory.story = story;
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
