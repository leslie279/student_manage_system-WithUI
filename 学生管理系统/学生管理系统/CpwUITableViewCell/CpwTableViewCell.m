//
//  CpwTableViewCell.m
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/17.
//  Copyright © 2019 ABC. All rights reserved.
//

#import "CpwTableViewCell.h"

@implementation CpwTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        
        _nameLabelText = [[UITextField alloc] init];
        [self.contentView addSubview:_nameLabelText];
        
        _ageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_ageLabel];
        
        _ageLabelText = [[UITextField alloc] init];
        [self.contentView addSubview:_ageLabelText];
        
        _classLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_classLabel];
        
        _classLabelText = [[UITextField alloc] init];
        [self.contentView addSubview:_classLabelText];
        
        _numberLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_numberLabel];
        
        _numberLabelText = [[UITextField alloc] init];
        [self.contentView addSubview:_numberLabelText];
        
        _gradeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_gradeLabel];
        
        _gradeLabelText = [[UITextField alloc] init];
        [self.contentView addSubview:_gradeLabelText];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.nameLabel.frame = CGRectMake(5, 5, 50, 50);
    self.nameLabel.text = @"姓名:";
    self.nameLabelText.frame = CGRectMake(60, 5, 50, 50);
    self.nameLabelText.userInteractionEnabled = NO;
    
    self.ageLabel.frame = CGRectMake(120, 5, 50, 50);
    self.ageLabel.text = @"年龄:";
    self.ageLabelText.frame = CGRectMake(175, 5, 50, 50);
    self.ageLabelText.userInteractionEnabled = NO;
    
    self.classLabel.frame = CGRectMake(230, 5, 50, 50);
    self.classLabel.text = @"班级:";
    self.classLabelText.frame = CGRectMake(285, 5, 80, 50);
    self.classLabelText.userInteractionEnabled = NO;
    
    self.numberLabel.frame = CGRectMake(5, 55, 50, 50);
    self.numberLabel.text = @"学号:";
    self.numberLabelText.frame = CGRectMake(60, 55, 120, 50);
    self.numberLabelText.userInteractionEnabled = NO;
    
    self.gradeLabel.frame = CGRectMake(230, 55, 50, 50);
    self.gradeLabel.text = @"成绩:";
    self.gradeLabelText.frame = CGRectMake(285, 55, 50, 50);
    self.gradeLabelText.userInteractionEnabled = NO;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
