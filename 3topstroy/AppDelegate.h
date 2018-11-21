//
//  AppDelegate.h
//  3topstroy
//
//  Created by MacBookPro on 21/11/2018.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
//탭바 델리게이트 상속

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

//탭바 타입의 변수 생성
@property (strong,nonatomic) UITabBarController *tabBarController;

@end

