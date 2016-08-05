//
//  MSecJieShuoViewModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "MNetmanager.h"

@interface MSecJieShuoViewModel : TRBaseViewModel



/** <#属性描述#> */
@property (nonatomic) NSMutableArray<MSecJieShuoModel *> *dataList;

/** <#属性描述#> */
@property (nonatomic) NSUInteger rowNumber;

- (NSURL *)logImgURLForRow:(NSInteger)row;
- (NSString *)lastUpDateForRow:(NSInteger)row;
- (NSString *)spaceNameOnYoukuForRow:(NSInteger)row;
- (NSString *)videoCountForRow:(NSInteger)row;
- (NSURL *)spaceUrlOnYoukuForRow:(NSInteger)row;



@end
