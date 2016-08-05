//
//  MshiPingListViewController.m
//  TRProject
//
//  Created by tarena1 on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MshiPingListViewController.h"
#import "MShipingTableViewCell.h"
#import "MSecListTypeViewModel.h"
#import "MFirstPPViewController.h"


@interface MshiPingListViewController ()

/** <#属性描述#> */
@property (nonatomic) MSecListTypeViewModel *shipingVM;

@end

@implementation MshiPingListViewController


- (instancetype)initWithStyle:(UITableViewStyle)style shipingListType:(ShiPinListType)type{
    if (self = [super initWithStyle:style]) {
        _shipingListType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 120;  
    [self.tableView registerClass:[MShipingTableViewCell class] forCellReuseIdentifier:@"Cellff"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.shipingVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (!error) {
                [self.tableView reloadData];
                if (self.shipingVM.isLoadMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            [self.tableView.mj_header endRefreshing];
        }];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.shipingVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            if (!error) {
                [self.tableView reloadData];
                if (!self.shipingVM.isLoadMore) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shipingVM.rowNumber;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MShipingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cellff" forIndexPath:indexPath];
    cell.backgroundColor = kRGBColor(46, 52, 58, 1);
    cell.videoName.text = [self.shipingVM videoNameForRow:indexPath.row];
    cell.videoLength.text = [self.shipingVM videoLengthForRow:indexPath.row];
    cell.videoUpdate.text = [self.shipingVM videoUpdateDateForRow:indexPath.row];
    [cell.videoScreenShot sd_setImageWithURL:[self.shipingVM videoScreenShotForRow:indexPath.row] placeholderImage:nil];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    MFirstPPViewController *mfp = [[MFirstPPViewController alloc] initWeburl:[self.shipingVM videoOnYoukuUrlForRow:indexPath.row]];
    [self.navigationController pushViewController:mfp animated:YES];
    
}


- (MSecListTypeViewModel *)shipingVM {
	if(_shipingVM == nil) {
        _shipingVM = [[MSecListTypeViewModel alloc] initWithShipingListType:self.shipingListType];
	}
	return _shipingVM;
}

@end
