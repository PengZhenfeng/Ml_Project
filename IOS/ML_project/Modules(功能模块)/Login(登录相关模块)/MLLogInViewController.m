//
//  MLLogInViewController.m
//  ML_project
//
//  Created by Angzeng on 2019/12/1.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#import "MLLogInViewController.h"
#import "MLTabBarController.h"
#import "FontAndColorMacros.h"
#import "UtilsMacros.h"
#import <CommonCrypto/CommonDigest.h>

@interface MLLogInViewController ()

@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) NSString *getAccount;
@property (nonatomic, strong) NSString *getPassword;

@end

@implementation MLLogInViewController

#pragma mark 生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

#pragma mark 页面样式设置

- (void)setUI {
    self.view.backgroundColor = MLColor_ChineseRed;
    //
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(MLLeftPoint(48*MLpx), 0.08*MLScreenHeight, 48*MLpx, 48*MLpx)];
    [iconView setImage:[UIImage imageNamed:@"icon_round"]];
    //[self.view addSubview:iconView];
    //输入框背景视图
    UIView *inputBackView = [[UIView alloc] initWithFrame:CGRectMake(MLLeftPoint(75*MLpx), 0.4*MLScreenHeight, 75*MLpx, 38*MLpx)];
    inputBackView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:inputBackView];
    //账号
    UIView *accountView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75*MLpx, 12*MLpx)];
    accountView.backgroundColor = [UIColor whiteColor];
    accountView.layer.cornerRadius = 2*MLpx;
    [inputBackView addSubview:accountView];
    
    UILabel *accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(1*MLpx, 1*MLpx, 24*MLpx, 10*MLpx)];
    accountLabel.backgroundColor = MLColor_Black;
    accountLabel.layer.cornerRadius = 2*MLpx;
    accountLabel.clipsToBounds = YES;
    accountLabel.text = @"用户名";
    accountLabel.font = [UIFont fontWithName:MLFont size:18*FontPx];
    accountLabel.textAlignment = NSTextAlignmentCenter;
    accountLabel.textColor = MLColor_DarkGray;
    accountLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *accountGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(inputAccount)];
    [accountLabel addGestureRecognizer:accountGesture];
    [accountView addSubview:accountLabel];
    
    _accountField = [[UITextField alloc] initWithFrame:CGRectMake(28*MLpx, 1*MLpx, 44*MLpx, 10*MLpx)];
    _accountField.backgroundColor = [UIColor whiteColor];
    _accountField.keyboardType = UIKeyboardTypeNumberPad;
    _accountField.font = [UIFont fontWithName:MLFont size:18*FontPx];
    _accountField.clearButtonMode = UITextFieldViewModeAlways;
    _accountField.placeholder = @"请输入手机号";
    [accountView addSubview:_accountField];
    //密码
    UIView *passwordView = [[UIView alloc] initWithFrame:CGRectMake(0, 18*MLpx, 75*MLpx, 12*MLpx)];
    passwordView.backgroundColor = [UIColor whiteColor];
    passwordView.layer.cornerRadius = 2*MLpx;
    [inputBackView addSubview:passwordView];
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(1*MLpx, 1*MLpx, 24*MLpx, 10*MLpx)];
    passwordLabel.backgroundColor = MLColor_Black;
    passwordLabel.layer.cornerRadius = 2*MLpx;
    passwordLabel.clipsToBounds = YES;
    passwordLabel.text = @"密 码";
    passwordLabel.font = [UIFont fontWithName:MLFont size:18*FontPx];
    passwordLabel.textAlignment = NSTextAlignmentCenter;
    passwordLabel.textColor = MLColor_DarkGray;
    passwordLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *passwordGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(inputPassword)];
    [passwordLabel addGestureRecognizer:passwordGesture];
    [passwordView addSubview:passwordLabel];
    
    _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(28*MLpx, 1*MLpx, 44*MLpx, 10*MLpx)];
    _passwordField.backgroundColor = [UIColor whiteColor];
    _passwordField.secureTextEntry = YES;
    _passwordField.font = [UIFont fontWithName:MLFont size:18*FontPx];
    _passwordField.clearButtonMode = UITextFieldViewModeAlways;
    _passwordField.placeholder = @"请输入密码";
    _passwordField.returnKeyType = UIReturnKeyDone;
    [passwordView addSubview:_passwordField];
    //
    UIButton *Login = [[UIButton alloc] initWithFrame:CGRectMake(MLLeftPoint(55*MLpx), 0.76*MLScreenHeight, 55*MLpx/*200*/, 11*MLpx)];
    Login.layer.cornerRadius = 5;
    Login.backgroundColor = [UIColor colorWithRed:149/255.0 green:133/255.0 blue:71/255.0 alpha:1];
    [Login setTitle:@"登    录" forState:UIControlStateNormal];
    Login.titleLabel.textAlignment = NSTextAlignmentCenter;
    Login.titleLabel.font = [UIFont fontWithName:MLFont size:18*FontPx];
    Login.titleLabel.textColor = MLColor_WhiteGray;
    [Login addTarget:self action:@selector(LogIn) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:Login];
    //
    UILabel *resetLabel = [[UILabel alloc] initWithFrame:CGRectMake(6*MLpx, 0.85*MLScreenHeight, 25*MLpx, 6*MLpx)];
    resetLabel.text = @"忘记密码？";
    resetLabel.font = [UIFont fontWithName:MLFont size:14*FontPx];
    resetLabel.textColor = MLColor_WhiteGray;
    resetLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:resetLabel];
    //
    UIButton *reset = [[UIButton alloc] initWithFrame:CGRectMake(31*MLpx, 0.85*MLScreenHeight, 15*MLpx, 6*MLpx)];
    reset.layer.cornerRadius = 1*MLpx;
    [reset setTitle:@"重 置" forState:UIControlStateNormal];
    reset.titleLabel.font = [UIFont fontWithName:MLFont size:13*FontPx];
    [reset setTitleColor:MLColor_DarkRed forState:UIControlStateNormal];
    reset.backgroundColor = MLColor_Black;
    [reset addTarget:self action:@selector(goResetVC) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:reset];
    //
    UIView *orline = [[UIView alloc] initWithFrame:CGRectMake(50*MLpx, 0.85*MLScreenHeight, 1, 6*MLpx)];
    orline.backgroundColor = MLColor_WhiteGray;
    [self.view addSubview:orline];
    //
    UILabel *registerLabel = [[UILabel alloc] initWithFrame:CGRectMake(53*MLpx, 0.85*MLScreenHeight, 23*MLpx, 6*MLpx)];
    registerLabel.text = @"尚无密码？";
    registerLabel.font = [UIFont fontWithName:MLFont size:14*FontPx];
    registerLabel.textColor = MLColor_WhiteGray;
    registerLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:registerLabel];
    //
    UIButton *registerAccount = [[UIButton alloc] initWithFrame:CGRectMake(76*MLpx, 0.85*MLScreenHeight, 15*MLpx, 6*MLpx)];
    registerAccount.layer.cornerRadius = 1*MLpx;
    [registerAccount setTitle:@"注 册" forState:UIControlStateNormal];
    registerAccount.titleLabel.font = [UIFont fontWithName:MLFont size:13*FontPx];
    [registerAccount setTitleColor:MLColor_DarkRed forState:UIControlStateNormal];
    registerAccount.backgroundColor = MLColor_Black;
    [registerAccount addTarget:self action:@selector(goRegisterVC) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:registerAccount];
    //
    [self setDefaultLoginData];//设置初始登录的用户名和密码
    UITapGestureRecognizer *endEditingTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing)];
    [self.view addGestureRecognizer:endEditingTap];
}

