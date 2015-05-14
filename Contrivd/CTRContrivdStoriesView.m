//
//  CTRContrivdStoriesView.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRContrivdStoriesView.h"
#import "CTRStoryListTableViewCell.h"
#import "CTRContrivdSources.h"

@interface CTRContrivdStoriesView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation CTRContrivdStoriesView

-(instancetype) initWithFrame:(CGRect) frame {
    if (self = [super initWithFrame:frame style:UITableViewStyleGrouped]) {
        self.delegate = self;
        self.dataSource = self;
        self.allowsSelection = NO;
        self.sectionHeaderHeight = 0;
        self.sectionFooterHeight = 0;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.separatorInset = UIEdgeInsetsZero;
        [self registerClass:[CTRStoryListTableViewCell class] forCellReuseIdentifier:CTRStoryListTableViewCell.reuseIdentifier];
    }
    return self;
}

-(void) dealloc {
    self.dataSource = nil;
    self.delegate = nil;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *) tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
    return CTRContrivdSources.stories.count * 5;
}

-(UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    return [self cellAtIndexPath:indexPath];
}

-(CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath {
    return [self cellAtIndexPath:indexPath].frame.size.height;
}

-(CGFloat) tableView:(UITableView *) tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *) indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat) tableView:(UITableView *) tableView heightForHeaderInSection:(NSInteger) section {
    return FLT_EPSILON;
}

-(CGFloat) tableView:(UITableView *) tableView heightForFooterInSection:(NSInteger) section {
    return FLT_EPSILON;
}

-(CTRStoryListTableViewCell *) cellAtIndexPath:(NSIndexPath *) indexPath {
    CTRStoryListTableViewCell* cell = [self dequeueReusableCellWithIdentifier:CTRStoryListTableViewCell.reuseIdentifier];
    cell.story = CTRContrivdSources.stories[indexPath.row % CTRContrivdSources.stories.count];
    return cell;
}

@end
