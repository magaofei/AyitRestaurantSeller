//
//  TabBarViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "TabBarViewController.h"

#import "UploadGoodsViewController.h"
#import "GoodsManagementViewController.h"
#import "OrderManagementViewController.h"
#import "PersonalViewController.h"


@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initAllViewController];
}

- (void)initAllViewController {
    PersonalViewController *personalVC = [[PersonalViewController alloc] init];
    UploadGoodsViewController *uploadgoodsVC = [[UploadGoodsViewController alloc] init];
    GoodsManagementViewController *goodsManagementVC = [[GoodsManagementViewController alloc] init];
    OrderManagementViewController *orderManagementVC = [[OrderManagementViewController alloc] init];
    
    orderManagementVC.tabBarItem.title = @"订单管理";
    uploadgoodsVC.tabBarItem.title = @"上传商品";
    goodsManagementVC.tabBarItem.title = @"商品管理";
    personalVC.tabBarItem.title = @"我";
    
    orderManagementVC.tabBarItem.image = [UIImage imageNamed:@"orderManagement"];
    uploadgoodsVC.tabBarItem.image = [UIImage imageNamed:@"uploadgoods"];
    goodsManagementVC.tabBarItem.image = [UIImage imageNamed:@"goodsManagement"];
    personalVC.tabBarItem.image = [UIImage imageNamed:@"personal"];
    
    
    
    UINavigationController *orderManagementNav = [[UINavigationController alloc]
                                                  initWithRootViewController:orderManagementVC];
    
    UINavigationController *uploadGoodsNav = [[UINavigationController alloc]
                                              initWithRootViewController:uploadgoodsVC];
    UINavigationController *goodsManagementNav = [[UINavigationController alloc] initWithRootViewController:goodsManagementVC];
    
#pragma mark - TODO : 下一步 ,把上传商品页面改为 present调起 
    
    UINavigationController *personalNav = [[UINavigationController alloc]
                                           initWithRootViewController:personalVC];
    
    [self addChildViewController:orderManagementNav];
    [self addChildViewController:uploadGoodsNav];
    [self addChildViewController:goodsManagementNav];
    [self addChildViewController:personalNav];
    
    //    MyBlogViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"blogViewController"];

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
