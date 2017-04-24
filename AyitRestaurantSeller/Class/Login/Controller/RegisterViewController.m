//
//  RegisterViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/10.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.

//  {"success":true,"message":"创建成功","data":{"id":"58e2f6df984c0d5ce0ddf58f","userId":"1001","contact":"宋旭源","merchantName":"开了个店铺","createTime":null,"phone":"18337175639","address":"北京市昌平区龙锦苑东四区","serviceTime":null,"discount":null,"licenseImgs":null,"showImgs":null,"logoImg":null,"open":false}}

#import "RegisterViewController.h"

// 用户id
// 联系人
// 商家名称
// 商家电话
// 商家地址
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
