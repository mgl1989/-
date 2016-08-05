//
//  MSecondListController.m
//  TRProject
//
//  Created by tarena1 on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MThirdListController.h"
#import "MThirdViewCell.h"

@interface MThirdListController ()

@end

@implementation MThirdListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =  kRGBColor(46, 52, 58, 1);;
    self.title = @"发现";
    [self.tableView registerClass:[MThirdViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MThirdViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = kRGBColor(46, 52, 58, 1);
    switch (indexPath.row) {
        case 0:
            cell.imageIV.image = [UIImage imageNamed:@"30000"];
            cell.titleLB.text = @"英雄资料";
            break;
        case 1:
            cell.imageIV.image = [UIImage imageNamed:@"3111"];
            cell.titleLB.text = @"物品资料";
            break;
        case 2:
            cell.imageIV.image = [UIImage imageNamed:@"3222"];
            cell.titleLB.text = @"Dota直播";
            break;
        case 3:
            cell.imageIV.image = [UIImage imageNamed:@"3333"];
            cell.titleLB.text = @"Dota2直播";
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
