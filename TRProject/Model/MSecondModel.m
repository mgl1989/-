//
//  MSecondModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSecondModel.h"

@implementation MSecondModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"spots" : [Spots class],
             @"news" : [News class]};
}

@end


@implementation Spots
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID" : @"id"};
}

@end

@implementation News
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID" : @"id"};
}
@end


