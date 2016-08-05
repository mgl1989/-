//
//  MThirdViewCell.m
//  TRProject
//
//  Created by tarena1 on 16/7/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MThirdViewCell.h"

@implementation MThirdViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self imageIV];
        [self titleLB];
    }
    return self;
}



- (UIImageView *)imageIV {
    if(_imageIV == nil) {
        _imageIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageIV];
        [_imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(3);
            make.centerY.equalTo(0);
            make.size.equalTo(35);
        }];
//        self.imageIV.contentMode = UIViewContentModeScaleAspectFill;
        self.imageIV.backgroundColor = [UIColor redColor];
        self.imageIV.layer.cornerRadius = 5;
        self.imageIV.clipsToBounds = YES;
    }
    return _imageIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageIV.mas_right).equalTo(3);
            make.centerY.equalTo(0);
            
        }];
        self.titleLB.textColor = [UIColor whiteColor];
        self.titleLB.font = [UIFont systemFontOfSize:18];
    }
    return _titleLB;
}

- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
