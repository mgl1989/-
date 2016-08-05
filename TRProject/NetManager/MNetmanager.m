//
//  MNetmanager.m
//  TRProject
//
//  Created by tarena1 on 16/7/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MNetmanager.h"

@implementation MNetmanager

+ (id)getFristListCompletionHandler:(void (^)(MFristModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:mFirstPath];
    
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        if (error) {
            !completionHandler ? : completionHandler(nil, error);
        }else{
         !completionHandler ? : completionHandler([MFristModel parseJSON:jsonObject],nil);
        }
    }];
}
+ (id)getSecondListPage:(NSInteger)page completionHandler:(void (^)(MSecondModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:mSecondPath, page];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ? : completionHandler([MSecondModel parseJSON:jsonObject], error);
    }];
}




+(id)getFristPushListCompletionHandler:(void (^)(MfirstPushModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:mFirstPushPath];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ? : completionHandler([MfirstPushModel parseJSON:jsonObject], nil);
    }];
}

+ (id)getSecondHeaderListcompletionHandler:(void (^)(id , NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:mFirstHeaderPth];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ? : completionHandler([MSecondHeadModel parseJSON:jsonObject],nil);
    }];
}



+ (id)getShiPingListType:(ShiPinListType)type page:(NSInteger)page completionHandler:(void (^)(NSArray<MSecListTpyeModel *> *, NSError *))completionHandler{
    NSString *path = nil;

    switch (type) {
        case ShiPinListTypejingji: {
            path = [NSString stringWithFormat:mSecondjingjiPath, page];
            break;
        }
        case ShiPinListTypeBiSai: {
            path = [NSString stringWithFormat:mSecondBisaiPath, page];
            break;
        }
    }
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([MSecListTpyeModel parseJSON:jsonObject], nil);
    }];

}

+ (id)getSecJieshuoListCopletionHandler:(void (^)(NSArray <MSecJieShuoModel *> *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:mSecondJieshuoPath];
    return  [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ? : completionHandler([MSecJieShuoModel parseJSON:jsonObject], nil);
    }];
}

+ (id)getSJSPushListPage:(NSInteger)page latName:(NSString *)lastName completionHandler:(void (^)(NSArray<MSecListTpyeModel *> *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:mFJSPushPath, page, lastName];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
         !completionHandler ? : completionHandler([MSecListTpyeModel parseJSON:jsonObject], nil);
    }];
}

+ (id)postSearchText:(NSString *)text Page:(NSInteger)page completionHandler:(void (^)(NSArray<MSecListTpyeModel *> *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:@"http://121.41.43.170:8181//YouKuServer/servlet/SearchServlet"];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *p = [NSString stringWithFormat:@"%ld", page];
    [dic setObject:text forKey:@"text"];
    [dic setObject:@"dota" forKey:@"type"];
    [dic setObject:p forKey:@"curPage"];
    return [self POST:path parameters:dic progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ? : completionHandler([MSecListTpyeModel parseJSON:jsonObject],nil);
    }];
}


@end
