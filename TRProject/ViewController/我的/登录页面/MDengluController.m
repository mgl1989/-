//
//  MDengluController.m
//  TRProject
//
//  Created by tarena1 on 16/8/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MDengluController.h"
#import "MZhuCeController.h"
#import "MForthListColltroler.h"

@interface MDengluController ()

@end

@implementation MDengluController




- (void)viewDidLoad {
    [super viewDidLoad];
//    左边
    UIButton *leftBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBt setImage:[UIImage imageNamed:@"navigationBar_backButton_icon"] forState:UIControlStateNormal];
    leftBt.frame = CGRectMake(0, 0, 40, 40);
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:leftBt];
    self.navigationItem.leftBarButtonItem = leftButton;
    [leftBt bk_addEventHandler:^(id sender) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
//    右边
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:[NSString stringWithFormat:@"注册"] forState:UIControlStateNormal];
//    [button setTitle:@"注册" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 40, 40);
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightButton;
    [button bk_addEventHandler:^(id sender) {
        UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        MZhuCeController *zc = [st instantiateViewControllerWithIdentifier:@"MZhuCeController"];
        [self.navigationController pushViewController:zc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
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
