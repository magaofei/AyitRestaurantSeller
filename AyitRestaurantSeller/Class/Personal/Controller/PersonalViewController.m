//
//  PersonalViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  信息管理

#import "PersonalViewController.h"

#import <Masonry/Masonry.h>
#import "LoginViewController.h"

#import "AddressViewController.h"
#import "ContactInformationViewController.h"

@interface PersonalViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *infoTableView;

@property (nonatomic, strong) UIButton *exitButton;

// 列表信息
@property (nonatomic, copy) NSArray *listArr;

@property (nonatomic, copy) NSArray *dataArr;


@end

@implementation PersonalViewController
static NSString *infoCell = @"infoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"信息管理";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listArr = @[@"联系方式", @"地址"];
    self.dataArr = @[@"18603822757", @"校园第一餐厅"];
    
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
    
    _exitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_exitButton setTitle:@"退出" forState:UIControlStateNormal];
    [_exitButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 120.0/255.0 blue: 102.0/255.0 alpha: 1.0]];
    [_exitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_exitButton addTarget:self action:@selector(exitAction) forControlEvents:UIControlEventTouchUpInside];
    
    

    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    [footView addSubview:_exitButton];
    
    [_exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footView.mas_top).offset(5);
        make.centerX.equalTo(footView.mas_centerX);
        make.bottom.equalTo(footView.mas_bottom).offset(-5);
        make.width.equalTo(footView.mas_width).multipliedBy(0.9);
        
    }];
    
    _infoTableView.tableFooterView = footView;
    
    
    
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"联系方式";
    } else if (section == 1) {
        return @"地址";
    } else {
        return @"";
    }
}

#pragma mark - delegate



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:infoCell];
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    
//    cell.textLabel.text = self.listArr[indexPath.section];
//    cell.detailTextLabel.text = self.dataArr[indexPath.section];
    cell.textLabel.text = self.dataArr[indexPath.section];
    
    
    
    // cell setup
    
    
    return cell;
}

// 取消选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.infoTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 跳转
//     indexPath.section
    
    
    if (indexPath.section == 0) {
        ContactInformationViewController *contactVC = [[ContactInformationViewController alloc] init];
        contactVC.phoneStr = self.dataArr[indexPath.section];
        [self.navigationController pushViewController:contactVC animated:YES];
        
    } else if (indexPath.section == 1) {
        AddressViewController *addressVC = [[AddressViewController alloc] init];
        addressVC.addressStr = self.dataArr[indexPath.section];
        [self.navigationController pushViewController:addressVC animated:YES];
        
    }
    
    
}

- (void)exitAction {
    
    /**
     提示框, 提示用户是否退出
     */
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否退出" message:@"退出将清除登录状态信息" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *backLoginAction = [UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 清理登录信息
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"id"];
        
        // 创建ViewController 进入登录界面
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        
        [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:backLoginAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
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
