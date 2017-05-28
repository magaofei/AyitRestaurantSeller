
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

#import <SVProgressHUD/SVProgressHUD.h>
#import <Masonry/Masonry.h>
#import <Photos/Photos.h>

#import "GMHTTPNetworking.h"
#import <TZImagePickerController/TZImagePickerController.h>


@interface UploadGoodsViewController () <UITextViewDelegate, UIScrollViewDelegate, TZImagePickerControllerDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UITextField *inputTitleTextField;

@property (nonatomic, strong) UITextView *descriptionTextView;

@property (nonatomic, strong) UITextField *commodityPriceTextField;

//@property (nonatomic, strong) UIImagePickerController *imagePicker;


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
    _inputTitleTextField.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_inputTitleTextField];
    
    _partingLineView = [[UIView alloc] init];
    _partingLineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_partingLineView];
    
    _commodityPriceTextField = [[UITextField alloc] init];
    _commodityPriceTextField.keyboardType = UIKeyboardTypeNumberPad;
    _commodityPriceTextField.placeholder = @"请输入价格";
    _commodityPriceTextField.textColor = [UIColor colorWithRed: 255.0/255.0 green: 0.0/255.0 blue: 0.0/255.0 alpha: 1.0];
    [self.view addSubview:_commodityPriceTextField];
    
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
    [_uploadPhotoButton addTarget:self action:@selector(albumAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _submitPublishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_submitPublishButton];
    [_submitPublishButton setTitle:@"确认发布" forState:UIControlStateNormal];
    [_submitPublishButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 171.0/255.0 blue: 10.0/255.0 alpha: 1.0]];
    [_submitPublishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_submitPublishButton addTarget:self action:@selector(submitPublishAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
//    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(64);
//        make.left.right.bottom.equalTo(self.view);
//        
//    }];
    
    [_inputTitleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(20);
        make.left.equalTo(_scrollView.mas_left).offset(15);
        make.right.equalTo(_scrollView.mas_right).offset(-15);
    }];
    
    [_partingLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_inputTitleTextField.mas_bottom).offset(5);
        make.left.equalTo(_scrollView.mas_left).offset(15);
        make.right.equalTo(_scrollView.mas_right).offset(-15);
        make.height.equalTo(@1);
    }];
    [_commodityPriceTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_partingLineView.mas_bottom).offset(15);
        make.left.equalTo(_scrollView.mas_left).offset(15);
        make.right.equalTo(_scrollView.mas_right).offset(-15);
    }];
    
    [_descriptionTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityPriceTextField.mas_bottom).offset(15);
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


/**
 调起相册
 */
- (void)albumAction {
    //UIImagePickerController 属于UIKit
//    _imagePicker = [[UIImagePickerController alloc] init];
//    
//    // 若设备支持相机，使用拍照功能；否则从照片库中选择
////    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
////        
////        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
////    } else {
////        
////        _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
////    }
//    
//    _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//    
//    _imagePicker.delegate = self; //设置委托，
//    
//    _imagePicker.allowsEditing = YES;//允许拍照完对照片进行裁剪
//    
////    [self presentViewController:_imagePicker animated:YES completion:nil];
//    
//    //获得所有智能相册
//    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
//    //列出所有智能相册，此时smartAlbums保存是各个智能相册对应的PHAssetCollection
////    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
//    PHAsset *asset = [[PHAsset alloc] init];
//    for (NSInteger i = 0; i < smartAlbums.count; i ++) {
//        //从中获取一相册
//        PHCollection *collection = smartAlbums[i];
//        if ([collection isKindOfClass:[PHAssetCollection class]]) {
//            //判断是否是PHAssetCollection类
//            PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
//            //从每个智能相册中获取资源集合,可以看做是PHAsset的集合
//            PHFetchResult *photoSet = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
//            for (NSInteger j = 0; j < photoSet.count - 1; i++) {
//                //获取其中一个资源
//                asset = photoSet[i];
//            }
//        }else{
//            NSLog(@"not PHAssetCollection");
//        }
//    }
//    
//    
//    PHImageManager *imageManager = [[PHImageManager alloc]init];
//    //获取第一张照片资源
////    PHAsset *asset = asset[0];
//    
//    
//    //设定显示照片的尺寸
//    
//    
//    [imageManager requestImageForAsset:asset
//                            targetSize:self.uploadPhotoButton.frame.size
//                           contentMode:PHImageContentModeAspectFill
//                               options:nil
//                         resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
//                             //显示照片
//                             self.uploadPhotoButton.imageView.image = result;
//                         }];
    
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
//    [imagePickerVc setDidFinishPickingVideoHandle:^{
//        
//    }];
//    imagePickerVc setDidFinishPickingPhotosHandle:^{
    
//}
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
//        self.uploadPhotoButton.imageView.image = photos.firstObject;
        
        [self.uploadPhotoButton setImage:photos.firstObject forState:UIControlStateNormal];
        
    }];
    
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}


// 代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //成功获取照片
    NSLog(@"%s", __func__);
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    //获取照片失败
    NSLog(@"%s", __func__);
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


- (void)submitPublishAction {
    GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
    NSDictionary *p = @{
                        @"merchantId": [[NSUserDefaults standardUserDefaults] valueForKey:@"merchantId"],
                        @"commodityName": _inputTitleTextField.text,
                        @"description": _descriptionTextView.text,
                        @"price": _commodityPriceTextField.text
                        
                        };
    [manager POST:@"/server/merchant/commodity/insert" parameters:p progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (!responseObject) {
            return ;
        }
        if ([responseObject[@"success"] boolValue] != YES) {
            [SVProgressHUD showErrorWithStatus:@"发布失败"];
            return ;
        } else {
            [SVProgressHUD showSuccessWithStatus:@"发布成功"];
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
