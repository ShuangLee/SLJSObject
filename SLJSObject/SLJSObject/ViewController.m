//
//  ViewController.m
//  SLJSObject
//
//  Created by 光头强 on 16/10/5.
//  Copyright © 2016年 Ls. All rights reserved.
//

#import "ViewController.h"
#import "UIWebviewDelegateViewController.h"
#import "JavaScriptCoreViewController.h"
#import "WebViewJavascriptBridgeViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, copy) NSArray *dataArr;
@end

@implementation ViewController
- (NSArray *)dataArr {
    return @[@"UIWebviewDelegate",@"JavaScriptCore",@"WebViewJavascriptBridge"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"WebView js 与 oc 交互";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:(UITableViewStylePlain)];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.rowHeight = 50;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:str];
        cell.textLabel.text = self.dataArr[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIWebviewDelegateViewController *vc = [[UIWebviewDelegateViewController alloc] init];
        vc.title = @"UIWebViewDelegateViewController";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        JavaScriptCoreViewController *vc = [[JavaScriptCoreViewController alloc] init];
        vc.title = @"JavaScriptCoreViewController";
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        WebViewJavascriptBridgeViewController *vc = [[WebViewJavascriptBridgeViewController alloc] init];
        vc.title = @"WebViewJavascriptBridgeViewController";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
