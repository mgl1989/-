//
//  MJSPushViewController.m
//  TRProject
//
//  Created by tarena1 on 16/7/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MJSPushViewController.h"
#import "MShipingTableViewCell.h"
#import "MSJSPushViewModel.h"
#import "MFirstPPViewController.h"


@interface MJSPushViewController ()

/** <#属性描述#> */
@property (nonatomic) MSJSPushViewModel *MSJSPushVM;

/** <#属性描述#> */
@property (nonatomic) NSString *spaceName;

@end

@implementation MJSPushViewController
- (instancetype)initWithUrl:(NSURL *)spaceUrl lastName:(NSString *)lastName spaceNameOnYouKu:(NSString *)spaceName{
    if (self = [super init]) {
        _lastName = lastName;
        [self.lastName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        _spaceName = spaceName;
        _spaceUrlonYouku = spaceUrl;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 120;
    UIBarButtonItem *left = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"navigationBar_backButton_icon"] style:UIBarButtonItemStyleDone handler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.title = self.spaceName;
    [self.tableView registerClass:[MShipingTableViewCell class] forCellReuseIdentifier:@"Cellp"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.MSJSPushVM getDataWithRequestMode:VMRequestModeRefresh lastName:self.lastName completionHandler:^(NSError *error) {
            if (!error) {
                [self.tableView reloadData];
                if (self.MSJSPushVM.isLoadMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            [self.tableView.mj_header endRefreshing];
        }];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.MSJSPushVM getDataWithRequestMode:VMRequestModeMore lastName:self.lastName completionHandler:^(NSError *error) {
            if (!error) {
                [self.tableView reloadData];
                if (!self.MSJSPushVM.isLoadMore) {
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

    return self.MSJSPushVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MShipingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cellp" forIndexPath:indexPath];
    cell.backgroundColor = kRGBColor(46, 52, 58, 1);
    cell.videoName.text = [self.MSJSPushVM videoNameForRow:indexPath.row];
    cell.videoLength.text = [self.MSJSPushVM videoLengthForRow:indexPath.row];
    cell.videoUpdate.text = [self.MSJSPushVM videoUpdateDateForRow:indexPath.row];
    [cell.videoScreenShot sd_setImageWithURL:[self.MSJSPushVM videoScreenShotForRow:indexPath.row] placeholderImage:nil];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    MFirstPPViewController *mfp = [[MFirstPPViewController alloc] initWeburl:[self.MSJSPushVM videoOnYoukuUrlForRow:indexPath.row]];
    [self.navigationController pushViewController:mfp animated:YES];
}


- (MSJSPushViewModel *)MSJSPushVM {
	if(_MSJSPushVM == nil) {
		_MSJSPushVM = [[MSJSPushViewModel alloc] init];
	}
	return _MSJSPushVM;
}

@end
