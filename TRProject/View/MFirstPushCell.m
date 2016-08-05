//
//  MFirstPushCell.m
//  TRProject
//
//  Created by tarena1 on 16/7/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MFirstPushCell.h"

@implementation MFirstPushCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self thumbIV];
        [self titleLB];
        [self dateLB];
        [self timeLB];
    }
    return self;
}
  

- (UIImageView *)thumbIV {
    if(_thumbIV == nil) {
        _thumbIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_thumbIV];
        [self.thumbIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(3);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(50, 40));
        }];
//        self.thumbIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _thumbIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.thumbIV.mas_right).equalTo(8);
            make.top.equalTo(self.thumbIV.mas_top).equalTo(1);
            make.size.equalTo(CGSizeMake(250, 30));
        }];
        _titleLB.font = [UIFont systemFontOfSize:12];
        _titleLB.textColor = [UIColor whiteColor];
        _titleLB.numberOfLines = 0;
//        _titleLB.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLB;
}

- (UILabel *)dateLB {
    if(_dateLB == nil) {
        _dateLB = [[UILabel alloc] init];
        [self.contentView addSubview:_dateLB];
        [_dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLB.mas_left);
            make.bottom.equalTo(self.thumbIV.mas_bottom).equalTo(0);
        }];
        _dateLB.font = [UIFont systemFontOfSize:10];
        _dateLB.textColor = [UIColor lightGrayColor];
    }
    return _dateLB;
}


- (UILabel *)timeLB {
    if(_timeLB == nil) {
        _timeLB = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLB];
        [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dateLB.mas_right).equalTo(15);
            make.bottom.equalTo(self.dateLB.mas_bottom).equalTo(0);
           
        }];
        _timeLB.font = [UIFont systemFontOfSize:10];
        _timeLB.textColor = [UIColor lightGrayColor];
    }
    return _timeLB;
}

- (void)awakeFromNib {
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
