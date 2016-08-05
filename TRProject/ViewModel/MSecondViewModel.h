//
//  MSecondViewModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "MNetmanager.h"

@interface MSecondViewModel : TRBaseViewModel

/** <#属性描述#> */
@property (nonatomic) NSMutableArray<Spots *> *spotsList;

/** <#属性描述#> */
@property (nonatomic) NSMutableArray<News *> *newsList;

/** <#属性描述#> */
@property (nonatomic, readonly) NSInteger rowNumber;

/** <#属性描述#> */
@property (nonatomic) NSInteger page;

/** <#属性描述#> */
@property (nonatomic) BOOL isHasMore;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)sourceForRow:(NSInteger)row;
- (NSURL *)newsThumbForRow:(NSInteger)row;
- (NSURL *)newsLinkForRow:(NSInteger)row;
- (NSURL *)urlForRow:(NSInteger)row;


//头部视图
//- (NSURL *)spotsThumbForIndex:(NSInteger)index;
//- (NSURL *)spotsurlForindex:(NSInteger)index;

/** <#属性描述#> */
@property (nonatomic, readonly) NSInteger PageNumber;

@end

