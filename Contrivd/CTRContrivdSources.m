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
                    [CTRStory storyWithTitle:@"Evacuations after heavy rain, floods and slips in Kapiti"
                                     content:@"Major flooding has left dozens of homes and streets in the Wellington region under water with more heavy rainfall due.\n\nEmergency services are on their way to Waikanae River after reports a man had become trapped in the river near Otaihanga, a Wellington Police central communications spokesman said. \n\nSchools, businesses and homeowners have all been affected and roads were shut earlier because of slips. Many are still shut because of flooding.\n\nHomes have been inundated with water while several houses in Otaihanga have been sandbagged as fire engines pump water out of them.\n\nUp to 90mm of rain could fall as a new intense front is expected later in the day while train services north of Porirua to Kapiti have been suspended and bus services between Plimmerton and Waikanae have been suspended."
                                      author:@"Deidre Mussen"
                                      source:@"Stuff"
                                        date:@"12:31pm, May 14 2015"
                                       image:@"flood"],
                    [CTRStory storyWithTitle:@"Family desperate to save bach – 'our family history'"
                                     content:@"A family who face losing their Port Levy bach has pleaded with Christchurch City councillors to save their \"little piece of paradise\".\n\nThe Stewart family have owned their bach in Port Levy since 1940 but council officials are recommending the council instruct the family to remove it so that Te Runanga O Koukourarata can push ahead with planned developments on the foreshore.\n\nThe bach was built on an unformed legal road in front of land owned by the runanga and council staff say although the property was rated by the former Banks Peninsula District Council, the Stewarts have no contractual licence to occupy it.\n\nTracy Stewart told councillors on Thursday her late father had bought the bach in 1940 for his family and future generations to enjoy and he would be mortified to know the family were now in the position where they were having to fight to keep the property.\n\nThe bach was the family's \"little piece of paradise\" and full of family memories.\n\n\"This is about our family history. This whole process has been stressful and upsetting for every member of our family,\" Tracy Stewart said as she pleaded with councillors to leave the bach as it was.\n\nTracy Stewart's husband, Alex, said the bach had historical significance and removing it would not be in the community's best interests.\n\n\"It is our opinion the bach should not be demolished or removed. We believe we have existing use rights and that the recommendations put to the council lack justification and compassion,\" Alex Stewart said.\n\nTe Runanga o Koukourarata deputy chairman Peter Ramsden said permission to occupy the land was given by Maori elders who have long since gone and the runanga now had \"new wants and needs\".\n\nIt wanted to build two or three holiday homes on the site, which would be available for all, not just Maori.\n\n\"We acknowledge people have kept it warm on our behalf and we're thankful for that, but it's time for the land to be returned to its rightful owners.\"\n\nHe said it was not about \"being vindictive\".\n\n \"We have a role, a duty to perform for our future generations.\"\n\nChristchurch Mayor Lianne Dalziel moved the council delay making a decision on the future of the bach until it had got some further information.\n\nIt was clear from listening to the depuations that it was a complex issue and there was a lot of emotion on both sides.\n\n\"I would really like this matter to lie on the table while some further discussions take place … I'm not satisfied we have followed a good process in this regard,\" Dalziel said.\n\nLyttelton-Mt Herbert Community Board chairwoman Paula Smith said she stood by her board's recommendation that the bach should be removed but acknowledged there were concerns about the process."
                                      author:@"Lois Cairns & Tina Law"
                                      source:@"Stuff"
                                        date:@"11:36am, May 14 2015"
                                       image:@"bach"],
                    [CTRStory storyWithTitle:@"How Helen bent Charles's ear"
                                     content:@"A dinner discussion with former New Zealand Prime Minister Helen Clark led Prince Charles to successfully urge the UK government for funding to preserve Antarctic huts.\n\nA series of letters Prince Charles sent to UK Government ministers in 2004 and 2005 have been published after a 10-year legal fight to keep them secret.\n\nOne of them, sent by Prince Charles to then culture secretary Tessa Jowell, mentioned a dinner conversation he had with Clark at Government House, in Wellington.\n\n\"She raised with me the work the New Zealand Heritage has been doing to conserve the Antarctic huts which Scott and Shackleton built as the base for their great polar expeditions in the early years of the last century,\" Prince Charles wrote.\n\n\"From her description ... these clearly constitute a unique heritage and I entirely agree with her evidently strongly-held conviction that all those nations connected to that heroic era of exploration should be involved in some way in the efforts to contribute to the huts' preservation.\"\n\nThe four huts are all in the Ross Sea dependency, which is under New Zealand's control.\n\nIn his letter, Prince Charles said he understood UK government funding for the restoration of the huts would not be possible because they were considered \"overseas projects\".\n\nBut he said he \"thought there was something called 'The Government of the British Antarctic Territory,' which must mean that there is some British Territory to be 'governed!'\"\n\nHe said he had promised Clark he would write to Jowell and urged an \"imaginative flexibility in the interpretation of these rules\".\n\nIn February 2007 the UK Department of Culture, Media and Sport (DCMS) and the Foreign and Commonwealth Office committed £250,000 (NZ$522,000) to the restoration project.\n\n'COMMITTED SERVANT'\n\nClark - who is now in charge of the United Nations Development Programme - and Prince Charles have met many times during their careers in public service.\n\nIn 2013, after a meeting with Prince Charles at Clarence House, Clark said he was part of a royal family that included \"very fine, committed servants\".\n\nShe said that royal families across Europe had respect in their countries and \"their voice carries a lot of weight, [so] it makes a lot of sense to keep in touch with them.\"\n\nFROM THE ROYAL QUILL\n\nRead Prince Charles' letter to Tessa Jowell in full below."
                                      author:@"John Hartevelt"
                                      source:@"Stuff"
                                        date:@"12:07pm, May 14 2015"
                                       image:@"helen"],
                    [CTRStory storyWithTitle:@"Sky TV hiking prices"
                                     content:@"Sky TV subscribers will be scrambling for spare change tucked down the side of the couch, as the pay-television giant increases the price of two of its packages.\n\nIn a letter to customers this week, Sky TV director of operations Martin Wrigley said from June 15, the price of the Sky Basic package would increase by $1.15 per month and the price of the Sky Sport package would increase by $1.61 per month.\n\n\"We fight everyday to keep our prices low but the cost of TV content rights continues to rapidly rise. As a result we've adjusted the prices of our Basic and Sport packages. All our other packages will remain at the same price,\" he said in the letter.\n\nSky TV spokeswoman Kirsty Way said the price hike  was due to the increased cost in purchasing content for sport and entertainment.\n\n\"It's forcing the prices up ... it's a very competitive environment at the moment so you'd think our prices would go down, but the cost of content is costing us a lot more to purchase, so we've had to increase it a little.\"\n\nIn 2013, Sky lost the rights to the English Premier League football and top golf to Coliseum Sports Media, which has also expanded its on-demand content by introducing live French rugby.\n\nHowever, this did not mean it was offering less programmes for a higher price, she said.\n\n\"If anything, we are offering more. We haven't decreased our volume, we've increased it. We've got 24-hour surfing and more racing car coverage.\"\n\nShe would not say how much more it was costing them to provide the content: \"It varies, but its significant. I can't give you any figures.\"\n\nThe last increase to Sky TV packages were in 2014, Way said.\n\n\"There was a little increase about one year ago ... sport went up 23 cents, movies went up 23 cents and basic increase $1.15.\n\n\"That increase was from a variety of reasons, but generally it was because of the general cost in business investments, a lot of infrastructure so we needed to cover our capital costs.\"\n\nEarlier this year, Fairfax Media reported Sky defied the competitionby posting a higher half-year profit of $92.5 million net profit for the six months to December 31, up 12.7 per cent on the same period in 2013.\n\nRevenues rose a modest 1.8 per cent to $464.5m, as its 856,348 customers upped their average monthly spend on Sky by almost $2 to $79.43.\n\nWay would not say if the cost of Sky packages would continue to increase, she said.\n\n\"It's all about the cost of content, so we will have to wait and see.\"\n\nWay said competition from Neon, Lightbox and Netflix had little affect on the decision to increase the prices.\n\n\"They are a very different proposition, with a fraction of the content on SKY and without the exclusive sport content.\n\n\"Those SVOD [Subscription Video on Demand] offering suit certain consumers, SKY is great value premium viewing option.\""
                                      author:@"Chloe Winter"
                                      source:@"Stuff"
                                        date:@"12:16pm, May 14 2015"
                                       image:@"mysky"],
                    [CTRStory storyWithTitle:@"Manufacturing takes a hit in April due to currency headwinds"
                                     content:@"Manufacturing slowed down in April after facing the headwinds of a high New Zealand dollar against the Australian currency.\n\nThe latest Performance of Manufacturing Index for April was 51.8 points in April, down from 54.6 in March.\n\nBank of New Zealand economist Doug Steel said it remained to be seen if  it was the start of a slower growth trend.\n\nAn index above 50 indicates the sector is growing, but under 50 that it is going backwards.\n\nThere was a similar slowdown in the index in January, but it bounced back in February.\n\nIt was possible April may have been affected by the timing of Easter and Anzac Day holidays this year.\n\nBut the manufacturing sector was also facing headwinds, from the high New Zealand dollar against the Australian currency. Australia is the key export market for New Zealand manufacturers.\n\nThe dollar averaged about A98c in April and was close to parity a couple of times in the month.\n\nThe dollar has reversed since then, back down to just under A93c on Thursday, as the Australian dollar gained ground.\n\nThe manufacturing sector may also be feeling some knock-on effect from the $7 billion dollar slump in annual dairy sector revenues.\n\nManufacturers were seeing less demand from the agricultural sector."
                                      author:@"James Weir"
                                      source:@"Stuff"
                                        date:@"11:01am, May 14 2015"
                                       image:@"manufacturing"],
                    [CTRStory storyWithTitle:@"Henare happy to wait on Adams"
                                     content:@"Steven Adams' much-anticipated Tall Blacks decision has been complicated but not derailed by the Oklahoma City Thunder's coaching change.\n\nNew Tall Blacks coach Paul Henare remains optimistic he will have Adams in his squad to face Andrej Lemanis' star-studded Australian Boomers in August's two-game Olympic qualifying series.\n\nBut he concedes the timeline on getting the 21-year-old, two-year NBA star into the black singlet of his country for the first time has been changed by the Thunder's decision to bring in Billy Donovan to replace Scott Brooks as head coach.\n\nDespite much improved communications between the Thunder and Basketball New Zealand and what is understood to be initial approval for Adams to take part in the Tall Blacks' 2015 campaign culminating in that series against the Boomers, a decision by the 2.13m Kiwi has not yet been forthcoming.\n\nAnd Henare expects that to take a little more time now hugely successful University of Florida coach Donavon has been handed his first NBA gig.\n\n\"OKC are still supportive of Steve playing for us. I've been communicating with (Adams' mentor) Kenny McFadden regularly and things have been going positively,\" Henare told Fairfax Media. \"They seem pretty happy, but I think he's going to have to go back for a sitdown with Billy Donavon.\n\n\"We're hopeful that doesn't change anything in terms of him playing for the Tall Blacks but we might have to wait for any final announcements until once he's had that chat.\"\n\nHenare has yet to talk directly with Adams who is enjoying some well-deserved downtime with friends and family back in New Zealand, but feels confident things are tracking as well as they can. New national assistant coach Ross McMains visited Oklahoma to discuss the national programme with him late in the NBA season.\n\n\"It's all about schedules now – what they want him to work on, what the coach wants him to work on and how we make that fit within the Tall Blacks programme we have.\n\n\"I'm not too stressed about the timeline. It's going smoothly at the moment and we've just got to let the thing play out.\"\n\nThe Tall Blacks have a \"near perfect\" buildup to the Boomers series, with two games against Great Britain in London, one-off internationals against Croatia and Slovenia in Europe and then the Stankovic Cup tournament alongside hosts China, Mexico and Venezuela.\n\nHenare, who succeeds long-time national coach Nenad Vucinic, said it was important to be flexible to accommodate NBA players during their off-season breaks.\n\n\"For us it's about coming together and playing against as many high-quality opponents as we can, and that requires a time commitment. I'm more than willing to be flexible when it comes to Steve to make it work.\"\n\nHenare admitted the outlook was not so positive for veteran shooting guard Kirk Penney who is playing some outstanding hoops for Sevilla in Spain's Liga Endesa.\n\nHis sense is that Penney, at 34, might be ready to retire from an outstanding international basketball career, but he'll continue to hold out hope of a change in heart.\n\n\"He hasn't made a definitive decision yet, and we'll hold on to that as long as we can,\" Henare said. \"I'll touch base once his season finishes in Spain and he's home and settled with his family and try to get a decision then.\"\n\nPenney apart, the contingent of Kiwis currently plying their trade in Europe had all indicated they wanted to be part of this campaign. That included Isaac Fotu, Rob Loe, Corey Webster and Tom Abercrombie. And probably an initially reluctant Mika Vukona.\n\n\"I'm pretty sure we'll have Captain Courageous with us,\" Henare said. \"He wanted to take a little bit of time with his decision, but he seems pretty positive if his body stays together. We need his leadership and experience.\"\n\nHenare admitted the chance to match up against a Boomers outfit containing six NBA players was one his players appeared to be relishing.\n\n\"Making the Olympics is a massive carrot to dangle in front of any athlete. Adding to that it's going to be arguably the most talented Australian team ever assembled, so it's pretty exciting for any competitor.\""
                                      author:@"Marc Hinton"
                                      source:@"Stuff.co.nz"
                                        date:@"12:26pm, May 14 2015"
                                       image:@"steve"],
                    ];
    });
    return stories;
}

@end
