//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "MFirstListController.h"
#import "MSecondListController.h"
#import "MThirdListController.h"
#import "MForthListColltroler.h"
#import "MNetmanager.h"
#import "MPageViewController.h"
#import "MSearchController.h"

#import <SMS_SDK/SMSSDK.h>


@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    
    //shareSDK手机验证
    //向后台进行申请 appKey 和 appSecret
    [SMSSDK registerApp:@"15ab9b030cef4" withSecret:@"372a3290e3d7334e60e17ed5ca0892a0"];
    //环信
    
    
    
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    UINavigationController *friNavi = [[UINavigationController alloc] initWithRootViewController:[MPageViewController new]];
    UINavigationController *SecNavi = [[UINavigationController alloc] initWithRootViewController:[MSecondListController new]];
    UINavigationController *searchNavi = [[UINavigationController alloc] initWithRootViewController:[MSearchController new]];
      UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MForthListColltroler *ji = (MForthListColltroler *)[sb instantiateViewControllerWithIdentifier:@"MForthListColltroler"];
   
    UINavigationController *forNavi = [[UINavigationController alloc] initWithRootViewController:ji];
    
    friNavi.title = @"视频";
    friNavi.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_zhibo_normal"];
    friNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_zhibo_selected"];
    SecNavi.title = @"资讯";
    SecNavi.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_home_normal"];
    SecNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_home_selected"];
    searchNavi.title = @"发现";
    searchNavi.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_wode_normal"];
    searchNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_wode_selected"];
    forNavi.title = @"我";
    
    forNavi.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_lanmu_normal"];
    forNavi.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_lanmu_selected"];
    
    //设置顶部图片
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"ding"] forBarMetrics:UIBarMetricsDefault];
    
    UITabBarController *tabBarC = [[UITabBarController alloc] init];
    tabBarC.viewControllers = @[SecNavi,friNavi,forNavi];
    _window.rootViewController = tabBarC;
    
//    统一设置标签栏的item的文字样式
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UITabBar appearance].barTintColor = kRGBColor(0, 0, 0, 1);
    [UITabBar appearance].translucent = NO;
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UITabBar appearance].tintColor = kRGBColor(205, 0, 6, 1);
    
    
    return YES;
}




@end
