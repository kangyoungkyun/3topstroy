//
//  BrowserViewController.h
//  3topstroy
//
//  Created by MacBookPro on 21/11/2018.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic,strong) NSURL *url;

@end
