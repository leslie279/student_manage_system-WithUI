//
//  DeleteViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/16.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "DeleteViewController.h"
#import "StudentNSObject.h"
#import "CpwUIView.h"
#import "DelegateNextViewController.h"

@interface DeleteViewController () <DelegateNextViewControllerDelegate>

@property (nonatomic, strong) UITextField *delegateTextField;
@property (nonatomic, strong) UIButton *sureBtn;
@property NSMutableArray *delegateArray2;
@property NSInteger flag;

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _delegateArray2 = [_delegateArray1 mutableCopy];
    _delegateTextField = [[UITextField alloc] initWithFrame:(CGRectMake(70, 100, 300, 50))];
    _delegateTextField.placeholder = @"请输入你要删除的学生的学号";
    _delegateTextField.borderStyle = UITextBorderStyleRoundedRect;
    _delegateTextField.layer.cornerRadius = 10;
    [self.view addSubview:_delegateTextField];
    
    _sureBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _sureBtn.frame = CGRectMake(150, 170, 50, 50);
    [_sureBtn setTitle:@"确定" forState:(UIControlStateNormal)];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _sureBtn.backgroundColor = [UIColor whiteColor];
    [_sureBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    _sureBtn.layer.cornerRadius = 1;
    [_sureBtn addTarget:self action:@selector(pressBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_sureBtn];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStyleDone) target:self action:@selector(backBtn)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

- (void)backBtn {
    [_delegate dele:_delegateArray2];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)delegate:(NSMutableArray *)delegatedArray {
    _delegateArray2 = [delegatedArray mutableCopy];
}

- (void)pressBtn {
    _flag = 1;
    NSString *str = _delegateTextField.text;
    for (int i = 0; i < _delegateArray2.count; i++) {
        
        StudentNSObject *student = [[StudentNSObject alloc] init];
        student = _delegateArray2[i];
        if ([student.studentNumber isEqualToString:str]) {
            _flag = 0;
            DelegateNextViewController *delegateNextViewController = [[DelegateNextViewController alloc] init];
            delegateNextViewController.studentNSObject1 = student;
            delegateNextViewController.delegateArray = [_delegateArray2 mutableCopy];
            delegateNextViewController.delegate = self;
            [self.navigationController pushViewController:delegateNextViewController animated:YES];
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_delegateTextField resignFirstResponder];
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
