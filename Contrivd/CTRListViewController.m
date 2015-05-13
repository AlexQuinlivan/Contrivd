//
//  ViewController.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRListViewController.h"

@interface CTRListViewController ()

@end

@implementation CTRListViewController

-(instancetype) initWithNibName:(NSString *) nibNameOrNil bundle:(NSBundle *) nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.navigationItem.titleView = self.titleView;
    }
    return self;
}

-(UIView *) titleView {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
}

-(NSString *) layoutResource {
    return @"@view/vc_list";
}

@end
