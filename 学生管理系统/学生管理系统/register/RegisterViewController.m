//
//  RegisterViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/11.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (nonatomic, strong) UITextField *ConfirmPassWord;
@property (nonatomic, strong) UIButton *registerBtn;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _userName = [[UITextField alloc] initWithFrame:(CGRectMake(100, 200, 150, 40))];
    _userName.placeholder = @"请输入用户名";
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_userName];
    
    _passWord = [[UITextField alloc] initWithFrame:(CGRectMake(100, 250, 150, 40))];
    _passWord.placeholder = @"请输入密码";
    _passWord.borderStyle = UITextBorderStyleRoundedRect;
    _passWord.secureTextEntry = YES;
    [self.view addSubview:_passWord];
    
    _ConfirmPassWord = [[UITextField alloc] initWithFrame:(CGRectMake(100, 300, 150, 40))];
    _ConfirmPassWord.placeholder = @"确认密码";
    _ConfirmPassWord.borderStyle = UITextBorderStyleRoundedRect;
    _ConfirmPassWord.secureTextEntry = YES;
    [self.view addSubview:_ConfirmPassWord];
    
    _registerBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _registerBtn.frame = CGRectMake(200, 340, 40, 40);
    [_registerBtn setTitle:@"注册" forState:(UIControlStateNormal)];
    [_registerBtn addTarget:self action:@selector(pressRegisterBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_registerBtn];
    
}

- (void)pressRegisterBtn {
    [_delegate setUsername:_userName.text AndPassword:_passWord.text];
    
    [self dismissViewControllerAnimated:NO completion:^{
        NSLog(@"返回登录界面");
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
    [_ConfirmPassWord resignFirstResponder];
}
@end
