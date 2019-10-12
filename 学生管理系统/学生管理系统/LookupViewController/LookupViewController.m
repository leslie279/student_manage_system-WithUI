//
//  LookupViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/16.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "LookupViewController.h"
#import "StudentNSObject.h"
#import "CpwUIView.h"
#import "LookupSuccessViewController.h"

@interface LookupViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *lookupTextField;
@property (nonatomic, strong) UIButton *sureBtn;
@property NSMutableArray *StudentArray;
@property NSInteger flag;

@end

@implementation LookupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _lookupTextField = [[UITextField alloc] initWithFrame:(CGRectMake(70, 100, 300, 50))];
    _lookupTextField.placeholder = @"请输入你要查找的学生的学号";
    _lookupTextField.borderStyle = UITextBorderStyleRoundedRect;
    _lookupTextField.layer.cornerRadius = 10;
    [self.view addSubview:_lookupTextField];
    
    _sureBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _sureBtn.frame = CGRectMake(150, 170, 50, 50);
    [_sureBtn setTitle:@"确定" forState:(UIControlStateNormal)];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _sureBtn.backgroundColor = [UIColor whiteColor];
    [_sureBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    _sureBtn.layer.cornerRadius = 1;
    [_sureBtn addTarget:self action:@selector(pressBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_sureBtn];
    
    _StudentArray = [NSMutableArray array];
    _StudentArray = [_lookUpArray mutableCopy];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_lookupTextField resignFirstResponder];
}

- (void)pressBtn {
    _flag = 1;
    NSString *str = _lookupTextField.text;
    for (int i = 0; i < _StudentArray.count; i++) {
        StudentNSObject *student = [[StudentNSObject alloc] init];
        student = _StudentArray[i];
        if ([student.studentNumber isEqualToString:str]) {
            _flag = 0;
            NSLog(@"查找成功");
            LookupSuccessViewController *lookupSuccessViewController = [[LookupSuccessViewController alloc] init];
            
            lookupSuccessViewController.studentNSObject = student;
            
            [self.navigationController pushViewController:lookupSuccessViewController animated:NO];
        }
    }
    if (_flag == 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"查找失败，请检查输入" preferredStyle:(UIAlertControllerStyleAlert)];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"查找失败");
        }]];
        [self presentViewController:alert animated:YES completion:^{
            NSLog(@"查找失败");
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
