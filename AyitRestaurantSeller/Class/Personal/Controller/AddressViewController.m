//
//  AddressViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/16.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  TextView

#import "AddressViewController.h"

@interface AddressViewController ()

@property (nonatomic, strong) UITextView *addressTextView;

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"修改地址";
    
    [self initSubviews];
    
    [self loadData];
}


/**
 从服务器获取之前地址信息
 */
- (void)loadData {
    
}

- (void)initSubviews {
    _addressTextView = [[UITextView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_addressTextView];
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
