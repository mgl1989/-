//
//  MfirstPushModel.m
//  TRProject
//
//  Created by tarena1 on 16/7/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MfirstPushModel.h"

@implementation MfirstPushModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"videos" : [Videos class]};
}
@end
@implementation Videos
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID" : @"id"};
}
@end


