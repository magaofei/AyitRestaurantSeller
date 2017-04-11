//
//  PersonalViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  信息管理

#import "PersonalViewController.h"

#import <Masonry/Masonry.h>


@interface PersonalViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *infoTableView;

// 列表信息
@property (nonatomic, copy) NSArray *listArr;


@end

@implementation PersonalViewController
static NSString *infoCell = @"infoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"信息管理";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listArr = @[@"联系方式", @"地址", @"退出"];
    
    [self initSubviews];
    
    [self initCell];
    
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
//    _infoTableView.backgroundColor = [UIColor blueColor];
    self.infoTableView.delegate = self;
    self.infoTableView.dataSource = self;
    
    self.infoTableView.rowHeight = 50;
    
    [self layoutSubviews];
    
}

/**Cell */
- (void)initCell {
    
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
    return self.listArr.count;
}


#pragma mark - delegate



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infoCell];
        
    }
    
    
    
    cell.textLabel.text = self.listArr[indexPath.row];

    
    
    
    // cell setup
    
    
    return cell;
}

// 取消选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.infoTableView deselectRowAtIndexPath:indexPath animated:YES];
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
