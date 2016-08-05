//
//  MshiPingListViewController.h
//  TRProject
//
//  Created by tarena1 on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSecListTypeViewModel.h"

@interface MshiPingListViewController : UITableViewController
- (instancetype)initWithStyle:(UITableViewStyle)style shipingListType:(ShiPinListType)type;
/** <#属性描述#> */
@property (nonatomic, readonly) ShiPinListType shipingListType;
@end
