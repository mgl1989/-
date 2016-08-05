//
//  MSecondListController.m
//  TRProject
//
//  Created by tarena1 on 16/7/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSecondListController.h"
#import "MSecondViewCell.h"
#import <iCarousel.h>
#import "MSecondViewModel.h"
#import "MSecondPushViewController.h"
#import "MHeadPushViewController.h"
#import "MSearchViewController.h"
#import "MForthListColltroler.h"


@interface MSecondListController ()<UICollectionViewDelegateFlowLayout,iCarouselDelegate, iCarouselDataSource>

/** <#属性描述#> */
@property (nonatomic) iCarousel *ic;

/** <#属性描述#> */
@property (nonatomic) UIPageControl *pc;

/** <#属性描述#> */
@property (nonatomic) MSecondViewModel *MsecondVM;

/** <#属性描述#> */
@property (nonatomic) NSArray *arrimage;

/** <#属性描述#> */
@property (nonatomic) NSMutableArray<MSecondHeadModel *> *array;



@end

@implementation MSecondListController

static NSString * headerViewIdentifier = @"headerView";

- (instancetype)init{
    //设置流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];

    layout.minimumInteritemSpacing = 0;//cell之间的水平间距
    //设置每个单元格的大小
//    layout.itemSize = CGSizeMake(100, 100);
//    //设置四周外边距
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    //设置collectionView头部视图的大小
    layout.headerReferenceSize = CGSizeMake(kScreenW, 200);
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资讯";
    
    UIButton *leftBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBt setImage:[UIImage imageNamed:@"btn_tabbar_lanmu_normal"] forState:UIControlStateNormal];
    [leftBt setImage:[UIImage imageNamed:@"btn_tabbar_lanmu_selected"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftButton  = [[UIBarButtonItem alloc] initWithCustomView:leftBt];
    leftBt.frame = CGRectMake(0, 0, 30, 30);
    self.navigationItem.leftBarButtonItem = leftButton;
    [leftBt bk_addEventHandler:^(id sender) {
        UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MForthListColltroler *me = [st instantiateViewControllerWithIdentifier:@"MForthListColltroler"];
        [self.navigationController pushViewController:me animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    //搜索
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"btn_nav_search_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_nav_search_selected"] forState:UIControlStateHighlighted];
    UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc] initWithCustomView:button];
    button.frame = CGRectMake(0, 0, 20, 20);
    self.navigationItem.rightBarButtonItem = rightbutton;
    [button bk_addEventHandler:^(id sender) {
        MSearchViewController *search = [[MSearchViewController alloc] init];
        search.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:search animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];

    self.collectionView.backgroundColor = kRGBColor(46, 52, 58, 1);
    //注册cell
    [self.collectionView registerClass:[MSecondViewCell class] forCellWithReuseIdentifier:@"Cell"];
    //注册头部视图
      [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
    
    [MNetmanager getSecondHeaderListcompletionHandler:^(NSArray<MSecondHeadModel *> *model, NSError *error) {
        self.array = [NSMutableArray new];
        
        _array = model.copy;
        [self.collectionView reloadData];
    }];
 
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.MsecondVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            [self.collectionView.mj_header endRefreshing];
            if (!error) {
                 [self.collectionView reloadData];
                if (self.MsecondVM == 0) {
                    [self.collectionView.mj_footer resetNoMoreData];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.MsecondVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            
            if (!error) {
                [self.collectionView.mj_footer endRefreshing];
                [self.collectionView reloadData];
            }
            [self.collectionView.mj_footer endRefreshingWithNoMoreData];
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
}
//返回头部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //如果是头部视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIdentifier forIndexPath:indexPath];
        //添加头部视图内容
        [headerV addSubview:self.ic];
        //头部视图添加view
//        [headerV addSubview:_headerIV];
        return headerV;
    }
    //如果是底部视图
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        
    }
    return nil;
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.MsecondVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MSecondViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        cell.titleLB.text = [self.MsecondVM titleForRow:indexPath.row];
        cell.sourceLB.text = [self.MsecondVM sourceForRow:indexPath.row];
        [cell.thumbIV sd_setImageWithURL:[self.MsecondVM newsThumbForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"mine_setting_icon"]];

    return cell;
}

#pragma mark <UICollectionViewDelegateFlowLayout>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenW - 3 * 10) / 2;
    CGFloat height = width / 350 * 250;
    return CGSizeMake(width, height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
 
    NSURL *url = [self.MsecondVM urlForRow:indexPath.row];
    MSecondPushViewController *mSpvc = [[MSecondPushViewController alloc] initWithUrl:url];
    [self.navigationController pushViewController:mSpvc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#warning 头部视图

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
//    return self.array.count;
    return 5;
}
//每个cell显示的内容是什么
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
        if (!view) {
            view = [[UIView alloc] initWithFrame:carousel.frame];
//            if (index == 0) {
//                view.backgroundColor = [UIColor yellowColor];
//            }
//            if (index == 1) {
//                view.backgroundColor = [UIColor greenColor];
//            }
//            if (index == 2) {
//                view.backgroundColor = [UIColor purpleColor];
//            }
            UIImageView *imageview = [UIImageView new];
            imageview.tag = 100;
            [view addSubview:imageview];
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(0);
            }];
//            imageview.contentMode = UIViewContentModeScaleAspectFill;
        }
        UIImageView *imageV = (UIImageView *)[view viewWithTag:100];
    [imageV sd_setImageWithURL:self.array[index].videoScreenShot.yx_URL placeholderImage:nil];
    UILabel *label = [UILabel new];
    [imageV addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(-8);
        make.left.equalTo(3);
        make.size.equalTo(CGSizeMake(self.view.bounds.size.width - 120, 25));
    }];
    label.font = [UIFont systemFontOfSize:14];
    label.text = self.array[index].videoName;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = kRGBColor(70, 70, 70, .95);
    label.numberOfLines = 1;
    
   
    

