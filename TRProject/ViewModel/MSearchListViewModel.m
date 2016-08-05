//
//  MSearchListViewModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSearchListViewModel.h"

@implementation MSearchListViewModel

- (void)postRequestMode:(VMRequestMode)requestMode text:(NSString *)text completionHandler:(void (^)(NSError *))completionHandler{
    if (_text.length == 0) {
        completionHandler(nil);
        return;
    }
     NSInteger curPage =1;
    switch (requestMode) {
           
        case VMRequestModeRefresh: {
            curPage = 1;
            break;
        }
        case VMRequestModeMore: {
            curPage = _page + 1;
            break;
        }
    }
  self.dataTask = [MNetmanager postSearchText:_text Page:curPage completionHandler:^(NSArray<MSecListTpyeModel *> * model, NSError *error) {
      if (!error) {
          if (requestMode == VMRequestModeRefresh) {
              [self.dataList removeAllObjects];
          }
          _isLoadMore = YES;
          self.page = curPage;
          [self.dataList addObjectsFromArray:model];
      }
      completionHandler(error);
  }];
    
}

- (NSInteger)rowNumber{
    return  self.dataList.count;
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
