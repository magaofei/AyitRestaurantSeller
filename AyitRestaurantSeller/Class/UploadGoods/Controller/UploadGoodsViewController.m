
//
//  UploadGoodsViewController
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  上传商品界面
//  流程:
//  图片上传接口单独, 发布和修改接口单独, 先发布, 再修改并将上传后的图片路径传送

#import "UploadGoodsViewController.h"

#import <Masonry/Masonry.h>

@interface UploadGoodsViewController () <UITextViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UITextField *inputTitleTextField;

@property (nonatomic, strong) UITextView *descriptionTextView;


/**
 分割线
 */
@property (nonatomic, strong) UIView *partingLineView;

@property (nonatomic, strong) UIButton *uploadPhotoButton;

/**
 确认发布按钮
 */
@property (nonatomic, strong) UIButton *submitPublishButton;


@end

@implementation UploadGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = @"上传商品";
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];

    
    [self initSubviews];
    
}

- (void)initSubviews {
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    
    
    _scrollView.contentSize = CGSizeMake(width, height + height/3);
    _scrollView.frame = CGRectMake(0, 0, width, height);
    //  根据滑动隐藏键盘
    _scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    _scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_scrollView];
    
    _inputTitleTextField = [[UITextField alloc] init];
    _inputTitleTextField.placeholder = @"请输入标题";
    _inputTitleTextField.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_inputTitleTextField];
    
    _partingLineView = [[UIView alloc] init];
    _partingLineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_partingLineView];
    
    _descriptionTextView = [[UITextView alloc] init];
    _descriptionTextView.backgroundColor= [UIColor whiteColor];
    _descriptionTextView.text = @"描述一下你的商品";
    _descriptionTextView.textColor = [UIColor darkGrayColor];
    _descriptionTextView.font = [UIFont systemFontOfSize:15];
    _descriptionTextView.delegate = self;
    [self.view addSubview:_descriptionTextView];
    
    _uploadPhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_uploadPhotoButton];
    [_uploadPhotoButton setTitle:@"+添加图片" forState:UIControlStateNormal];
    _uploadPhotoButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_uploadPhotoButton setBackgroundColor:[UIColor colorWithRed: 230.0/255.0 green: 230.0/255.0 blue: 230.0/255.0 alpha: 1.0]];
    [_uploadPhotoButton setTitleColor:[UIColor colorWithRed: 127.0/255.0 green: 127.0/255.0 blue: 127.0/255.0 alpha: 1.0] forState:UIControlStateNormal];
    
    
    
    _submitPublishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_submitPublishButton];
    [_submitPublishButton setTitle:@"确认发布" forState:UIControlStateNormal];
    [_submitPublishButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 171.0/255.0 blue: 10.0/255.0 alpha: 1.0]];
    [_submitPublishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
//    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(64);
//        make.left.right.bottom.equalTo(self.view);
//        
//    }];
    
    [_inputTitleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(70);
        make.left.equalTo(_scrollView.mas_left).offset(15);
        make.right.equalTo(_scrollView.mas_right).offset(-15);
        
    }];
    
    [_partingLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_inputTitleTextField.mas_bottom).offset(5);
        make.left.equalTo(_scrollView.mas_left).offset(15);
        make.right.equalTo(_scrollView.mas_right).offset(-15);
        make.height.equalTo(@1);
    }];
    
    [_descriptionTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_partingLineView.mas_bottom).offset(5);
        make.left.equalTo(_scrollView.mas_left).offset(15);
        make.right.equalTo(_scrollView.mas_right).offset(-15);
        make.height.equalTo(@100);
    }];
    
    [_uploadPhotoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_descriptionTextView.mas_bottom).offset(10);
        make.left.equalTo(_scrollView.mas_left).offset(15);
        make.width.height.equalTo(@80);
    }];
    
    [_submitPublishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_uploadPhotoButton.mas_bottom).offset(30);
        make.left.equalTo(_scrollView.mas_left).offset(15);
        make.right.equalTo(_scrollView.mas_right).offset(-15);
    }];
    
}


#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"描述一下你的商品";
        textView.textColor = [UIColor grayColor];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"描述一下你的商品"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
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
