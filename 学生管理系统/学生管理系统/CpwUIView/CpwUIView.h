//
//  CpwUIView.h
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/17.
//  Copyright © 2019 ABC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CpwUIView : UIView

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *classLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *gradeLabel;

@property UITextField *nameLabelText;
@property UITextField *ageLabelText;
@property UITextField *classLabelText;
@property UITextField *numberLabelText;
@property UITextField *gradeLabelText;


@end

NS_ASSUME_NONNULL_END
