//
//  MSJSPushViewModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSJSPushViewModel.h"

@implementation MSJSPushViewModel


- (void)getDataWithRequestMode:(VMRequestMode)requestMode lastName:(NSString *)lastName completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpage = 1;
    NSString *lastNa = nil;
    switch (requestMode) {
        case VMRequestModeRefresh: {
            _page = tmpage;
            lastNa = lastName;
            break;
        }
        case VMRequestModeMore: {
            tmpage = self.page + 1;
            lastNa = lastName;
            break;
        }
    }
    //中文字转换为UTF－8编码
    NSString *aa = [NSString stringWithString:[lastNa stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    _dataTask = [MNetmanager getSJSPushListPage:tmpage latName:aa completionHandler:^(NSArray<MSecListTpyeModel *> *model, NSError *error) {
        if (!error) {
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model];
            _page = tmpage;
            _isLoadMore = 1;
        }
        !completionHandler ? : completionHandler(error);
    }];
    
}



- (NSInteger)rowNumber{
    return self.dataList.count;
}


- (NSString *)videoNameForRow:(NSInteger)row{
    return self.dataList[row].videoName;
}

- (NSString *)videoLengthForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"时长:%@", self.dataList[row].videoLength];
}

- (NSString *)videoUpdateDateForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"发布时间:%@", self.dataList[row].videoUpdateDate];
}

- (NSURL *)videoScreenShotForRow:(NSInteger)row{
    return self.dataList[row].videoScreenShot.yx_URL;
}

- (NSURL *)videoOnYoukuUrlForRow:(NSInteger)row{
    return self.dataList[row].videoOnYouKuUrl.yx_URL;
}

- (NSMutableArray<MSecListTpyeModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [NSMutableArray<MSecListTpyeModel *> new];
    }
    return _dataList;
}

@end
