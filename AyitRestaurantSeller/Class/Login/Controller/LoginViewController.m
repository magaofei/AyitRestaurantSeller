//
//  LoginViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "TabBarViewController.h"
#import "LoginViewController.h"
#import <Masonry/Masonry.h>

@interface LoginViewController ()

@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIImageView *tipImageView;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIActivityIndicatorView *loadingIndicatorView;
@property (nonatomic, strong) UILabel *accountLabel;
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UIImageView *iconLogoView;
@property (nonatomic, strong) UIView *loginInfoView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"用户登录";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置界面
    [self initSubviews];
}


/**
 子界面
 */
- (void)initSubviews {
    // 帐号  密码 框
    // 登录按钮
    
    [self initWidget];
 
    
    
    
    
    _tipLabel.hidden = YES;
    _tipImageView.hidden = YES;
    //默认隐藏
    [_loadingIndicatorView stopAnimating];
}

- (void)initWidget {
    /**
     登录按钮框
     */
    _loginButton = [[UIButton alloc] init];
    UIImage *buttonBgImage = [[UIImage imageNamed:@"button-green"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    [_loginButton setBackgroundImage:buttonBgImage forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:buttonBgImage forState:UIControlStateHighlighted];
    [_loginButton setBackgroundImage:buttonBgImage forState:UIControlStateDisabled];
    [_loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    [_loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _loginInfoView = [[UIView alloc] init];
    [self.view addSubview:_loginInfoView];
    
    
    // 帐号Label
    _accountLabel = [[UILabel alloc] init];
    _accountLabel.text = @"帐号:";
    [_loginInfoView addSubview:_accountLabel];
    
    // 密码Label
    _passwordLabel = [[UILabel alloc] init];
    _passwordLabel.text = @"密码:";
    [_loginInfoView addSubview:_passwordLabel];
    
    // 帐号输入
    
    _accountTextField = [[UITextField alloc] init];
    _accountTextField.placeholder = @"请输入帐号";
    _accountTextField.borderStyle = UITextBorderStyleRoundedRect;
    [_loginInfoView addSubview:_accountTextField];
    // 密码输入
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    [_loginInfoView addSubview:_passwordTextField];
    
    
    // 提示info
    _tipImageView = [[UIImageView alloc] init];
    _tipImageView.image = [UIImage imageNamed:@"icon-info"];
    [self.view addSubview:_tipImageView];
    
    
    // 提示文字
    _tipLabel = [[UILabel alloc] init];
    [self.view addSubview:_tipLabel];
    
    
    // Logo
    _iconLogoView = [[UIImageView alloc] init];
#pragma mark - TODO: logo
    _iconLogoView.image = nil;
    [self.view addSubview:_iconLogoView];
    
    _loadingIndicatorView = [[UIActivityIndicatorView alloc] init];
    
    
    [self layoutWidget];
}

- (void)layoutWidget {
    // Logo
    [_iconLogoView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 高度宽度
        // 中心X
        // 距离顶部35点
        make.width.height.equalTo(@94);
        make.centerX.equalTo(self.view);
        make.topMargin.equalTo(self.view).offset(35+44+20);
        
    }];
    
    // 帐号密码View
    [_loginInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconLogoView.mas_bottom).offset(55);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.height.equalTo(@80);
    }];
    
    // 帐号Label
    [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginInfoView.mas_left);
        make.top.equalTo(_loginInfoView.mas_top);
//        make.right.equalTo(_accountTextField.mas_left).offset(-10);
    }];
    
    // 帐号TextField
    
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginInfoView.mas_top);
        make.right.equalTo(_loginInfoView.mas_right).offset(-10);
        make.left.equalTo(_accountLabel.mas_right).offset(20);
//        make.centerY.equalTo(_accountLabel.mas_centerY);
        
    }];
    
    // 密码Label
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginInfoView.mas_left);
        make.bottom.equalTo(_loginInfoView.mas_bottom).offset(-10);
        // 不知为什么这里不加宽度会加长
        make.width.equalTo(@40);
        
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_loginInfoView.mas_bottom);
        make.right.equalTo(_loginInfoView.mas_right).offset(-10);
        make.left.equalTo(_passwordLabel.mas_right).offset(20);
//        make.centerY.equalTo(_passwordLabel.mas_centerY);
    }];
    
   
    
    
    // 密码TextField
    
    // 登录按钮
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(_loginInfoView.mas_bottom).offset(90);
        make.height.equalTo(@36);
//        make.centerX
    }];
    
    
    
    // tipInfo
    // tipText
    
    

}

//当登陆按钮被按下
- (void)loginButtonPressed {
    NSLog(@"Login button pressed");
}

#pragma mark - 登录请求
- (BOOL)cancelLogin{
    //用户名admin  密码test
    if ([_accountTextField.text isEqualToString:@"admin"] && [_passwordTextField.text isEqualToString:@"test"]) {
        //验证成功
        [self showMainTabBarViewController];//跳转
        _tipLabel.hidden = YES;
        _tipImageView.hidden = YES;
        return YES;  //验证成功
    } else {
        NSString *errorTip = @"";
        if (_accountTextField.text.length == 0) {
            errorTip = @"请输入用户名";
        } else if (_passwordTextField.text.length == 0) {
            errorTip = @"请输入密码";
        } else {
            errorTip = @"用户名或密码输入有误";
        }
        _tipImageView.hidden = NO;
        _tipLabel.hidden = NO;
        [_tipLabel setText:errorTip];
        
    }
    return NO;
    
    
}
- (void)loginButtonAction {
    //关闭键盘
    [self.view endEditing:YES];
    
    //显示
    [_loadingIndicatorView startAnimating];
    [_loginButton setEnabled:NO];
    [_loadingIndicatorView setAlpha:0.5f]; //0.5的透明度
    [UIView animateWithDuration:1.f animations:^{
        [_loadingIndicatorView setAlpha:1.f];  //1透明度
    } completion:^(BOOL finished) {//当动画完成
        [_loadingIndicatorView stopAnimating];  //结束动画
        [_loginButton setEnabled:YES];
        [self cancelLogin]; //当动画完成调用
    }];
    
    
    
    
}



- (void)loginAction {
    if ([self cancelLogin]) {
        
        NSLog(@"登录成功");
    } else {
        [self loginButtonAction];
        
        NSLog(@"登录失败");
    }
}

- (void)showMainTabBarViewController {
    // 创建TabBarViewController 并跳转
    TabBarViewController *tabBarVC = [[TabBarViewController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //关闭键盘
    [self.view endEditing:YES];
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
