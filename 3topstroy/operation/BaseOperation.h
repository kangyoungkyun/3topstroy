//
//  BaseOperation.h
//  3topstroy
//
//  Created by MacBookPro on 21/11/2018.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "Utils.h"

@interface BaseOperation : NSOperation

- (void)enqueueOperation;

- (void)postNotification:(NSString*)notificationName;

- (void)startNetworkActivityIndicator;

- (void)stopNetworkActivityIndicator;

@end

