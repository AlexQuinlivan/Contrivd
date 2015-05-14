//
//  CTRContrivdSources.m
//  Contrivd
//
//  Created by Alex Quinlivan on 14/05/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

#import "CTRContrivdSources.h"
#import "CTRStory.h"

@implementation CTRContrivdSources

+(NSArray *) stories {
    static NSArray* stories;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stories = @[
                    [CTRStory storyWithTitle:@"Giant squid found on Kaikoura beach"
                                     content:@"This giant squid's body revealed a terrifying story: It had been attacked by an even-bigger beast.\n\nIt was found washed onto the beach at South Bay in Kaikoura on Wednesday.\n\nThe massive deep sea creature caused quite a stir among walkers with its longest tentacle measuring more than 5 metres.\n\nIt has been moved to the Kaikoura Marine Centre and Aquarium for safe keeping.\n\nThe centre posted on Facebook that the squid's body was about 2m long and its eye had a diameter of 19 centimetres.\n\n\"What a beast,\" the post read.\n\n\"Before the birds got to it - we got help to move it to the aquarium where it is safe inside a freezer with glass windows so you can see it. On display until we can do more with it.\"\n\nEarly walkers on South Bay were surprised to see the giant squid lying on the foreshore.\n\nBruce Bennett said he found the squid at 8.30am while walking his dog, something he does most mornings.\n\nBennett said the squid smelled slightly, and it wasn't on the beach on Tuesday so he assumed it washed up on Tuesday night.\n\nA giant squid was found floating at sea off the Kaikoura coast in 2013.\n\nJack and Sharon Osikai found the 8m squid floating near Shark's Tooth when they were returning from a fishing trip.\n\nIt was dissected on TV3's Campbell Live show by Megan Bosch, a marine biologist at the Kaikoura Marine Centre and Aquarium.\n\nShe discovered that squid had been attacked by another, even bigger squid, which was apparent by the markings of a beak larger than its own on its tentacles and mantle (body).\n\nBennett recalled the giant squid being found at sea but said he had never seen one washed ashore.\n\n\"I wish it had been a lump of [whale] ambergris [grey amber used in perfumes],\" he said.\n\n\"I've found old fishing floats and bits and pieces of other stuff, never any ambergris.\""
                                      author:@"Helen Hill"
                                      source:@"Kaikoura Star"
                                        date:@"9:56am, May 14 2015"
                                       image:@"squid"],
                    ];
    });
    return stories;
}

@end
