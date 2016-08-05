//
//  MFristViewModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MFristViewModel.h"

@implementation MFristViewModel
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    _dataTask = [MNetmanager getFristListCompletionHandler:^(MFristModel *model, NSError *error) {
        if (!error) {
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
            [self.dataList addObjectsFromArray:model.authors];
        }
        !completionHandler ? : completionHandler(error);
    }];
    
}

- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (Authors *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}

- (NSString *)detailForRow:(NSInteger)row{
    return [self modelForRow:row].detail;
}

- (NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [self modelForRow:row].icon.yx_URL;
}

- (NSMutableArray<Authors *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<Authors *> alloc] init];
    }
    return _dataList;
}
@end
