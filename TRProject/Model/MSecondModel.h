//
//  MSecondModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Spots,News;
@interface MSecondModel : NSObject

@property (nonatomic, strong) NSArray<Spots *> *spots;

@property (nonatomic, strong) NSArray<News *> *news;


@end

@interface Spots : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) NSInteger released_at;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, copy) NSString *abstract;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *mark_color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, assign) NSInteger form;

@property (nonatomic, copy) NSString *mark;

@end

@interface News : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) NSInteger released_at;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, copy) NSString *abstract;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *mark_color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, assign) NSInteger form;

@property (nonatomic, copy) NSString *mark;

@end

