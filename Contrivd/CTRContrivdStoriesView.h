//
//  CTRContrivdStoriesView.h
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTRStuffStory.h"

@interface CTRContrivdStoriesView : UITableView

@property (nonatomic, strong) NSArray<CTRStuffStory>* stories;

@end
