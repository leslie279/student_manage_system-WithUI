//
//  DeleteViewController.h
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/16.
//  Copyright © 2019 ABC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeleteViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DelegateViewControllerDelegate <NSObject>

- (void)dele:(NSMutableArray *)delegateArray;

@end

@interface DeleteViewController : UIViewController

@property NSMutableArray *delegateArray1;
@property (nonatomic, weak) id<DelegateViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
