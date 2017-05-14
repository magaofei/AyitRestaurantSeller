//
//  UploadGoodsDescriptionCell.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/5/12.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  上面 UITextField
//  下面 UICollectionView的图片

#import "UploadGoodsDescriptionCell.h"
#import <Masonry/Masonry.h>

#import "PhotoCollectionViewCell.h"


static NSString *photoCellName = @"photoCell";

@implementation UploadGoodsDescriptionCell



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
    
    _descriptionTextField = [[UITextField alloc] init];
    _descriptionTextField.placeholder = @"描述一下商品";
    [self addSubview:_descriptionTextField];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _photoCollectionView = [[UICollectionView alloc] init];
    [_photoCollectionView setCollectionViewLayout:layout];
    [_photoCollectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:photoCellName];
    

    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
    [_descriptionTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(10);
    }];
}

@end
