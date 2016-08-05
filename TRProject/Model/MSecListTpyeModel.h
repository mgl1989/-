//
//  MSecListTpyeModel.h
//  TRProject
//
//  Created by tarena1 on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>


//@class Esarray;
@interface MSecListTpyeModel : NSObject

//
//@property (nonatomic, strong) NSArray<Esarray *> *esArray;
//
//
//@end
//
//@interface Esarray : NSObject

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *videoLength;

@property (nonatomic, copy) NSString *videoScreenShot;

@property (nonatomic, copy) NSString *videoName;

@property (nonatomic, copy) NSString *videoid;

@property (nonatomic, copy) NSString *videoUpdateDate;

@property (nonatomic, copy) NSString *videoOnYouKuUrl;

@end

