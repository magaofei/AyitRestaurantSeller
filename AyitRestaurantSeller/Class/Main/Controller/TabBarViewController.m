//
//  TabBarViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "TabBarViewController.h"

#import "UploadGoodsViewController.h"
#import "OrderManagementViewController.h"
#import "PersonalViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)initAllViewController {
    PersonalViewController *personalVC = [[PersonalViewController alloc] init];
    UploadGoodsViewController *uploadgoodsVC = [[UploadGoodsViewController alloc] init];
    OrderManagementViewController *orderManagementVC = [[OrderManagementViewController alloc] init];
    
    
    UINavigationController *orderManagementNav = [[UINavigationController alloc]
                                                  initWithRootViewController:orderManagementVC];
    
    UINavigationController *uploadGoodsNav = [[UINavigationController alloc]
                                              initWithRootViewController:uploadgoodsVC];
    
    UINavigationController *personalNav = [[UINavigationController alloc]
                                           initWithRootViewController:personalVC];
    
    [self addChildViewController:orderManagementNav];
    [self addChildViewController:uploadGoodsNav];
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
