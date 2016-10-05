//
//  WebViewJavascriptBridgeViewController.m
//  SLJSObject
//
//  Created by 光头强 on 16/10/5.
//  Copyright © 2016年 Ls. All rights reserved.
//

#import "WebViewJavascriptBridgeViewController.h"
#import "WebViewJavascriptBridge.h"

@interface WebViewJavascriptBridgeViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)WebViewJavascriptBridge *bridge;
@end

@implementation WebViewJavascriptBridgeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JSBridge" ofType:@"html"];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlString baseURL:baseURL];
    [self.view addSubview:webView];
    
    [WebViewJavascriptBridge enableLogging];
    _bridge = [WebViewJavascriptBridge bridgeForWebView:webView];
    [_bridge setWebViewDelegate:self];
    
    [_bridge registerHandler:@"scanClick" handler:^(id data, WVJBResponseCallback responseCallback) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您点击了按钮" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:sureAlertAction];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

@end
