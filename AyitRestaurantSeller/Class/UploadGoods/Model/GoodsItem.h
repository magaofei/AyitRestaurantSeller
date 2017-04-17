//
//  GoodsItem.h
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/15.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GoodsItemData;

@interface GoodsItem : NSObject

@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) NSString *message;

@property (nonatomic, strong) GoodsItemData *data;


@end
