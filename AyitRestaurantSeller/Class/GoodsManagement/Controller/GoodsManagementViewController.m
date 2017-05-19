//
//  GoodsManagementViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/16.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GoodsManagementViewController.h"
#import "GoodsManagementTableViewCell.h"
#import "OrderItem.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <MJRefresh/MJRefresh.h>

@interface GoodsManagementViewController () <UISearchBarDelegate,UISearchResultsUpdating>

//@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UISearchController *orderSearchController;

@end

static NSString *cellName = @"goodsManagementCell";
@implementation GoodsManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"商品管理";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSubviews];
}

/**
 初始化子视图
 */
- (void)initSubviews {
    
    self.tableView.rowHeight = 100;
    self.orderSearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.orderSearchController.searchBar.delegate = self;
    self.orderSearchController.searchResultsUpdater = self;
//    self.tableView.tableHeaderView = self.orderSearchController.searchBar;
    
    // 用来方式SearchBar错位
    self.definesPresentationContext = YES;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
    
    [self layoutSubviews];
    
}

- (void) layoutSubviews {
    
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
    
    GoodsManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[GoodsManagementTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        
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
    
//    OrderDetailViewController *orderDetailVC = [[OrderDetailViewController alloc] init];
//    orderDetailVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:orderDetailVC animated:YES];
    
}

-(void)testCellData:(GoodsManagementTableViewCell *)cell {
    //    cell.nameLabel.text = @"联系人:李俊龙";
    
    [cell.commodityIconImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494480859592&di=0aa9752d65bb0d0a21922333a5615ac5&imgtype=0&src=http%3A%2F%2Fpic.syd.com.cn%2F0%2F101%2F21%2F05%2F101210514_000000003dc9cb4c.jpg"]];
    //    cell.phoneLabel.text = @"手机号:19603822432";
    cell.commodityTitleLabel.text = @"红烧带鱼+米饭+豆角茄子";
//    cell.orderTimeLabel.text = @"2017.04.12 12:30:02";
    cell.commodityPriceLabel.text = @"¥21";
    cell.commodityStatusLabel.text = @"正常销售中";
    
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
