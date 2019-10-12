//
//  WholeViewController.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/16.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "WholeViewController.h"
#import "StudentNSObject.h"
#import "CpwTableViewCell.h"

@interface WholeViewController () <
UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource>


@property NSMutableArray *allStudentArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation WholeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _allStudentArray = [NSMutableArray array];
    _allStudentArray = [_wholeArray mutableCopy];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StudentNSObject *studentNSObject = [[StudentNSObject alloc] init];
    studentNSObject = _allStudentArray[indexPath.row];
    
    static NSString *ID1 = @"cell1";
    CpwTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:ID1];
    if (cell1 == nil) {
        cell1 = [[CpwTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID1];
    }
    cell1.nameLabelText.text = studentNSObject.studentName;
    cell1.ageLabelText.text = studentNSObject.studentAge;
    cell1.classLabelText.text = studentNSObject.studentClass;
    cell1.numberLabelText.text = studentNSObject.studentNumber;
    cell1.gradeLabelText.text = studentNSObject.studentGrade;
    
    cell1.numberLabelText.userInteractionEnabled = NO;
    cell1.nameLabelText.userInteractionEnabled = NO;
    cell1.ageLabelText.userInteractionEnabled = NO;
    cell1.classLabelText.userInteractionEnabled = NO;
    cell1.gradeLabelText.userInteractionEnabled = NO;
    
    
    cell1.selectionStyle = UITableViewCellEditingStyleNone;
    return cell1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allStudentArray.count;
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
