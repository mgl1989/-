//
//  MPageViewController.m
//  TRProject
//
//  Created by tarena1 on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MPageViewController.h"
#import "MFirstListController.h"
#import "MshiPingListViewController.h"


@interface MPageViewController ()<WMPageControllerDelegate>

/** iCarouse滚动视图 */
@property (nonatomic, strong) iCarousel *ic;
/** <#属性描述#> */
@property (nonatomic) UIPageControl *pc;
/** <#属性描述#> */
@property (nonatomic) NSArray<NSString *> *arrImage;

@end

@implementation MPageViewController

//父类中自带了这个属性
- (NSArray<NSString *> *)titles{
    return @[@"解说", @"集锦", @"比赛"];
}

//实现三个方法
//问题1:有几个子视图控制器
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
//问题2: 每个视图控制器对应的题目是什么
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
//问题3: 每个视图控制器什么样
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        MFirstListController *js = [[MFirstListController alloc] initWithStyle:UITableViewStylePlain];
        return js;
    }
    if (index == 1) {
        MshiPingListViewController *jj = [[MshiPingListViewController alloc] initWithStyle:UITableViewStylePlain shipingListType:ShiPinListTypejingji];
        return jj;
    }
    if (index == 2) {
        MshiPingListViewController *bs = [[MshiPingListViewController alloc] initWithStyle:UITableViewStylePlain shipingListType:ShiPinListTypeBiSai];
        return bs;
    }
    return nil;
}


- (UIColor *)titleColorNormal{
    return [UIColor whiteColor];
}
- (UIColor *)titleColorSelected{
    UIColor *color = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
    return color;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"视频";
    self.menuView.backgroundColor = kRGBColor(46, 52, 58, 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
