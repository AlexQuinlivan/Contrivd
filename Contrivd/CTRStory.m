//
//  CTRStory.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRStory.h"

@implementation CTRStory

+(instancetype) storyWithTitle:(NSString *) title
                       content:(NSString *) content
                        author:(NSString *) author
                        source:(NSString *) source
                          date:(NSString *) date
                         image:(NSString *) imageName {
    CTRStory* story = [CTRStory new];
    story.title = title;
    story.content = content;
    story.author = author;
    story.source = source;
    story.date = date;
    story.image = imageName;
    return story;
}

@end
