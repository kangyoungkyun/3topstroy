//
//  BrowserViewController.m
//  3topstroy
//
//  Created by MacBookPro on 21/11/2018.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()

@end

@implementation BrowserViewController

@synthesize url = _url;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"BrowserViewController viewDidLoad 호출");
    UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectMake(0,
                                                                0,
                                                                self.view.frame.size.width, self.view.frame.size.height -44)]; // 44 nav bar
    //웹뷰의 위임자는 이 뷰컨트롤러이다.
    wv.delegate = self;
    //요청 생성
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:_url];
    //요청
    [wv loadRequest:req];
    //이 컨트롤러에 뷰 넣어주기
    [self.view addSubview:wv];
}


-(void)viewDidDisappear:(BOOL)animated{
    //로딩이 완료되기 전에 유저가 백버튼을 누른다면 네트워크 종료하기
     NSLog(@"BrowserViewController viewDidDisappear 호출");
    if ([UIApplication sharedApplication].networkActivityIndicatorVisible == YES) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
}


#pragma mark - uiWebViewDelegate

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
