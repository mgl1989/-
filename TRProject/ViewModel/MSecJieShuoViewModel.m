//
//  MSecJieShuoViewModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSecJieShuoViewModel.h"

@implementation MSecJieShuoViewModel

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
   _dataTask = [MNetmanager getSecJieshuoListCopletionHandler:^(NSArray<MSecJieShuoModel *> *model, NSError *error) {
       if (!error) {
           if (requestMode == VMRequestModeRefresh) {
               [self.dataList removeAllObjects];
           }
           [self.dataList addObjectsFromArray:model];
       }
       completionHandler(error);
   }];
}


- (NSUInteger)rowNumber{
    return self.dataList.count;
}

- (NSURL *)logImgURLForRow:(NSInteger)row{
    return self.dataList[row].logoImgUrl.yx_URL;
}

- (NSString *)lastUpDateForRow:(NSInteger)row{
    NSString *path = self.dataList[row].lastupdate;
    return [NSString stringWithFormat:@"上次更新:%@", path];
}

- (NSString *)spaceNameOnYoukuForRow:(NSInteger)row{
    return self.dataList[row].spaceNameOnYouKu;
}

- (NSString *)videoCountForRow:(NSInteger)row{
    NSString *path = self.dataList[row].videoCount;
    return [NSString stringWithFormat:@"(%@)",path];
}

- (NSURL *)spaceUrlOnYoukuForRow:(NSInteger)row{
    return self.dataList[row].spaceUrlOnYouKu.yx_URL;
}


- (NSMutableArray<MSecJieShuoModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<MSecJieShuoModel *> alloc] init];
    }
    return _dataList;
}

@end
