//
//  CpwTableViewCell.h
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/17.
//  Copyright © 2019 ABC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CpwTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *classLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *gradeLabel;

@property (nonatomic, strong) UITextField *nameLabelText;
@property (nonatomic, strong) UITextField *ageLabelText;
@property (nonatomic, strong) UITextField *classLabelText;
@property (nonatomic, strong) UITextField *numberLabelText;
@property (nonatomic, strong) UITextField *gradeLabelText;





@end

NS_ASSUME_NONNULL_END
