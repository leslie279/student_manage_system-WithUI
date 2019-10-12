//
//  LoginViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/11.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"

@interface LoginViewController () <RegisterViewControllerDelegate>

@property (nonatomic, strong) UITextField *userName;
@property (nonatomic, strong) UITextField *passWord;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property NSString *usernameStr;
@property NSString *passwordStr;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _userName = [[UITextField alloc] initWithFrame:(CGRectMake(100, 200, 150, 40))];
    _userName.placeholder = @"请输入用户名";
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_userName];
    
    _passWord = [[UITextField alloc] initWithFrame:(CGRectMake(100, 260, 150, 40))];
    _passWord.placeholder = @"请输入密码";
    _passWord.borderStyle = UITextBorderStyleRoundedRect;
    _passWord.secureTextEntry = YES;
    [self.view addSubview:_passWord];
    
    _loginBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _loginBtn.frame = CGRectMake(150, 340, 40, 40);
    [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
    [_loginBtn addTarget:self action:@selector(pressLoginBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_loginBtn];
    
    _registerBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _registerBtn.frame = CGRectMake(200, 340, 40, 40);
    [_registerBtn setTitle:@"注册" forState:(UIControlStateNormal)];
    [_registerBtn addTarget:self action:@selector(pressRegisterBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_registerBtn];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
}
- (void)pressLoginBtn {
    if ([_userName.text isEqualToString:_usernameStr] && [_passWord.text isEqualToString:_passwordStr]) {
        MainViewController *mainViewController = [[MainViewController alloc] init];
        UINavigationController *mainViewControllerNav = [[UINavigationController alloc] initWithRootViewController:mainViewController];
        
        [self presentViewController:mainViewControllerNav animated:NO completion:^{
            NSLog(@"进入主界面");
        }];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"用户名或密码输入错误" preferredStyle:(UIAlertControllerStyleAlert)];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"确定");
        }]];
        [self presentViewController:alert animated:YES completion:^{
            NSLog(@"弹出");
        }];
    }
  
}
- (void)pressRegisterBtn {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    
    registerViewController.delegate = self;
    
    [self presentViewController:registerViewController animated:NO completion:^{
        NSLog(@"进入注册");
    }];
}

- (void)setUsername:(NSString *)username AndPassword:(NSString *)passWord {
    _userName.text = username;
    _passWord.text = passWord;
    _usernameStr = username;
    _passwordStr = passWord;
    
}
@end
