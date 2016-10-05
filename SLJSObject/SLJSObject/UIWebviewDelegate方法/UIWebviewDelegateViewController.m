//
//  UIWebviewDelegateViewController.m
//  SLJSObject
//
//  Created by 光头强 on 16/10/5.
//  Copyright © 2016年 Ls. All rights reserved.
//

#import "UIWebviewDelegateViewController.h"

@interface UIWebviewDelegateViewController ()<UIWebViewDelegate>

@end

@implementation UIWebviewDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    webView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}

#pragma mark - <UIWebViewDelegate>
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestStr = [request.URL absoluteString];
    NSLog(@"%@",requestStr);
    NSRange newRange = [[requestStr lowercaseString] rangeOfString:@"news"];
    if (newRange.length > 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您点击了新闻按钮" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:sureAlertAction];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        return NO;
    }
    
    return YES;
}

@end
