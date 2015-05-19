//
//  ViewController.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRListViewController.h"
#import "CTRStoryListTableViewCell.h"
#import "CTRStoryViewController.h"

@interface CTRListViewController ()
@property (nonatomic, weak) CTRStoryListTableViewCell* hiddingCell;
@end

@implementation CTRListViewController

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
