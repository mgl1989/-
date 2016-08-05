//
//  MFristModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MFristModel.h"

@implementation MFristModel


+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"authors" : [Authors class]};
}

@end


@implementation Authors
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


