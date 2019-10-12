//
//  RegisterViewController.h
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/11.
//  Copyright © 2019 ABC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterViewControllerDelegate <NSObject>

- (void)setUsername:(NSString *)username AndPassword:(NSString *)passWord;

@end

@interface RegisterViewController : UIViewController

@property (nonatomic, strong) UITextField *userName;
@property (nonatomic, strong) UITextField *passWord;
@property (nonatomic, weak) id<RegisterViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
