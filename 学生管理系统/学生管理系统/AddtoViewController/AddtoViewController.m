//
//  AddtoViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/16.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "AddtoViewController.h"
#import "StudentNSObject.h"
#import "CpwUIView.h"

@interface AddtoViewController () <UITextFieldDelegate>

@property NSMutableArray *addtoArray2;
@property (nonatomic, strong) UIButton *addtoBtn;
@property CpwUIView *cpwUIView;
@property StudentNSObject *studentNSObject;

@property UITextField *nameLabelText;
@property UITextField *ageLabelText;
@property UITextField *classLabelText;
@property UITextField *numberLabelText;
@property UITextField *gradeLabelText;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *classLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *gradeLabel;

@end

@implementation AddtoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nameLabel = [[UILabel alloc] init];
    [self.view addSubview:_nameLabel];
    
    _nameLabelText = [[UITextField alloc] init];
    [self.view addSubview:_nameLabelText];
    
    _ageLabel = [[UILabel alloc] init];
    [self.view addSubview:_ageLabel];
    
    _ageLabelText = [[UITextField alloc] init];
    [self.view addSubview:_ageLabelText];
    
    _classLabel = [[UILabel alloc] init];
    [self.view addSubview:_classLabel];
    
    _classLabelText = [[UITextField alloc] init];
    [self.view addSubview:_classLabelText];
    
    _numberLabel = [[UILabel alloc] init];
    [self.view addSubview:_numberLabel];
    
    _numberLabelText = [[UITextField alloc] init];
    [self.view addSubview:_numberLabelText];
    
    _gradeLabel = [[UILabel alloc] init];
    [self.view addSubview:_gradeLabel];
    
    _gradeLabelText = [[UITextField alloc] init];
    [self.view addSubview:_gradeLabelText];
    
    self.nameLabel.frame = CGRectMake(5, 205, 50, 50);
    self.nameLabel.text = @"姓名:";
    self.nameLabelText.frame = CGRectMake(60, 205, 50, 50);
    [self.nameLabelText setEnabled:YES];
    
    self.ageLabel.frame = CGRectMake(120, 205, 50, 50);
    self.ageLabel.text = @"年龄:";
    self.ageLabelText.frame = CGRectMake(175, 205, 50, 50);
    
    self.classLabel.frame = CGRectMake(230, 205, 50, 50);
    self.classLabel.text = @"班级:";
    self.classLabelText.frame = CGRectMake(285, 205, 80, 50);
    
    self.numberLabel.frame = CGRectMake(5, 255, 50, 50);
    self.numberLabel.text = @"学号:";
    self.numberLabelText.frame = CGRectMake(60, 255, 120, 50);
    
    self.gradeLabel.frame = CGRectMake(230, 255, 50, 50);
    self.gradeLabel.text = @"成绩:";
    self.gradeLabelText.frame = CGRectMake(285, 255, 50, 50);
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    _addtoArray2 = [_array mutableCopy];
    _addtoBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _addtoBtn.frame = CGRectMake(100, 300, 100, 50);
    [_addtoBtn setTitle:@"确认添加" forState:(UIControlStateNormal)];
    _addtoBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_addtoBtn addTarget:self action:@selector(pressAddtoBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_addtoBtn];
    
    _studentNSObject = [[StudentNSObject alloc] init];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nameLabelText resignFirstResponder];
    [_ageLabelText resignFirstResponder];
    [_classLabelText resignFirstResponder];
    [_numberLabelText resignFirstResponder];
    [_gradeLabelText resignFirstResponder];
}
- (void)pressAddtoBtn {
    _studentNSObject.studentName = self.nameLabelText.text;
    _studentNSObject.studentAge = self.ageLabelText.text;
    _studentNSObject.studentClass = self.classLabelText.text;
    _studentNSObject.studentNumber = self.numberLabelText.text;
    _studentNSObject.studentGrade = self.gradeLabelText.text;
    [_addtoArray2 addObject:_studentNSObject];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"添加成功" preferredStyle:(UIAlertControllerStyleAlert)];
    [self presentViewController:alert animated:NO completion:^{
        NSLog(@"添加成功");
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定并返回上一界面" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self.delegate addtoStudent:self.addtoArray2];
        [self.navigationController popViewControllerAnimated:YES];
    }]];
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
