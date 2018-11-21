//
//  TopStoriesParser.m
//  3topstroy
//
//  Created by MacBookPro on 21/11/2018.
//  Copyright © 2018 MacBookPro. All rights reserved.
// rss 파서 구현 , nsxmlparser는 sax 파서이므로 특정 파싱이 일어날때, 다양한 델리게이트 메시지를 받는다.



#import "TopStoriesParser.h"
#import "Utils.h"

@interface TopStoriesParser () {
    Post            *post;
    NSMutableString *currentValue;
    BOOL            parsingItem;
}
@end


@implementation TopStoriesParser
@synthesize posts = _posts;
@synthesize feedData = _feedData;
@synthesize delegate = _delegate;


//날짜로 초기화
- (id)initWithFeedData:(NSData*)data {
    self = [super init];
    if (self != nil) {
        self.feedData = data;
    }
    NSLog(@"TopStoriesParser : initWithFeedData 초기화 됐습니다.");
    return self;
}


- (void)parseTopStoriesFeed {
    // 파서를 생성하고 시작
    NSXMLParser *parser = [[NSXMLParser alloc]
                           initWithData:_feedData];
    parser.delegate = self;
    [parser parse];
}

#pragma mark - NSXMLParserDelegate(파서의 델리게이트 메서드들)
//[parser parse] 하면 아래 델리게이트 메소드 실행됨
//nsxmlparser는 sax 파서이므로 특정 파싱이 일어날때, 다양한 델리게이트 메시지를 받는다.


// xml 데이터를 담을 배열 초기화
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    _posts = [[NSMutableArray alloc] init];
}

//파서가 post 객체 목록을 모두 생성한 시점이므로 이 정보를 델리게이트에 알려준다.
//파서가 끝났을때 TopStoriesDelegate의 topStoriesParsedWithResult 메서드 호출 (담은 배열을 같이 던져준다.)
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    if ([_delegate respondsToSelector:@selector(topStoriesParsedWithResult:)]) {
        [_delegate topStoriesParsedWithResult:_posts];
    }
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
    
//속성이 존재하면 속성 이름을 키로 사용해서 objectforKey를 호출함으로써 attributeDict에서 처리한다.
    
    // 새 포스트를 시작하고, 새 객체를 생성한다.
    if ([elementName isEqualToString:@"item"]) {
        post = [[Post alloc] init];
        parsingItem = YES;
        
    }
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {
    
    // 현재요소 값을 가져온다.
    NSString *tmpValue = [string stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (currentValue == nil) {
        currentValue = [[NSMutableString alloc] initWithString:tmpValue];
    } else {
        [currentValue appendString:tmpValue];
    }
    
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    // 포스트 끝에 도달했다.
    if ([elementName isEqualToString:@"item"]) {
        [_posts addObject:post];
        post = nil;
        parsingItem = NO;
    }
    
    // 헤더가 아닌 포스트 항목을 파싱하도록 한다.
    if (parsingItem == YES) {
        if ([elementName isEqualToString:@"title"]) {
            post.title = currentValue;
            
        } else if ([elementName isEqualToString:@"description"]) {
            post.postDescription = currentValue;
            
        } else if ([elementName isEqualToString:@"pubDate"]) {
            post.pubDate = [Utils publicationDateFromString:currentValue];
            
        } else if ([elementName isEqualToString:@"feedburner:origLink"]) {
            post.contentURL = currentValue;
            
        }
    }
    
    // 현재 요소값을 재설정한다.
    currentValue = nil;
}



@end
