//
//  MSJSPushViewModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "MNetmanager.h"

@interface MSJSPushViewModel : TRBaseViewModel
/** <#属性描述#> */
@property (nonatomic) NSInteger page;




/** <#属性描述#> */
@property (nonatomic) NSMutableArray<MSecListTpyeModel *> *dataList;

/** <#属性描述#> */
@property (nonatomic) NSInteger rowNumber;

/** 更多页 */
@property (nonatomic) BOOL isLoadMore;

- (NSString *)videoNameForRow:(NSInteger)row;
- (NSString *)videoLengthForRow:(NSInteger)row;
- (NSString *)videoUpdateDateForRow:(NSInteger)row;
- (NSURL *)videoScreenShotForRow:(NSInteger)row;
- (NSURL *)videoOnYoukuUrlForRow:(NSInteger)row;
@end
