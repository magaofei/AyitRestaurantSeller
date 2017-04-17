//
//  AyitRestaurantSellerTests.m
//  AyitRestaurantSellerTests
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <YYModel/YYModel.h>
#import "GoodsItem.h"

#import <AFNetworking/AFNetworking.h>

@interface AyitRestaurantSellerTests : XCTestCase

@property (nonatomic, strong) NSString *json;

@end

@implementation AyitRestaurantSellerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
//    _json = @"http://192.168.31.227:8080/server/merchant/merchant/insert?userId=1001&contact=宋旭源&merchantName=开了个店铺&phone=18337175639&address=北京市昌平区龙锦苑东四区";
//    _json = @"{\"success\":true,\"message\":\"创建成功\",\"data\":{\"id\":\"58f1cbe63a1fe57efc11b7ea\",\"userId\":\"1001\",\"contact\":\"宋旭源\",\"merchantName\":\"开了个店铺\",\"createTime\":null,\"phone\":\"18337175639\",\"address\":\"北京市昌平区龙锦苑东四区\",\"serviceTime\":null,\"discount\":null,\"licenseImgs\":null,\"showImgs\":null,\"logoImg\":null,\"open\":false}}";
    
    
    
}

- (void)testYYModel {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://192.168.31.227:8080/server/merchant/merchant/insert?userId=1001&contact=宋旭源&merchantName=开了个店铺&phone=18337175639&address=北京市昌平区龙锦苑东四区" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _json = responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    GoodsItem *item = [GoodsItem yy_modelWithJSON:_json];
//    NSLog(@"%@", _json);
    NSLog(@"%@", item);
    
    sleep(100);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
