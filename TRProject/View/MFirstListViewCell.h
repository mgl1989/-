//
//  MFirstListViewCell.h
//  TRProject
//
//  Created by tarena1 on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFirstListViewCell : UITableViewCell
/** 名字 */
@property (nonatomic, strong) UILabel *spaceNameOnYoukuLB;

/** 图片 */
@property (nonatomic, strong) UIImageView *logImgUrlIV;

/** 时间 */
@property (nonatomic, strong) UILabel *lastUpdateLB;

/** <#属性描述#> */
@property (nonatomic) UILabel *videoCountLB;
@end
