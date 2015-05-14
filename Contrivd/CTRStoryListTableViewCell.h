//
//  CTRStoryListTableViewCell.h
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "HLMTableViewCell.h"
#import "CTRStory.h"

extern NSString* const CTRStoryListTableViewCellDidSelectNotification;

@interface CTRStoryListTableViewCell : HLMTableViewCell

+(NSString *) reuseIdentifier;

@property (nonatomic, strong) CTRStory* story;

@end
