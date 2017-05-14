//
//  PhotoCollectionViewCell.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/5/12.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

#import <Masonry/Masonry.h>

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

- (void)initSubviews {
    _photoImageView = [[UIImageView alloc] init];
    [self addSubview:_photoImageView];
    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
    [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.right.bottom.equalTo(self);
    }];
    
}

@end
