//
//  DelegateNextViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/19.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "DelegateNextViewController.h"
#import "CpwUIView.h"
#import "StudentNSObject.h"

@interface DelegateNextViewController ()

@property StudentNSObject *studentObject2;
@property NSMutableArray *delegateArray2;
@property (nonatomic, strong) UIButton *delegateBtn;
@property CpwUIView *cpwUIView;

@end

@implementation DelegateNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    _delegateArray2 = [_delegateArray mutableCopy];
    _studentObject2 = _studentNSObject1;
    
    
    
    _cpwUIView = [[CpwUIView alloc] init];
    _cpwUIView.nameLabelText.text = _studentObject2.studentName;
    _cpwUIView.ageLabelText.text = _studentObject2.studentAge;
    _cpwUIView.classLabelText.text = _studentObject2.studentClass;
    _cpwUIView.numberLabelText.text = _studentObject2.studentNumber;
    _cpwUIView.gradeLabelText.text = _studentObject2.studentGrade;
    
    _delegateBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _delegateBtn.frame = CGRectMake(100, 300, 100, 50);
    [_delegateBtn setTitle:@"确认删除" forState:(UIControlStateNormal)];
    _delegateBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_delegateBtn addTarget:self action:@selector(pressDelegateBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_delegateBtn];
    
    [self.view addSubview:_cpwUIView];
    
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStyleDone) target:self action:@selector(backBtn)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

- (void)pressDelegateBtn {
    [_delegateArray2 removeObject:_studentObject2];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"删除成功" preferredStyle:(UIAlertControllerStyleAlert)];
    [self presentViewController:alert animated:NO completion:^{
        NSLog(@"删除成功");
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定并返回上一界面" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self.delegate delegate:self.delegateArray2];
        [self.navigationController popViewControllerAnimated:YES];
    }]];
}
- (void)backBtn {
    [_delegate delegate:_delegateArray2];
    [self.navigationController popViewControllerAnimated:YES];
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
