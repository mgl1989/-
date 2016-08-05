//
//  MFristViewModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "MNetmanager.h"

@interface MFristViewModel : TRBaseViewModel

@property (nonatomic) NSMutableArray<Authors *> *dataList;

@property (nonatomic) NSInteger rowNumber;

- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)nameForRow:(NSInteger)row;
- (NSString *)detailForRow:(NSInteger)row;


@end
