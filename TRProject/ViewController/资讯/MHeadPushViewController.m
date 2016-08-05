//
//  MHeadPushViewController.m
//  TRProject
//
//  Created by tarena1 on 16/7/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MHeadPushViewController.h"
#import <WebKit/WebKit.h>

@interface MHeadPushViewController ()

/** <#属性描述#> */
@property (nonatomic) WKWebView *webView;
@end

@implementation MHeadPushViewController

- (instancetype)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        _url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, -65, kScreenW, kScreenH + 65)];
    [self.view addSubview:_webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:_url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
