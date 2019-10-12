//
//  CpwUIView.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/17.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "CpwUIView.h"

@implementation CpwUIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    
    _nameLabelText = [[UITextField alloc] init];
    [self addSubview:_nameLabelText];
    
    _ageLabel = [[UILabel alloc] init];
    [self addSubview:_ageLabel];
    
    _ageLabelText = [[UITextField alloc] init];
    [self addSubview:_ageLabelText];
    
    _classLabel = [[UILabel alloc] init];
    [self addSubview:_classLabel];
    
    _classLabelText = [[UITextField alloc] init];
    [self addSubview:_classLabelText];
    
    _numberLabel = [[UILabel alloc] init];
    [self addSubview:_numberLabel];
    
    _numberLabelText = [[UITextField alloc] init];
    [self addSubview:_numberLabelText];
    
    _gradeLabel = [[UILabel alloc] init];
    [self addSubview:_gradeLabel];
    
    _gradeLabelText = [[UITextField alloc] init];
    [self addSubview:_gradeLabelText];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
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
}
@end
