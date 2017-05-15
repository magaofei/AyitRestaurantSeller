//
//  OrderManagementViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "OrderManagementViewController.h"
#import "OrderTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

#import "OrderDetailViewController.h"
@interface OrderManagementViewController () <UISearchBarDelegate,UISearchResultsUpdating>

//@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UISearchController *orderSearchController;

//@property (nonatomic, strong) UITableView *infoTableView;

@end

@implementation OrderManagementViewController

static NSString *cellName = @"orderManagementCell";

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
    self.tableView.rowHeight = 130;
//    _headerView = [[UIView alloc] init];
//    [self.view addSubview:_headerView];
//    _headerView.backgroundColor = [UIColor purpleColor];
    
    // tableView
//    _infoTableView = [[UITableView alloc] init];
//    [self.view addSubview:_infoTableView];
//    _infoTableView.backgroundColor = [UIColor whi];
    
    
    
//    _orderSearchBar = [[UISearchBar alloc] init];
//    _orderSearchBar.barStyle = UIBarStyleBlack;
//    self.navigationItem.titleView = _orderSearchBar;
//    [self.view addSubview:_orderSearchBar];
    
    self.orderSearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.orderSearchController.searchBar.delegate = self;
    self.orderSearchController.searchResultsUpdater = self;
    self.tableView.tableHeaderView = self.orderSearchController.searchBar;
    
    
    
    
    [self layoutSubviews];
    
}


#pragma mark - TODO: 修改tableView的Y值
- (void)layoutSubviews {
    
    
//    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(40);
//        make.height.equalTo(@50);
//        make.left.right.equalTo(self.view);
//    }];
    
//    [_orderSearchBar mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top);
//        make.bottom.equalTo(_infoTableView.mas_top);
//        make.left.right.equalTo(self.view);
//    }];
//    
//    [_infoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(_headerView.mas_bottom).offset(20);
////        make.top.equalTo(self.view.mas_top);
//        make.left.right.equalTo(self.view);
//        make.bottom.equalTo(self.view.mas_bottom);
//    }];
    
    
    
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
    
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[OrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        
    }
    
    [self testCellData:cell];
    
    // cell setup
    
    
    return cell;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 取消键盘
//    [_orderSearchBar endEditing:YES];
//    NSLog(@"%s", __func__);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选择
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OrderDetailViewController *orderDetailVC = [[OrderDetailViewController alloc] init];
    orderDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:orderDetailVC animated:YES];
    
}

-(void)testCellData:(OrderTableViewCell *)cell {
    cell.nameLabel.text = @"联系人:李俊龙";
    
    [cell.goodsIcon sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494432738193&di=a6914591e7ae349f081ac2f6fcd9899b&imgtype=0&src=http%3A%2F%2Fwww.qinzh.com%2Fuploads%2Fallimg%2F141025%2F01321591b_0.jpg"]];
    cell.phoneLabel.text = @"手机号:19603822432";
    cell.goodsTitleLabel.text = @"红烧带鱼+米饭+豆角茄子";
    cell.orderTimeLabel.text = @"2017.04.12 12:30:02";
    cell.goodsPriceLabel.text = @"¥21.50";
    cell.orderStatusLabel.text = @"状态:已接受";
    
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
