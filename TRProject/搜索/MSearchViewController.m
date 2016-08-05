////
////  MSearchViewController.m
////  TRProject
////
////  Created by tarena1 on 16/7/29.
////  Copyright © 2016年 Tarena. All rights reserved.
////
//
//#import "MSearchViewController.h"
//#import "MShipingTableViewCell.h"
//#import "MSearchListViewModel.h"
//#import "MFirstPPViewController.h"
//
//@interface MSearchViewController ()
//
//
////
///** <#属性描述#> */
//@property (nonatomic) MSearchListViewModel *searchVM;
//
///** <#属性描述#> */
//@property (nonatomic) NSString *text;
//
///** <#属性描述#> */
//@property (nonatomic) UISearchBar *searBar;
//
//@end
//
//
//@implementation MSearchViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    UIBarButtonItem *left = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"navigationBar_backButton_icon"] style:UIBarButtonItemStyleDone handler:^(id sender) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }];
//    self.navigationItem.leftBarButtonItem = left;
//    self.navigationItem.titleView = self.tf;
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(0, 0, 25, 25);
//    [button setImage:[UIImage imageNamed:@"btn_nav_search_normal"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"btn_nav_search_selected"] forState:UIControlStateHighlighted];
//    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:button];
//    self.navigationItem.rightBarButtonItem = right;
//    self.navigationItem.titleView = self.tf;
//    [button bk_addEventHandler:^(id sender) {
//        self.searchVM.text = self.tf.text;
//
//        [self.searchVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
//            if (!error) {
//                [self.tableView reloadData];
//                if (!self.searchVM.isLoadPage) {
//                    [self.tableView endFooterRefreshWithNoMoreData];
//                }else{
//                    [self.tableView endFooterRefresh];
//                }
//            }
//        }];
//        
//    } forControlEvents:UIControlEventTouchUpInside];
//
//    WK(weakSelf)
//    [self.tableView addAutoFooterRefresh:^{
////        [weakSelf.searchVM PostRequestMode:VMRequestModeMore Message:weakSelf.message completionHandler:^(NSError *error) {
//        [weakSelf.searchVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
//            if (!error) {
//                [weakSelf.tableView reloadData];
//                if (weakSelf.searchVM.isLoadPage) {
//                    [weakSelf.tableView endFooterRefresh];
//                }else{
//                    [weakSelf.tableView endFooterRefreshWithNoMoreData];
//                }
//            }else{
//                [weakSelf.view showWarning:error.localizedDescription];
//            }
//            
//        }];
//    }];
//    [self.tableView registerClass:[MShipingTableViewCell class] forCellReuseIdentifier:@"searchCell"];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//#pragma mark - Table view data source
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    [self.tf resignFirstResponder];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.searchVM number];
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    MShipingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell" forIndexPath:indexPath];
//    cell.backgroundColor = kRGBColor(46, 52, 58, 1);
//    cell.videoName.text = [self.searchVM videoNameForRow:indexPath.row];
//    cell.videoLength.text = [self.searchVM videoLengthForRow:indexPath.row];
//    cell.videoUpdate.text = [self.searchVM videoUpdateDateForRow:indexPath.row];
//    [cell.videoScreenShot sd_setImageWithURL:[self.searchVM videoScreenShotForRow:indexPath.row] placeholderImage:nil];
//    return cell;
//}
//
////- (UITextField *)tf{
////    if (!_tf) {
////        _tf = [UITextField new];
////        _tf.frame = CGRectMake(0, 0, kScreenW*2.0 / 3, 30);
////        _tf.borderStyle = UITextBorderStyleRoundedRect;
////        _tf.placeholder = @"请输入关键字";
////    }
////    return _tf;
////}
//
//- (MSearchListViewModel *)searchVM {
//    if(_searchVM == nil) {
//        _searchVM = [[MSearchListViewModel alloc] init];
//    }
//    return _searchVM;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    MFirstPPViewController *search = [[MFirstPPViewController alloc] initWeburl:[self.searchVM videoOnYoukuUrlForRow:indexPath.row]];
//    [self.navigationController pushViewController:search animated:YES];
//    
//}
//
//- (void)viewWillAppear:(BOOL)animated{
//    [self.searchVM.dataTask resume];
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [self.searchVM.dataTask suspend];
//}
//
//- (void)dealloc{
//    [self.searchVM.dataTask cancel];
//}
//
//
//
//@end
