//
//  Utils.h
//  topstories
//
//  Created by Nathan Jones on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

//url 인코더
+ (NSString*)urlEncode:(NSString*)rawString;

//날짜를 스트링 형식으로 변경
+ (NSString*)prettyStringFromDate:(NSDate*)date;

//날짜를 데이트 형식으로 변경
+ (NSDate*)publicationDateFromString:(NSString*)pubDate;

//스트링을 트위터 데이터 형식으로 변경
+ (NSDate*)tweetDateFromString:(NSString*)tweetDate;

//딕셔너리를 xml데이터로 변경
+ (NSData*)postXMLDataFromDictionary:(NSDictionary*)dictionary;
@end
