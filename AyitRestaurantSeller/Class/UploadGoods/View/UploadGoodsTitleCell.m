//
//  UploadGoodsTitleCell.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/5/12.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "UploadGoodsTitleCell.h"
#import <Masonry/Masonry.h>

@implementation UploadGoodsTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initSubviews];
    }
    
    
    return self;
}


- (void)initSubviews {
    
//    _inputLabel = [[UILabel alloc] init];
//    [self addSubview:_inputLabel];
    
    _inputTextField = [[UITextField alloc] init];
    _inputTextField.borderStyle = UITextBorderStyleNone;
    _inputTextField.placeholder = @"标题 菜品标题";
    
    [self addSubview:_inputTextField];
    
    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
//    [_inputLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.mas_left).offset(15);
//        make.top.equalTo(self.mas_top).offset(5);
//        make.bottom.equalTo(self.mas_top).offset(-5);
//        
//    }];
//    
//    [_inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_inputLabel.mas_right).offset(15);
//        make.centerY.equalTo(_inputLabel.mas_centerY);
//    }];
    
    [_inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
}

@end
