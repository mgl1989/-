//
//  MfirstPushViewModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "MNetmanager.h"
@interface MfirstPushViewModel : TRBaseViewModel

/** <#属性描述#> */
@property (nonatomic) NSMutableArray<Videos *> *dataList;

/** <#属性描述#> */
@property (nonatomic) NSInteger rowNumber;

- (NSURL *)thumbForRow:(NSInteger)row;
- (NSString *)weburlForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)dateForRow:(NSInteger)row;
- (NSString *)timeForRow:(NSInteger)row;


@end
