//
//  MShipingTableViewCell.m
//  TRProject
//
//  Created by tarena1 on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MShipingTableViewCell.h"

@implementation MShipingTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        [self videoName];
//        [self videoUpdate];
//        [self videoScreenShot];
//        [self videoLength];
    }
    return self;
}



#pragma mark -  Lazyload(懒加载)

- (UIImageView *)videoScreenShot {
    if(_videoScreenShot == nil) {
        _videoScreenShot = [[UIImageView alloc] init];
        [self.contentView addSubview:self.videoScreenShot];
        [self.videoScreenShot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.videoName.mas_left).equalTo(0);
            make.top.equalTo(self.videoName.mas_bottom).equalTo(3);
            make.size.equalTo(CGSizeMake(110, 70));
        }];
        self.videoScreenShot.layer.cornerRadius = 5;
        self.videoScreenShot.clipsToBounds = YES;
       
    }
    return _videoScreenShot;
}

- (UILabel *)videoUpdate {
    if(_videoUpdate == nil) {
        _videoUpdate = [[UILabel alloc] init];
        [self.contentView addSubview:_videoUpdate];
        [_videoUpdate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.videoScreenShot.mas_bottom).equalTo(0);
            make.left.equalTo(self.videoLength.mas_left).equalTo(0);
            make.size.equalTo(CGSizeMake(250, 30));
        }];
        _videoUpdate.font = [UIFont systemFontOfSize:14];
        _videoUpdate.textColor = [UIColor lightGrayColor];
    }
    return _videoUpdate;
}

- (UILabel *)videoLength {
    if(_videoLength == nil) {
        _videoLength = [[UILabel alloc] init];
        [self.contentView addSubview:_videoLength];
        [_videoLength mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.videoScreenShot.mas_top).equalTo(0);
            make.left.equalTo(self.videoScreenShot.mas_right).equalTo(15);
            make.size.equalTo(CGSizeMake(200, 30));
        }];
        
        _videoLength.font = [UIFont systemFontOfSize:14];
        _videoLength.textColor = [UIColor lightGrayColor];
    }
    return _videoLength;
}

- (UILabel *)videoName {
    if(_videoName == nil) {
        _videoName = [[UILabel alloc] init];
        [self.contentView addSubview:_videoName];
        [_videoName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(3);
            make.left.equalTo(18);
            make.size.equalTo(CGSizeMake(300, 30));
        }];
        _videoName.font = [UIFont systemFontOfSize:16];
        _videoName.textColor = [UIColor whiteColor];
    }
    return _videoName;
}


@end
