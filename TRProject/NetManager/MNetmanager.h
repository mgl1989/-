//
//  MNetmanager.h
//  TRProject
//
//  Created by tarena1 on 16/7/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFristModel.h"
#import "MSecondModel.h"
#import "MfirstPushModel.h"
#import "MSecondHeadModel.h"
#import "MSecJieShuoModel.h"
#import "MSecListTpyeModel.h"



typedef NS_ENUM(NSUInteger, ShiPinListType) {
    ShiPinListTypejingji,
    ShiPinListTypeBiSai,
};

@interface MNetmanager : NSObject
//视频直播
+ (id)getFristListCompletionHandler:(void(^)(MFristModel *model, NSError *error))completionHandler;


//资讯
+ (id)getSecondListPage:(NSInteger)page completionHandler:(void(^)(MSecondModel *model, NSError *error))completionHandler;

+ (id)getSecondHeaderListcompletionHandler:(void(^)(id model, NSError *error))completionHandler;

//视频直播跳转
+ (id)getFristPushListCompletionHandler:(void(^)(MfirstPushModel *model, NSError *error))completionHandler;

//解说页面
+ (id)getSecJieshuoListCopletionHandler:(void(^)(NSArray <MSecJieShuoModel *> *model,NSError *error))completionHandler;

+ (id)getSJSPushListPage:(NSInteger)page latName:(NSString *)lastName completionHandler:(void(^)(NSArray<MSecListTpyeModel *> *model, NSError *error))completionHandler;

//视频 俩个页面
+ (id)getShiPingListType:(ShiPinListType)type page:(NSInteger)page completionHandler:(void(^)(NSArray<MSecListTpyeModel *> *model, NSError *error))completionHandler;
//搜索栏
+ (id)postSearchText:(NSString *)text Page:(NSInteger)page completionHandler:(void(^)(NSArray<MSecListTpyeModel *> *model, NSError * error))completionHandler;



@end
