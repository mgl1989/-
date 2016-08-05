//
//  MFirstPPViewController.m
//  TRProject
//
//  Created by tarena1 on 16/7/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MFirstPPViewController.h"
#import <WebKit/WebKit.h>

@interface MFirstPPViewController ()<WKNavigationDelegate>

/** <#属性描述#> */
@property (nonatomic, strong) WKWebView *webView;

/** <#属性描述#> */
@property (nonatomic) UIProgressView *progressView;
@end

@implementation MFirstPPViewController
- (instancetype)initWeburl:(NSURL *)webUrl{
    if (self = [super init]) {
        _weburl = webUrl;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化webView视图  progressView加载进度条
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 5.0)];
    //2.添加，／设置代理
    [self.view addSubview:_webView];
    [self.view addSubview:_progressView];
    self.webView.navigationDelegate = self;
    //3.加载页面
    [self.webView loadRequest:[NSURLRequest requestWithURL:_weburl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
