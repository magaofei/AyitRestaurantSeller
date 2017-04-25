//
//  GoodsItemMessage.h
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/15.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsItemData : NSObject
@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *contact;

@property (nonatomic, strong) NSString *merchantName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) BOOL open;

@end