- (void)inputAccount {
    [_accountField becomeFirstResponder];
}

- (void)inputPassword {
    [_passwordField becomeFirstResponder];
}

- (void)endEditing {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (void)goRegisterVC {
//    _registerVC = [[YHRegisterViewController alloc] init];
//    [self presentViewController:_registerVC animated:YES completion:nil];
}

- (void)goResetVC {
//    _resetVC = [[YHResetViewController alloc] init];
//    [self presentViewController:_resetVC animated:YES completion:nil];
}

#pragma mark 页面方法设置

- (void)setDefaultLoginData {
//    NSDictionary *loginData = [YHDataStorager getOnLoginData];
//    NSLog(@"%@",loginData);
//    _accountField.text = loginData[@"account"];
//    _passwordField.text = loginData[@"password"];
}

- (BOOL)checkAccount:(NSString *)Account{
    NSString *pattern = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:Account];
    return !isMatch;
}

- (BOOL)checkPassword:(NSString *)password{
    NSString *pattern =@"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return !isMatch;
}

- (void)LogIn {
//    if (_isLogin) {
//        return;
//    }
//    _getAccount = self.accountField.text;
//    _getPassword = self.passwordField.text;
//    if (_getAccount.length == 0) {
//        [YHAlertView initAlertViewWithText:@"请输入手机号。" Second:3];
//        return;
//    }
//    if ([self checkAccount:_getAccount]) {
//        [YHAlertView initAlertViewWithText:@"请输入正确的手机号。" Second:3];
//        return;
//    }
//    if (_getPassword.length == 0) {
//        [YHAlertView initAlertViewWithText:@"请输入密码。" Second:3];
//        return;
//    }
//    if ([self checkPassword:_getPassword]) {
//        [YHAlertView initAlertViewWithText:@"密码各式错误（请输入6到20位字母大小写以及数字组成的密码）。" Second:5];
//        return;
//    }
//    NSDictionary *parameters = @{@"type":@"0",@"mobile":_getAccount,@"password":[self MD5enc:_getPassword With:_getAccount]};
//    [[YHDataManager manager] postDataWithUrl:YHurl_login Parameters:parameters Block:^(id dict) {
//        if ([dict[@"code"] isEqual:@200]) {
//            [[YHUser shareInstance] setLoginUserData:dict[@"data"][0]];//设置用户登录数据
            [self LogInSucceed];/*用户登录成功*/
//        }else {
//            [YHAlertView initAlertViewWithText:@"登录失败，请检查用户名和密码。" Second:3];
//        }
//    }];
}

- (void)LogInSucceed {
    MLTabBarController *MLTabBarVC = [[MLTabBarController alloc] init];
    MLTabBarVC.modalPresentationStyle = 0;
    [self presentViewController:MLTabBarVC animated:YES completion:nil];
    //本地存储登录数据
}

- (NSString *)MD5enc:(NSString *) secret With:(NSString *)salt{
    secret = [self md5:[NSString stringWithFormat:@"%@%@",secret,salt]];
    salt = [self md5:[NSString stringWithFormat:@"%@%@",secret,salt]];
    secret = [self md5:[NSString stringWithFormat:@"%@%@yinghui",secret,salt]];
    return secret;
}

- (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

#pragma mark 内存预警

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
