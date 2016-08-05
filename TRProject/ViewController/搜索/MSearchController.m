//
//  MSearchController.m
//  TRProject
//
//  Created by tarena1 on 16/7/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSearchController.h"
#import "MSearchListViewModel.h"
#import "MShipingTableViewCell.h"

@interface MSearchController ()<UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate>

/** <#属性描述#> */
@property (nonatomic, strong) MSearchListViewModel *searchVM;

/** <#属性描述#> */
@property (nonatomic) UISearchBar *searchBar;

/** <#属性描述#> */
@property (nonatomic, strong) UITableView *tableView;

/** <#属性描述#> */
@property (nonatomic) UIView *backgroundToView;


@end

static NSString *const identify = @"searchCell";
@implementation MSearchController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.navigationItem.titleView = self.searchBar;
        [self backgroundToView];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - UISearchBar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    self.tableView.userInteractionEnabled = YES;
    self.backgroundToView.hidden = YES;
    [self.searchVM postRequestMode:VMRequestModeRefresh text:self.searchBar.text completionHandler:^(NSError *error) {
        [self.tableView reloadData];
    }];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    //触发隐藏键盘
    [self.searchBar resignFirstResponder];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        MShipingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell" forIndexPath:indexPath];
        cell.backgroundColor = kRGBColor(46, 52, 58, 1);
        cell.videoName.text = [self.searchVM videoNameForRow:indexPath.row];
        cell.videoLength.text = [self.searchVM videoLengthForRow:indexPath.row];
        cell.videoUpdate.text = [self.searchVM videoUpdateDateForRow:indexPath.row];
        [cell.videoScreenShot sd_setImageWithURL:[self.searchVM videoScreenShotForRow:indexPath.row] placeholderImage:nil];
        return cell;
}



#pragma mark - lifecycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.searchVM postRequestMode:VMRequestModeMore text:self.searchBar.text completionHandler:^(NSError *error) {
            if (!error) {
                [self.tableView.mj_footer endRefreshing];
                [self.tableView reloadData];
                 
            }
        }];
    }];
    [self backgroundToView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (MSearchListViewModel *)searchVM {
	if(_searchVM == nil) {
		_searchVM = [[MSearchListViewModel alloc] init];
	}
	return _searchVM;
}

- (UISearchBar *)searchBar {
	if(_searchBar == nil) {
		_searchBar = [[UISearchBar alloc] init];
        _searchBar.placeholder = @"请输入要搜索的关键字";
        _searchBar.delegate = self;
        [_searchBar setShowsScopeBar:YES];
        [_searchBar setBackgroundImage:[UIImage imageNamed:@"a_search base"]];
        //系统键盘按钮出现search
        _searchBar.returnKeyType = UIReturnKeySearch;
	}
	return _searchBar;
}

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
        [self.view addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[MShipingTableViewCell class] forCellReuseIdentifier:identify];
        _tableView.userInteractionEnabled = NO;
        
	}
	return _tableView;
}

- (UIView *)backgroundToView {
	if(_backgroundToView == nil) {
        _backgroundToView = [[UIView alloc] initWithFrame:self.tableView.frame];
        [self.view addSubview:self.backgroundToView];
        _backgroundToView.backgroundColor = mColor;
        UIImageView *imageV = [UIImageView new];
         imageV.image = [UIImage animatedImageNamed:@"load_" duration:1.4];
        [_backgroundToView addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(3);
            make.centerX.equalTo(0);
            make.size.equalTo(CGSizeMake(kScreenW, kScreenW / 393 * 300));
        }];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
	}
	return _backgroundToView;
}

@end
