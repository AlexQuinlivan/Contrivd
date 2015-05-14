//
//  CTRStory.h
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTRStory : NSObject

+(instancetype) storyWithTitle:(NSString *) title
                       content:(NSString *) content
                        author:(NSString *) author
                        source:(NSString *) source
                          date:(NSString *) date
                         image:(NSString *) imageName;

@property (nonatomic, strong) NSString* image;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* content;
@property (nonatomic, strong) NSString* author;
@property (nonatomic, strong) NSString* source;
@property (nonatomic, strong) NSString* date;

@end