//        imageV.image = [UIImage imageNamed:self.arrimage[index]];
//        }];
//        NSDate *  senddate=[NSDate date];
//        NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
//        [dateformatter setDateFormat:@"YYYYMMdd"];
//        NSString *  locationString=[dateformatter stringFromDate:senddate];
//        [MNetmanager getSecondListPage:[locationString integerValue] completionHandler:^(MSecondModel *model, NSError *error) {
//            [imageV sd_setImageWithURL:model.spots[index].thumb.yx_URL placeholderImage:nil];
//            [self.collectionView reloadData];
//        }];
    return view;
}
//点击之后触发
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
 
//    [MNetmanager getSecondListPage:[locationString integerValue] completionHandler:^(MSecondModel *model, NSError *error) {
//        NSURL *url = model.spots[index].url.yx_URL;
        NSURL *url = self.array[index].videoOnYouKuUrl.yx_URL;
        MHeadPushViewController *mHpVC = [[MHeadPushViewController alloc] initWithURL:url];
        mHpVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mHpVC animated:YES];
//    }];
}
//使用代理可以进行更加自动化的设置
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
//使用手势操作时，当当前页面发送变化时触发
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pc.currentPage = carousel.currentItemIndex;
}


#pragma mark - iCarousel Lazyload(懒加载)
- (iCarousel *)ic {
	if(_ic == nil) {
		_ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 200)];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.type = 0;
        _ic.scrollSpeed = .1;
        _ic.backgroundColor = [UIColor whiteColor];
        //自动滚动图片
        [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            _ic.currentItemIndex = _ic.currentItemIndex+1;
        } repeats:YES];
        
        _pc = [UIPageControl new];
        _pc.numberOfPages = 5;
        [self.ic addSubview:self.pc];
        [self.pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-3);
            make.right.equalTo(-30);
        }];
	}
	return _ic;
}

- (MSecondViewModel *)MsecondVM {
    if(_MsecondVM == nil) {
        _MsecondVM = [[MSecondViewModel alloc] init];
    }
    return _MsecondVM;
}

- (NSArray *)arrimage {
	if(_arrimage == nil) {
    _arrimage = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"S2HeadPage" ofType:@"plist"]];
	}
	return _arrimage;
}



@end
