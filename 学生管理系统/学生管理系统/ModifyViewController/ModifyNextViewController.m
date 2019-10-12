//
//  ModifyNextViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/17.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "ModifyNextViewController.h"
#import "StudentNSObject.h"
#import "CpwTableViewCell.h"
#import "CpwUIView.h"

@interface ModifyNextViewController () <UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) StudentNSObject *modifyStudent;
@property CpwUIView *cpwUIView;

@end

@implementation ModifyNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _modifyStudent = _student;
    NSLog(@"_modifyStudent的地址:%p", _modifyStudent.studentName);
    NSLog(@"_student的地址:%p", _student.studentName);
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 200, 200, 50);
    label.text = @"请在下面做修改:";
    [self.view addSubview:label];
    
    _cpwUIView = [[CpwUIView alloc] init];
    _cpwUIView.frame = CGRectMake(0, 50, 414, 400);
    _cpwUIView.nameLabelText.text = _modifyStudent.studentName;
    _cpwUIView.ageLabelText.text = _modifyStudent.studentAge;
    _cpwUIView.classLabelText.text = _modifyStudent.studentClass;
    _cpwUIView.numberLabelText.text = _modifyStudent.studentNumber;
    _cpwUIView.gradeLabelText.text = _modifyStudent.studentGrade;
    
    [self.view addSubview:_cpwUIView];
    
    _sureBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _sureBtn.frame = CGRectMake(100, 400, 100, 50);
    [_sureBtn setTitle:@"确认修改" forState:(UIControlStateNormal)];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_sureBtn addTarget:self action:@selector(pressBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_sureBtn];
}

- (void)pressBtn {
    _modifyStudent.studentName = _cpwUIView.nameLabelText.text;
    _modifyStudent.studentAge = _cpwUIView.ageLabelText.text;
    _modifyStudent.studentClass = _cpwUIView.classLabelText.text;
    _modifyStudent.studentNumber = _cpwUIView.numberLabelText.text;
    _modifyStudent.studentGrade = _cpwUIView.gradeLabelText.text;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"修改成功" preferredStyle:(UIAlertControllerStyleAlert)];
    [self presentViewController:alert animated:YES completion:^{
        NSLog(@"修改成功");
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self.tableView reloadData];
    }]];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID1 = @"cell1";
    CpwTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID1];
    if (cell == nil) {
        cell = [[CpwTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID1];
    }
    cell.nameLabelText.text = _modifyStudent.studentName;
    cell.ageLabelText.text = _modifyStudent.studentAge;
    cell.classLabelText.text = _modifyStudent.studentClass;
    cell.numberLabelText.text = _modifyStudent.studentNumber;
    cell.gradeLabelText.text = _modifyStudent.studentGrade;
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    return cell;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_cpwUIView.nameLabelText resignFirstResponder];
    [_cpwUIView.ageLabelText resignFirstResponder];
    [_cpwUIView.classLabelText resignFirstResponder];
    [_cpwUIView.numberLabelText resignFirstResponder];
    [_cpwUIView.gradeLabelText resignFirstResponder];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
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
