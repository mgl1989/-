//
//  MSecListTypeViewModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSecListTypeViewModel.h"

@implementation MSecListTypeViewModel

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpage = 1;
    
    switch (requestMode) {
        case VMRequestModeRefresh: {
            _page = tmpage;
            break;
        }
        case VMRequestModeMore: {
            tmpage = self.page + 1;
            break;
        }
    }
    
    _dataTask = [MNetmanager getShiPingListType:_shiPinListTpye page:tmpage completionHandler:^(NSArray<MSecListTpyeModel *> *model, NSError *error) {
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

- (NSString *)lastName {
    if(_lastName == nil) {
        _lastName = [[NSString alloc] init];
    }
    return _lastName;
}

- (instancetype)initWithShipingListType:(ShiPinListType)type{
    if (self = [super init]) {
        _shiPinListTpye = type;
    }
    return self;
}

- (instancetype)init{
    NSAssert1(NO, @"必须使用initWithShipingListType:初始化方法,%s", __FUNCTION__);
    return nil;
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
