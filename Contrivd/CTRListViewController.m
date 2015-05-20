//
//  ViewController.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRListViewController.h"
#import "CTRStoryListTableViewCell.h"
#import "CTRContrivdStoriesView.h"
#import "CTRLoadingFullscreenIndeterminateView.h"
#import "CTRStoryViewController.h"

@interface CTRListViewController ()
@property (nonatomic) BOOL hasLoaded;
@property (nonatomic, weak) CTRStoryListTableViewCell* hiddingCell;

@property (nonatomic, weak) CTRContrivdStoriesView* stories;
@property (nonatomic, weak) CTRLoadingFullscreenIndeterminateView* indeterminate;
@end

@implementation CTRListViewController
BIND_VIEW(stories, stories);
BIND_VIEW(indeterminate, indeterminate);

-(instancetype) initWithNibName:(NSString *) nibNameOrNil bundle:(NSBundle *) nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.navigationItem.titleView = self.titleView;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didSelectStory:)
                                                     name:CTRStoryListTableViewCellDidSelectNotification
                                                   object:nil];
    }
    return self;
}

-(void) loadView {
    [super loadView];
    if (!self.hasLoaded) {
        self.hasLoaded = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.indeterminate animateHide:^{
                self.stories.hidden = NO;
                self.indeterminate.hidden = YES;
                [self.view layoutSubviews];
            }];
        });
    } else {
        self.stories.hidden = NO;
        self.indeterminate.hidden = YES;
    }
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(UIView *) titleView {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
}

-(NSString *) layoutResource {
    return @"@view/vc_list";
}

-(void) didSelectStory:(NSNotification *) notification {
    self.hiddingCell = notification.object;
    UIView* snapshotView = [self.hiddingCell snapshotViewAfterScreenUpdates:NO];
    CGRect cellRect = [self.hiddingCell convertRect:self.hiddingCell.bounds toView:nil];
    self.hiddingCell.hidden = YES;
    [self.navigationController pushViewController:[[CTRStoryViewController alloc] initWithStory:self.hiddingCell.story
                                                                                       cellRect:cellRect
                                                                                   snapshotView:snapshotView]
                                         animated:YES];
}

-(void) viewDidDisappear:(BOOL) animated {
    [super viewDidDisappear:animated];
    self.hiddingCell.hidden = NO;
}

@end
