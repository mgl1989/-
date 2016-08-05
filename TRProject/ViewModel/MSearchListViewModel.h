//
//  MSearchListViewModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "MNetmanager.h"


@interface MSearchListViewModel : TRBaseViewModel

///** <#属性描述#> */
//@property (nonatomic) MSearchModel  *model;

/** <#属性描述#> */
@property (nonatomic) NSString *text;
/** <#属性描述#> */
@property (nonatomic) NSInteger page;

///** <#属性描述#> */
@property (nonatomic) BOOL isLoadMore;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<MSecListTpyeModel *> *dataList;
//
- (void)postRequestMode:(VMRequestMode)requestMode text:(NSString *)text completionHandler:(void(^)(NSError *error))completionHandler;
- (NSInteger)rowNumber;

- (NSString *)videoNameForRow:(NSInteger)row;
- (NSString *)videoLengthForRow:(NSInteger)row;
- (NSString *)videoUpdateDateForRow:(NSInteger)row;
- (NSURL *)videoScreenShotForRow:(NSInteger)row;
- (NSURL *)videoOnYoukuUrlForRow:(NSInteger)row;


@end
