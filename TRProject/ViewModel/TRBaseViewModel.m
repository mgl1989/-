//
//  TRBaseViewModel.m
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRBaseViewModel.h"

@implementation TRBaseViewModel
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode lastName:(NSString *)lastName completionHandler:(void (^)(NSError *))completionHandler{}
@end
