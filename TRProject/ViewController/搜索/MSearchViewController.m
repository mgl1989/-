//
//  MSearchViewController.m
//  TRProject
//
//  Created by tarena1 on 16/7/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSearchViewController.h"
#import "MShipingTableViewCell.h"
#import "MSearchListViewModel.h"
#import "MFirstPPViewController.h"

@interface MSearchViewController ()


//
/** <#属性描述#> */
@property (nonatomic) MSearchListViewModel *searchVM;

/** <#属性描述#> */
@property (nonatomic) NSString *text;

/** <#属性描述#> */
@property (nonatomic) UISearchBar *searBar;

/** <#属性描述#> */
@property (nonatomic) UITextField *tf;
/** <#属性描述#> */
@property (nonatomic) UIView *backgroundToView;

@end


@implementation MSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = mColor;
    UIBarButtonItem *left = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"navigationBar_backButton_icon"] style:UIBarButtonItemStyleDone handler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.titleView = self.tf;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 25, 25);
    [button setImage:[UIImage imageNamed:@"btn_nav_search_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_nav_search_selected"] forState:UIControlStateHighlighted];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
    self.navigationItem.titleView = self.tf;
    [self backgroundToView];
    [button bk_addEventHandler:^(id sender) {
        self.searchVM.text = self.tf.text;
        self.tableView.userInteractionEnabled = YES;
        self.backgroundToView.hidden = YES;

        [self.searchVM postRequestMode:VMRequestModeRefresh text:self.text completionHandler:^(NSError *error) {
            if (!error) {
                [self.tableView reloadData];
                if (!self.searchVM.isLoadMore) {
                    [self.tableView endFooterRefreshWithNoMoreData];
                }else{
                    [self.tableView endFooterRefresh];
                }
            }
        }];
        WK(weakSelf)
        [self.tableView addAutoFooterRefresh:^{
            [weakSelf.searchVM postRequestMode:VMRequestModeMore text:weakSelf.text completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                    if (weakSelf.searchVM.isLoadMore) {
                        [weakSelf.tableView endFooterRefresh];
                    }else{
                        [weakSelf.tableView endFooterRefreshWithNoMoreData];
                    }
                }else{
                    [weakSelf.view showWarning:error.localizedDescription];
                }
                
            }];
        }];
     
        
    } forControlEvents:UIControlEventTouchUpInside];
 
    [self.tableView registerClass:[MShipingTableViewCell class] forCellReuseIdentifier:@"searchCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//当用户触摸self.view触发
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //uiview可以强制让内部的所有子视图，取消编辑状态
    [self.view endEditing:YES];
}

//给cell添加动画
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //设置Cell的动画效果为3D效果
    //设置x和y的初始值为0.1；
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    //x和y的最终值为1
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

#pragma mark - Table view data source
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.tf resignFirstResponder];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchVM rowNumber];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MShipingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell" forIndexPath:indexPath];
    cell.backgroundColor = kRGBColor(46, 52, 58, 1);
    cell.videoName.text = [self.searchVM videoNameForRow:indexPath.row];
    cell.videoLength.text = [self.searchVM videoLengthForRow:indexPath.row];
    cell.videoUpdate.text = [self.searchVM videoUpdateDateForRow:indexPath.row];
    [cell.videoScreenShot sd_setImageWithURL:[self.searchVM videoScreenShotForRow:indexPath.row] placeholderImage:nil];
    return cell;
}

- (UITextField *)tf{
    if (!_tf) {
        _tf = [UITextField new];
        _tf.frame = CGRectMake(0, 0, kScreenW*2.0 / 3, 30);
        _tf.borderStyle = UITextBorderStyleRoundedRect;
        _tf.placeholder = @"请输入关键字";
        //清空内容按钮，在编辑时出现
        _tf.keyboardType = UIKeyboardTypeDefault;
        //系统键盘enter按钮变成search
        _tf.returnKeyType = UIReturnKeySearch;
    }
    return _tf;
}

- (MSearchListViewModel *)searchVM {
    if(_searchVM == nil) {
        _searchVM = [[MSearchListViewModel alloc] init];
    }
    return _searchVM;
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
            make.centerX.equalTo(0);
            make.top.equalTo(18);
            make.size.equalTo(CGSizeMake(kScreenW, kScreenW / 393 * 300));
        }];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.layer.cornerRadius = self.view.frame.size.width / 2 - 50;
        imageV.clipsToBounds = YES;
        
    }
    return _backgroundToView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    MFirstPPViewController *search = [[MFirstPPViewController alloc] initWeburl:[self.searchVM videoOnYoukuUrlForRow:indexPath.row]];
    [self.navigationController pushViewController:search animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.searchVM.dataTask resume];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.searchVM.dataTask suspend];
}

- (void)dealloc{
    [self.searchVM.dataTask cancel];
}



@end
