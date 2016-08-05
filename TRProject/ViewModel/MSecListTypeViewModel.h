//
//  MSecListTypeViewModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "MNetmanager.h"

@interface MSecListTypeViewModel : TRBaseViewModel
//必须重写初始化方法，传入当前VM请求的数据类型
- (instancetype)initWithShipingListType:(ShiPinListType)type;

/** <#属性描述#> */
@property (nonatomic) NSString *lastName;

/** <#属性描述#> */
@property (nonatomic) ShiPinListType shiPinListTpye;

/** <#属性描述#> */
@property (nonatomic) NSInteger page;

/** <#属性描述#> */
@property (nonatomic) NSMutableArray<MSecListTpyeModel *> *dataList;

/** <#属性描述#> */
@property (nonatomic) NSInteger rowNumber;

/** <#属性描述#> */
@property (nonatomic) BOOL isLoadMore;

- (NSString *)videoNameForRow:(NSInteger)row;
- (NSString *)videoLengthForRow:(NSInteger)row;
- (NSString *)videoUpdateDateForRow:(NSInteger)row;
- (NSURL *)videoScreenShotForRow:(NSInteger)row;
- (NSURL *)videoOnYoukuUrlForRow:(NSInteger)row;




@end
