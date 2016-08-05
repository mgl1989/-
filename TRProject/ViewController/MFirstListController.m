//
//  MFirstListController.m
//  TRProject
//
//  Created by tarena1 on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MFirstListController.h"
#import "MFirstListViewCell.h"
#import <iCarousel.h>
#import "MFristViewModel.h"
//#import "MfristPushController.h"
#import "MSecListTypeViewModel.h"
#import "MSecJieShuoViewModel.h"
#import "MJSPushViewController.h"

@interface MFirstListController ()<iCarouselDelegate,iCarouselDataSource>

/** iCarouse滚动视图 */
@property (nonatomic, strong) iCarousel *ic;

/** <#属性描述#> */
@property (nonatomic) NSArray<NSString *> *arrImage;

/** <#属性描述#> */
@property (nonatomic) UIPageControl *pc;

/** <#属性描述#> */
@property (nonatomic) MSecJieShuoViewModel *MFristVM;

@end

@implementation MFirstListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.tableView registerClass:[MFirstListViewCell class] forCellReuseIdentifier:@"FCell"];
    self.tableView.tableHeaderView = self.ic;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.MFristVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            
            if (!error) {
                [self.tableView reloadData];
                if (self.MFristVM == 0) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            [self.tableView.mj_header endRefreshing];
        }];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.MFristVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            
            if (!error) {
                [self.tableView.mj_header endRefreshing];
                [self.tableView reloadData];
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            
        }];
    }];
    [self.tableView beginHeaderRefresh];
}

////给cell添加动画
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    //设置Cell的动画效果为3D效果
//    //设置x和y的初始值为0.1；
//    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//    //x和y的最终值为1
//    [UIView animateWithDuration:1 animations:^{
//        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
//    }];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.MFristVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MFirstListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FCell" forIndexPath:indexPath];
    //右边图标
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = kRGBColor(46, 52, 58, 1);
    [cell.logImgUrlIV sd_setImageWithURL:[self.MFristVM logImgURLForRow:indexPath.row] placeholderImage:nil];
    cell.spaceNameOnYoukuLB.text = [self.MFristVM spaceNameOnYoukuForRow:indexPath.row];
    cell.lastUpdateLB.text = [self.MFristVM lastUpDateForRow:indexPath.row];
    cell.videoCountLB.text = [self.MFristVM videoCountForRow:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSURL *url = [self.MFristVM spaceUrlOnYoukuForRow:indexPath.row];
    NSString *lastName = [self.MFristVM spaceNameOnYoukuForRow:indexPath.row];
    MJSPushViewController *MFpushC = [[MJSPushViewController alloc] initWithUrl:url lastName:lastName spaceNameOnYouKu:[self.MFristVM spaceNameOnYoukuForRow:indexPath.row]];
//    MFpushC.title = [self.MFristVM nameForRow:indexPath.row];
    //push过去自己隐藏tablebar
    MFpushC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:MFpushC animated:YES];
    
}



- (MSecJieShuoViewModel *)MFristVM {
    if(_MFristVM == nil) {
        _MFristVM = [[MSecJieShuoViewModel alloc] init];
    }
    return _MFristVM;
}


#warning 头部视图
#pragma mark - iCarousel Delegate

//有多少张图片需要在carousel中显示
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.arrImage.count;
}

//每个cell是怎么样的
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        imageView.tag = 100;
        //图片充满整个view
        imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    NSString *imageName = self.arrImage[index];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dota" ofType:@"bundle"];
    NSString *imgPath = [path stringByAppendingPathComponent:imageName];
    UIImage *img = [UIImage imageWithContentsOfFile:imgPath];
    imageView.image = img;
    return view;
}

//使用手势操作，当前页面发生变化时触发
//- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
//    _pc.currentPage = carousel.currentItemIndex;
//}
//某个item被选中时触发
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%ld 被选中", index);
}

//使用代理可以进行更加自动化的设置
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    //滚动视图不显示后面的图片
    if (option == iCarouselOptionShowBackfaces) {
        value = NO;
    }
    //模式0， 默认不是循环滚动，需要特殊处理，允许循环滚动
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

#pragma mark -  Lazyload(懒加载)
- (iCarousel *)ic {
	if(_ic == nil) {
		_ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW/480 *180)];
        _ic.backgroundColor = [UIColor whiteColor];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.type = 0;
        _ic.scrollSpeed = .4;
        _ic.autoscroll = 0.2;
        _ic.backgroundColor = [UIColor blackColor];
        //竖向滚动
//        _ic.vertical = YES;
        [self.view addSubview:_ic];
        //自动滚动处理
//        [NSTimer scheduledTimerWithTimeInterval:2 block:^(NSTimer * _Nonnull timer) {
//            _ic.currentItemIndex = _ic.currentItemIndex+1;
//        } repeats:YES];
     
//        _pc = [UIPageControl new];
//        _pc.numberOfPages = 5;
//        [_ic addSubview:_pc];
//        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.bottom.equalTo(0);
//        }];
	}
	return _ic;
}

- (NSArray<NSString *> *)arrImage {
	if(_arrImage == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"dota" ofType:@"bundle"];
        NSLog(@"%@", path);
//        _arrImage = [NSArray arrayWithContentsOfFile:path];
        NSFileManager *manager = [NSFileManager defaultManager];
        _arrImage = [manager subpathsAtPath:path];
    
	}
	return _arrImage;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation

{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate

{
    return NO;
}


#warning 估计自适应的高度
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewAutomaticDimension;
//}
@end
