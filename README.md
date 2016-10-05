# UIWebview的JS与OC交互
### UIWebview的JS与OC交互方式
- UIWebviewDelegate
- JavaScriptCore
- WebViewJavascriptBridge

### 1.UIWebviewDelegate方式
通过UIWebView的代理方法拦截到目标，然后实现相应的效果.

``` 
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
```

####应用场景
> 例子1.通过代理方法拦截百度首页新闻按钮的点击。

![拦截百度首页新闻按钮](http://ww1.sinaimg.cn/large/987b958agw1f8hhgtw946j20af0ij40o.jpg)
![点击新闻按钮](http://ww2.sinaimg.cn/large/987b958agw1f8hheqvgdyj20af0ijtam.jpg)

### 2.JavaScriptCore交互方式
```
相关的几个类
/*
JS执行的环境，同时也通过JSVirtualMachine管理着所有对象的生命周期，每个JSValue都和JSContext相关联并且强引用context。
*/
#import "JSContext.h"
/*
JS对象在JSVirtualMachine中的一个强引用，其实就是Hybird对象。我们对JS的操作都是通过它。并且每个JSValue都是强引用一个context。同时，OC和JS对象之间的转换也是通过它
*/
#import "JSValue.h"
/*
JS和OC对象的内存管理辅助对象。由于JS内存管理是垃圾回收，并且JS中的对象都是强引用，而OC是引用计数。如果双方相互引用，势必会造成循环引用，而导致内存泄露。我们可以用JSManagedValue保存JSValue来避免。
*/
#import "JSManagedValue.h"
/*
JS运行的虚拟机，有独立的堆空间和垃圾回收机制。
*/
#import "JSVirtualMachine.h"
/*
一个协议，如果JS对象想直接调用OC对象里面的方法和属性，那么这个OC对象只要实现这个JSExport协议就可以了。
*/
#import "JSExport.h"
```

通过JSContext来获取相应操作的key值.key值是html文件里点击方法的名字,并且调用你需要的操作

####应用场景
![本地测试网页](http://ww4.sinaimg.cn/large/987b958agw1f8hhxt5e6pj20af0ijdg1.jpg)
![测试网页按钮点击](http://ww1.sinaimg.cn/large/987b958agw1f8hhytekukj20af0ijjro.jpg)

