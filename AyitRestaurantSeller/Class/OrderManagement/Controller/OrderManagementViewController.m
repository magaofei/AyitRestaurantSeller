//
//  OrderManagementViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "OrderManagementViewController.h"
#import <Masonry/Masonry.h>

@interface OrderManagementViewController () <UITableViewDataSource, UITableViewDelegate>

//@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UITableView *infoTableView;

@end

@implementation OrderManagementViewController

static NSString *cellName = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.title = @"订单管理";
    [self initSubviews];
}



/**
 初始化子视图
 */
- (void)initSubviews {
    
//    _headerView = [[UIView alloc] init];
//    [self.view addSubview:_headerView];
//    _headerView.backgroundColor = [UIColor purpleColor];
    
    // tableView
    _infoTableView = [[UITableView alloc] init];
    [self.view addSubview:_infoTableView];
//    _infoTableView.backgroundColor = [UIColor whi];
    
    [self layoutSubviews];
    
}

- (void)layoutSubviews {
//    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(40);
//        make.height.equalTo(@50);
//        make.left.right.equalTo(self.view);
//    }];
    
    [_infoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_headerView.mas_bottom).offset(20);
        make.top.equalTo(self.view.mas_top);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


#pragma mark - delegate



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        
    }
    
    // cell setup
    
    
    return cell;
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
