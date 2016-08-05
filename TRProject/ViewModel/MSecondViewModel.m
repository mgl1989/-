//
//  MSecondViewModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSecondViewModel.h"

@implementation MSecondViewModel
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
//    _dataTask = [MNetmanager getSecondListCompletionHandler:^(MSecondModel *model, NSError *error) {
//        if (!error) {
//            if (requestMode == VMRequestModeRefresh) {
//                [self.newsList removeAllObjects];
//            }
//            [self.spotsList addObjectsFromArray:model.spots];
//            [self.newsList addObjectsFromArray:model.news];
//        }
//        !completionHandler ? : completionHandler(error);
//    }];
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMdd"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    NSLog(@"locationString:%@",locationString);
    NSInteger tmpP = [locationString integerValue];
    NSInteger temPage = tmpP;
    switch (requestMode) {
        case VMRequestModeRefresh: {
           temPage = tmpP;
            break;
        }
        case VMRequestModeMore: {
            temPage = self.page - 1;
            break;
        }
    }
    _dataTask = [MNetmanager getSecondListPage:temPage completionHandler:^(MSecondModel *model, NSError *error) {
        if (!error) {
            if (requestMode == VMRequestModeRefresh) {
                [self.newsList removeAllObjects];
                [self.spotsList removeAllObjects];
            }
            self.page = temPage;
            [self.spotsList addObjectsFromArray:model.spots];
            [self.newsList addObjectsFromArray:model.news];
            
        }
        !completionHandler ? : completionHandler(error);
    }];
}


- (NSInteger)rowNumber{
    return self.newsList.count;
}
- (NSURL *)newsLinkForRow:(NSInteger)row{
    return self.newsList[row].link.yx_URL;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.newsList[row].title;
}
- (NSURL *)newsThumbForRow:(NSInteger)row{
    return self.newsList[row].thumb.yx_URL;
}
- (NSString *)sourceForRow:(NSInteger)row{
    return self.newsList[row].source;
}
- (NSURL *)urlForRow:(NSInteger)row{
    return self.newsList[row].url.yx_URL;
}


//头部视图
- (NSURL *)spotsurlForRow:(NSInteger)index{
    return self.spotsList[index].url.yx_URL;
}
- (NSURL *)spotsThumbForIndex:(NSInteger)index{
    return self.spotsList[index].thumb.yx_URL;
}
- (NSInteger)PageNumber{
    return self.spotsList.count;
}

- (NSMutableArray<News *> *)newsList {
    if(_newsList == nil) {
        _newsList = [[NSMutableArray<News *> alloc] init];
    }
    return _newsList;
}

- (NSMutableArray<Spots *> *)spotsList {
    if(_spotsList == nil) {
        _spotsList = [[NSMutableArray<Spots *> alloc] init];
    }
    return _spotsList;
}

@end
