//
//  MZhuCeController.m
//  TRProject
//
//  Created by tarena1 on 16/8/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MZhuCeController.h"
#import <SMS_SDK/SMSSDK.h>

@interface MZhuCeController ()
@property (weak, nonatomic) IBOutlet UITextField *iponeNum;
@property (weak, nonatomic) IBOutlet UITextField *securityTF;
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation MZhuCeController


- (IBAction)iponeNumberBt:(UIButton *)sender {
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.iponeNum.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        NSLog(@"%@",error ? error : @"发送验证码成功");
    }];
    
}

- (IBAction)zhuCe:(id)sender {
    [SMSSDK commitVerificationCode:self.securityTF.text phoneNumber:self.iponeNum.text zone:@"86" result:^(NSError *error) {
        NSLog(@"%@", error ? error : @"注册成功" );
    }];   
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
