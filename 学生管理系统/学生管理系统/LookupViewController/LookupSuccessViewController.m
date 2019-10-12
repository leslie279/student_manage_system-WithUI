//
//  LookupSuccessViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/17.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "LookupSuccessViewController.h"
#import "CpwUIView.h"
#import "StudentNSObject.h"

@interface LookupSuccessViewController ()

@property NSMutableArray *successArray;

@end

@implementation LookupSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CpwUIView *cpwUIView = [[CpwUIView alloc] init];
    StudentNSObject *student = [[StudentNSObject alloc] init];
    
    student = _studentNSObject;
    
    cpwUIView.nameLabelText.text = student.studentName;
    cpwUIView.nameLabelText.userInteractionEnabled = YES;
    cpwUIView.ageLabelText.text = student.studentAge;
    cpwUIView.classLabelText.text = student.studentClass;
    cpwUIView.numberLabelText.text = student.studentNumber;
    cpwUIView.gradeLabelText.text = student.studentGrade;
    
    [self.view addSubview:cpwUIView];
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
