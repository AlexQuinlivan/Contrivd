//
//  CTRStuffStory.m
//  Contrivd
//
//  Created by Alex Quinlivan on 21/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRStuffStory.h"
@import UIKit;

@implementation CTRStuffStory {
    NSAttributedString* attributedBody;
}

-(void) setBody:(NSString * __nullable) body {
    _body = body;
    attributedBody = [[NSAttributedString alloc] initWithData:[body dataUsingEncoding:NSUTF8StringEncoding]
                                                      options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                           documentAttributes:nil
                                                        error:nil];
}

-(nullable NSString *) bigImage {
    if (self.images.count) {
        return ((CTRStuffImageVariant *)((CTRStuffImage *) self.images.lastObject).variants.firstObject).src;
    } else {
        return @"http://i.imgur.com/yAZgHwR.gif";
    }
}

-(nonnull NSAttributedString *) attributedBody {
    return attributedBody;
}

@end
