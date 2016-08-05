//
//  MSecondViewCell.m
//  TRProject
//
//  Created by tarena1 on 16/7/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MSecondViewCell.h"

@implementation MSecondViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self thumbIV];
        [self titleLB];
        [self sourceLB];
    }
    return self;
}


- (UIImageView *)thumbIV {
    if(_thumbIV == nil) {
        _thumbIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_thumbIV];
        [_thumbIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(90);
        }];
//        _thumbIV.contentMode = UIViewContentModeScaleAspectFill;
        _thumbIV.backgroundColor = [UIColor whiteColor];
        _thumbIV.layer.cornerRadius = 5;
    }
    return _thumbIV;
}



- (UIView *)view {
    if(_view == nil) {
        _view = [[UIView alloc] init];
        [self.contentView addSubview:_view];
        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.thumbIV.mas_bottom).equalTo(0);
            make.left.right.bottom.equalTo(0);
        }];
        _view.backgroundColor = [UIColor blackColor];
//        _view.backgroundColor = kRGBColor(46, 52, 58, 1);
    }
    return _view;
}


- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        [self.view addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.top.equalTo(self.view.mas_top).equalTo(5);
            make.right.equalTo(self.sourceLB.mas_left).equalTo(-3);
        }];
        _titleLB.font = [UIFont systemFontOfSize:12];
        _titleLB.textColor = [UIColor whiteColor];
        [_titleLB sizeToFit];
        _titleLB.numberOfLines = 2;
    }
    return _titleLB;
}

- (UILabel *)sourceLB {
    if(_sourceLB == nil) {
        _sourceLB = [[UILabel alloc] init];
        [self.view addSubview:_sourceLB];
        [_sourceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view.mas_right).equalTo(-3);
            make.centerY.equalTo(0);
            make.width.equalTo(30);
        }];
        _sourceLB.font = [UIFont systemFontOfSize:10];
        _sourceLB.backgroundColor = [UIColor orangeColor];
        _sourceLB.textColor = [UIColor whiteColor];
        _sourceLB.textAlignment = NSTextAlignmentCenter;
        
    }
    return _sourceLB;
}


@end
