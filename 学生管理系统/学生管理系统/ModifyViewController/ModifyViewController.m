//
//  ModifyViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/16.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "ModifyViewController.h"
#import "StudentNSObject.h"
#import "ModifyNextViewController.h"

@interface ModifyViewController ()


@property (nonatomic, strong) UITextField *modifyTextField;
@property (nonatomic, strong) UIButton *sureBtn;
@property NSMutableArray *modifyArray2;
@property NSInteger flag;

@end

@implementation ModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _modifyTextField = [[UITextField alloc] init];
    _modifyTextField.frame = CGRectMake(100, 200, 300, 40);
    _modifyTextField.placeholder = @"请输入你要修改的学生的学号";
    _modifyTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_modifyTextField];
    
    _sureBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _sureBtn.frame = CGRectMake(150, 260, 300, 40);
    [_sureBtn setTitle:@"确定" forState:(UIControlStateNormal)];
    [_sureBtn addTarget:self action:@selector(pressBtn) forControlEvents:(UIControlEventTouchUpInside)];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_sureBtn];
    
    _modifyArray2 = [NSMutableArray array];
    _modifyArray2 = [_modifyArray mutableCopy];
    NSLog(@"_modifyArray2的地址:%p", _modifyArray2);
    NSLog(@"_modifyArray的地址:%p", _modifyArray);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_modifyTextField resignFirstResponder];
}
- (void)pressBtn {
    _flag = 1;
    NSString *str = _modifyTextField.text;
    for (int i = 0; i < _modifyArray2.count; i++) {
       
        StudentNSObject *student = [[StudentNSObject alloc] init];
        student = _modifyArray2[i];
        if ([student.studentNumber isEqualToString:str]) {
             _flag = 0;
            NSLog(@"进入下一界面");
            ModifyNextViewController *modifyNextViewController = [[ModifyNextViewController alloc] init];
            NSLog(@"student的地址:%p", student.studentName);
            modifyNextViewController.student = student;
            [self.navigationController pushViewController:modifyNextViewController animated:NO];
        }
    }
    if (_flag == 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"查找失败，请检查输入" preferredStyle:(UIAlertControllerStyleAlert)];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"确定");
        }]];
        [self presentViewController:alert animated:NO completion:^{
            NSLog(@"确定");
        }];
    }
    
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
