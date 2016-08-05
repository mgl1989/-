//
//  MForthListColltroler.m
//  TRProject
///Users/tarena1/Desktop/theFirstObject/TRProject/ViewController/我的/MForthListColltroler.m
//  Created by tarena1 on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MForthListColltroler.h"


@interface MForthListColltroler ()

@property (nonatomic, strong) NSFileManager *fileManger;
@property (weak, nonatomic) IBOutlet UILabel *numberLB;

@end

@implementation MForthListColltroler


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =  kRGBColor(46, 52, 58, 1);
    self.title = @"我";
//    [self.tableView registerClass:[ ] forCellReuseIdentifier:@"MForthViewCell"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}



//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MForthViewCell"];
//    if (indexPath.row == 0) {
//        //收藏
//        
//    }
//    if (indexPath.row == 1) {
//        //清除缓存
////        NSString *cachePath = kCachePath;
////        cell.tag = 1000;  
////        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.lfMB",fabsf([self folderSizeAtPath:cachePath])];
//        
//    }
//    if (indexPath.row == 2) {
//        //观看记录
//    }
//    if (indexPath.row == 3) {
//        //关于我们
//    }
//    return cell;
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(float)folderSizeAtPath:(NSString *)path{
    float folderSize;
    if ([self.fileManger fileExistsAtPath:path]) {
        //SDWebImage框架自身计算缓存的实现
        folderSize+=[[SDImageCache sharedImageCache] getSize];
        return folderSize/1024.0/1024.0;
    }
    return 0;
}

- (NSFileManager *)fileManger {
    if(_fileManger == nil) {
        _fileManger = [NSFileManager defaultManager];
    }
    return _fileManger;
}

@end
