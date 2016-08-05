//
//  MSecondPushViewController.m
//  TRProject
//
//  Created by tarena1 on 16/7/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSecondPushViewController.h"
#import <WebKit/WebKit.h>

@interface MSecondPushViewController ()

/** <#属性描述#> */
@property (nonatomic) WKWebView *webView;

/** <#属性描述#> */
@property (nonatomic) UIProgressView *progress;
@end

@implementation MSecondPushViewController
- (instancetype)initWithUrl:(NSURL *)url{
    if (self = [super init]) {
        _url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, -70, kScreenW, kScreenH + 70)];
    self.progress = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 5.0)];
    [self.view addSubview:_webView];
    [self.view addSubview:_progress];
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
