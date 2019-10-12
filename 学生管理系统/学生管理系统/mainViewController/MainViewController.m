//
//  MainViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/11.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "WholeViewController.h"
#import "AddtoViewController.h"
#import "DeleteViewController.h"
#import "LookupViewController.h"
#import "ModifyViewController.h"
#import "StudentNSObject.h"



@interface MainViewController () <DelegateViewControllerDelegate,
addtoViewControllerDelegate>

@property (nonatomic, strong) UIButton *wholeBtn;
@property (nonatomic, strong) UIButton *lookupBtn;
@property (nonatomic, strong) UIButton *modifyBtn;
@property (nonatomic, strong) UIButton *deleteBtn;
@property (nonatomic, strong) UIButton *addtoBtn;
@property (nonatomic, strong) UIButton *signOutBtn;
@property NSMutableArray *nameArray;
@property NSMutableArray *ageArray;
@property NSMutableArray *classArray;
@property NSMutableArray *numberArray;
@property NSMutableArray *gradeArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"欢迎使用学生管理系统";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _wholeBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _wholeBtn.frame = CGRectMake(150, 100, 150, 70);
    [_wholeBtn setTitle:@"查看全部学生信息" forState:(UIControlStateNormal)];
    _wholeBtn.tag = 101;
    [_wholeBtn addTarget:self action:@selector(pressBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_wholeBtn];
    
    _lookupBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _lookupBtn.frame = CGRectMake(150, 150, 150, 70);
    [_lookupBtn setTitle:@"查找某个学生信息" forState:(UIControlStateNormal)];
    _lookupBtn.tag = 102;
    [_lookupBtn addTarget:self action:@selector(pressBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_lookupBtn];
    
    _modifyBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _modifyBtn.frame = CGRectMake(150, 200, 150, 70);
    [_modifyBtn setTitle:@"修改某个学生信息" forState:(UIControlStateNormal)];
    _modifyBtn.tag = 103;
    [_modifyBtn addTarget:self action:@selector(pressBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_modifyBtn];
    
    _deleteBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _deleteBtn.frame = CGRectMake(150, 250, 150, 70);
    [_deleteBtn setTitle:@"删除某个学生信息" forState:(UIControlStateNormal)];
    _deleteBtn.tag = 104;
    [_deleteBtn addTarget:self action:@selector(pressBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_deleteBtn];
    
    _addtoBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _addtoBtn.frame = CGRectMake(150, 300, 150, 70);
    [_addtoBtn setTitle:@"添加学生信息" forState:(UIControlStateNormal)];
    _addtoBtn.tag = 105;
    [_addtoBtn addTarget:self action:@selector(pressBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_addtoBtn];
    
    _signOutBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _signOutBtn.frame = CGRectMake(150, 350, 150, 70);
    [_signOutBtn setTitle:@"退出系统" forState:(UIControlStateNormal)];
    _signOutBtn.tag = 106;
    [_signOutBtn addTarget:self action:@selector(pressBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_signOutBtn];
    
    _studentArray = [NSMutableArray array];
    _nameArray = [NSMutableArray arrayWithObjects:@"小明", @"小红", @"小白", @"小猪", nil];
    _ageArray = [NSMutableArray arrayWithObjects:@"18", @"17", @"19", @"20", nil];
    _classArray = [NSMutableArray arrayWithObjects:@"网络1801", @"网络1802", @"网络1803", @"网络1804", nil];
    _numberArray = [NSMutableArray arrayWithObjects:@"04182078", @"04182079", @"04182080", @"04182081", nil];
    _gradeArray = [NSMutableArray arrayWithObjects:@"80", @"79", @"89", @"98", nil];
    for (int i = 0; i < _nameArray.count; i++) {
        StudentNSObject *student = [[StudentNSObject alloc] init];
        student.studentName = _nameArray[i];
        student.studentAge = _ageArray[i];
        student.studentClass = _classArray[i];
        student.studentNumber = _numberArray[i];
        student.studentGrade = _gradeArray[i];
        [_studentArray addObject:student];
    }
}

- (void)dele:(NSMutableArray *)delegateArray {
    _studentArray = [delegateArray mutableCopy];
}

- (void) pressBtn:(UIButton *)btn {
    if (btn.tag == 101) {
        WholeViewController *wholeViewController = [[WholeViewController alloc] init];
        wholeViewController.wholeArray = [_studentArray mutableCopy];
        [self.navigationController pushViewController:wholeViewController animated:NO];
    } else if (btn.tag == 102) {
        LookupViewController *lookupViewController = [[LookupViewController alloc] init];
        lookupViewController.lookUpArray = [_studentArray mutableCopy];
        [self.navigationController pushViewController:lookupViewController animated:NO];
    } else if (btn.tag == 103) {
        ModifyViewController *modifyViewController = [[ModifyViewController alloc] init];
        modifyViewController.modifyArray = [_studentArray mutableCopy];
        NSLog(@"_studentArray的地址:%p", _studentArray[0]);
        [self.navigationController pushViewController:modifyViewController animated:NO];
    } else if (btn.tag == 104) {
        DeleteViewController *deleteViewController = [[DeleteViewController alloc] init];
        deleteViewController.delegate = self;
        deleteViewController.delegateArray1 = [_studentArray mutableCopy];
        [self.navigationController pushViewController:deleteViewController animated:NO];
    } else if (btn.tag == 105) {
        AddtoViewController *addtoViewController = [[AddtoViewController alloc] init];
        addtoViewController.delegate = self;
        addtoViewController.array = [_studentArray mutableCopy];
        [self.navigationController pushViewController:addtoViewController animated:NO];
    } else if (btn.tag == 106) {
        [self dismissViewControllerAnimated:NO completion:^{
            NSLog(@"退出系统");
        }];
    }
    
}
- (void)addtoStudent:(NSMutableArray *)addtoArray {
    _studentArray = [addtoArray mutableCopy];
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
