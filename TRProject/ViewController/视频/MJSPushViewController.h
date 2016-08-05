//
//  MJSPushViewController.h
//  TRProject
//
//  Created by tarena1 on 16/7/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJSPushViewController : UITableViewController

- (instancetype)initWithUrl:(NSURL *)spaceUrl lastName:(NSString *)lastName spaceNameOnYouKu:(NSString *)spaceName;

/** <#属性描述#> */
@property (nonatomic) NSString *lastName;

/** <#属性描述#> */
@property (nonatomic) NSURL *spaceUrlonYouku;
@end
