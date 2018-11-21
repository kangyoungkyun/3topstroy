//
//  Post.m
//  3topstroy
//
//  Created by MacBookPro on 21/11/2018.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

#import "Post.h"
#import "Utils.h"
@implementation Post

@synthesize title, postDescription, content, author, section, contentURL, pubDate, keywords, tweets, contentFetched, tweetsLoading;


- (NSDictionary*)dictionaryRepresentation {
    NSLog(@"Post dictionaryRepresentation 호출");
    NSString *pubDateString =
    [NSString stringWithFormat:@"%@", self.pubDate];
    
    // content, tweets, and keywords were left off to limit size
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [Utils urlEncode:self.title], @"title",
            [Utils urlEncode:self.postDescription], @"description",
            [Utils urlEncode:self.author], @"author",
            [Utils urlEncode:self.section], @"section",
            [Utils urlEncode:self.contentURL], @"contentURL",
            [Utils urlEncode:pubDateString], @"pubDate", nil];
}

@end
