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

#import "GMNetworking.h"

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
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://112.74.217.134:8080/"]];
    GMNetworking *manager = [GMNetworking sharedManager];
    NSDictionary *para = [[NSDictionary alloc] init];
//    para[@"userId"] = @"1001";
    
//    [para setValue:@"1001" forKey:@"userId"];
    
    para = @{
             @"userId": @"1001" ,
             @"contact": @"宋旭源",
             @"merchantName": @"凯乐个店铺",
             @"phone": @"18337175639",
             @"address": @"北京市昌平区",
             };
    
    
//    [para setValue:@"宋旭源" forKey:@"contact"];
//    [para setValue:@"凯乐个店铺" forKey:@"merchantName"];
//    [para setValue:@"18337175639" forKey:@"phone"];
//    [para setValue:@"北京市昌平区" forKey:@"address"];
    
    [manager GET:@"/server/merchant/merchant/allMerchants" parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _json = responseObject;
        
        GoodsItem *item = [GoodsItem yy_modelWithJSON:_json];
        
        //    NSLog(@"%@", _json);
        NSLog(@"%d", item.success);
        NSLog(@"%@", item.message);
        NSLog(@"%@", item.data);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    
    sleep(1000);
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
