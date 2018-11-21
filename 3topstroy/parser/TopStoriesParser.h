//
//  TopStoriesParser.h
//  3topstroy
//
//  Created by MacBookPro on 21/11/2018.
//  Copyright © 2018 MacBookPro. All rights reserved.
//


//가져온 post 객체의 배열을 반환하는 커스텀 델리게이트와 파서가 NSXmlParserDelegate 프로토콜을 따른다.

#import <Foundation/Foundation.h>
#import "Post.h"


@protocol TopStoriesDelegate <NSObject>
@required
-(void)topStoriesParsedWithResult:(NSMutableArray*)posts;
@end



@interface TopStoriesParser : NSObject <NSXMLParserDelegate>

@property(nonatomic,strong) NSData                  *feedData;
@property(nonatomic,strong) NSMutableArray          *posts;

@property(assign)           id<TopStoriesDelegate>  delegate;

- (id)initWithFeedData:(NSData*)data;

- (void)parseTopStoriesFeed;

@end
