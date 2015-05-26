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
#import <SDWebImage/UIImageView+WebCache.h>

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

-(void) setStory:(CTRStuffStory *) story {
    self.storyTitle.text = story.title;
    __weak typeof (self) weakSelf = self;
    [self.storyImage sd_setImageWithURL:[NSURL URLWithString:story.bigImage]
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                  if (weakSelf && image && cacheType == SDImageCacheTypeNone) {
                                      weakSelf.storyImage.alpha = 0.0;
                                      [UIView animateWithDuration:1.0
                                                       animations:^{
                                                           weakSelf.storyImage.alpha = 1.0;
                                                       }];
                                  }
                              }];
    self.storyDate.text = story.datetimeDisplay.uppercaseString;
    self.storyAuthor.text = story.byline.uppercaseString;
}

@end
