//
//  MFristModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Authors;
@interface MFristModel : NSObject
//
@property (nonatomic, strong) NSArray<Authors *> *authors;

@end
@interface Authors : NSObject

@property (nonatomic, copy) NSString *detail;

@property (nonatomic, assign) BOOL watchable;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *youku_id;
//id->ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign) NSInteger pop;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *url;




@end

