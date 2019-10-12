//
//  DelegateNextViewController.h
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/19.
//  Copyright © 2019 ABC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentNSObject.h"

@protocol DelegateNextViewControllerDelegate <NSObject>

- (void)delegate:(NSMutableArray *_Nullable)delegatedArray;

@end

NS_ASSUME_NONNULL_BEGIN

@interface DelegateNextViewController : UIViewController


//用来传值
@property StudentNSObject *studentNSObject1;
@property NSMutableArray *delegateArray;

@property (nonatomic, weak) id<DelegateNextViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
