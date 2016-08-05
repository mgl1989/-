//
//  MfirstPushViewModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MfirstPushViewModel.h"

@implementation MfirstPushViewModel
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
   
    _dataTask = [MNetmanager getFristPushListCompletionHandler:^(MfirstPushModel *model, NSError *error) {
        switch (requestMode) {
            case VMRequestModeRefresh: {
                [self.dataList removeAllObjects];
                break;
            }
            case VMRequestModeMore: {
                [self.dataList removeAllObjects];
                break;
            }
        }
        [self.dataList addObjectsFromArray:model.videos];
        completionHandler(error);
    }];
}
- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (NSURL *)thumbForRow:(NSInteger)row{
    return self.dataList[row].thumb.yx_URL;
}

- (NSString *)weburlForRow:(NSInteger)row{
    return self.dataList[row].weburl;
}

- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].title;
}

- (NSString *)dateForRow:(NSInteger)row{
    NSString *path = self.dataList[row].date;
    
    return [NSString stringWithFormat:@"发布:%@", path];
}

- (NSString *)timeForRow:(NSInteger)row{
    NSString *path = self.dataList[row].time;
    return [NSString stringWithFormat:@"时长:%@", path];
}


- (NSMutableArray<Videos *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<Videos *> alloc] init];
    }
    return _dataList;
}
@end
