//
//  MFirstListViewCell.m
//  TRProject
//
//  Created by tarena1 on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MFirstListViewCell.h"

@implementation MFirstListViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self spaceNameOnYoukuLB];
        [self logImgUrlIV];
        [self lastUpdateLB];
        [self videoCountLB];
    }
    return self;
}





- (UIImageView *)logImgUrlIV {
    if(_logImgUrlIV == nil) {
        _logImgUrlIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_logImgUrlIV];
        [_logImgUrlIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.centerY.equalTo(0);
            make.size.equalTo(52);
        }];
        _logImgUrlIV.layer.cornerRadius = 26;
        _logImgUrlIV.clipsToBounds = YES;
    }
    return _logImgUrlIV;
}

- (UILabel *)spaceNameOnYoukuLB {
    if(_spaceNameOnYoukuLB == nil) {
        _spaceNameOnYoukuLB = [[UILabel alloc] init];
        [self.contentView addSubview:_spaceNameOnYoukuLB];
        [_spaceNameOnYoukuLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.logImgUrlIV.mas_right).equalTo(8);
            make.top.equalTo(self.logImgUrlIV.mas_top).equalTo(3);
           
        }];
        _spaceNameOnYoukuLB.textColor = [UIColor whiteColor];
        _spaceNameOnYoukuLB.font = [UIFont systemFontOfSize:18];
    }
    return _spaceNameOnYoukuLB;
}

- (UILabel *)lastUpdateLB {
    if(_lastUpdateLB == nil) {
        _lastUpdateLB = [[UILabel alloc] init];
        [self.contentView addSubview:_lastUpdateLB];
        [_lastUpdateLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.logImgUrlIV.mas_bottom).equalTo(-3);
            make.left.equalTo(self.logImgUrlIV.mas_right).equalTo(8);
        }];
        _lastUpdateLB.textColor = [UIColor whiteColor];
        _lastUpdateLB.font = [UIFont systemFontOfSize:12];
    }
    return _lastUpdateLB;
}

- (UILabel *)videoCountLB {
    if(_videoCountLB == nil) {
        _videoCountLB = [[UILabel alloc] init];
        [self.contentView addSubview:_videoCountLB];
        [_videoCountLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-8);
            make.centerY.equalTo(0);
           
        }];
        _videoCountLB.font = [UIFont systemFontOfSize:14];
        _videoCountLB.textColor = [UIColor lightGrayColor];
    }
    return _videoCountLB;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}








@end
