# UIWebview的JS与OC交互
### UIWebview的JS与OC交互方式
- UIWebviewDelegate
- JavaScriptCore
- WebViewJavascriptBridge

###UIWebviewDelegate方式
通过UIWebView的代理方法拦截到目标，然后实现相应的效果.

``` 
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
```

####应用场景
> 通过代理方法拦截百度首页新闻按钮的点击。
![拦截百度首页新闻按钮](http://ww1.sinaimg.cn/large/987b958agw1f8hhgtw946j20af0ij40o.jpg)
![点击新闻按钮](http://ww2.sinaimg.cn/large/987b958agw1f8hheqvgdyj20af0ijtam.jpg)