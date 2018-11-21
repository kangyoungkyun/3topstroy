//
//  Tweet.h
//  3topstroy
//
//  Created by MacBookPro on 21/11/2018.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Tweet : NSObject
@property(nonatomic,strong) NSString *identifier;
@property(nonatomic,strong) NSString *fromUser;
@property(nonatomic,strong) NSString *fromUserDisplay;
@property(nonatomic,strong) NSString *profileImageURL;
@property(nonatomic,strong) NSString *text;
@property(nonatomic,strong) NSDate   *createdDate;
@property(nonatomic,strong) UIImage  *profileImage;

- (id)initWithDictionary:(NSDictionary*)tweetData;

@end
