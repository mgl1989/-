//
//  MfirstPushModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Videos;
@interface MfirstPushModel : NSObject


@property (nonatomic, strong) NSArray<Videos *> *videos;


@end
@interface Videos : NSObject

@property (nonatomic, copy) NSString *weburl;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *time;
//id ->ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *site;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *thumb;

@end

